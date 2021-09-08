// Constant classes
const ACTION_BAR = "ActionButtonBar-bar"
const MENU_SCROLLER = "Menu-menuScroller"
const DESCENDANT_LIST = "PrePlayDescendantList-listContainer"

// Check at first load
document.addEventListener("DOMContentLoaded", function(event) {
    check();
});

// Check on content change
window.addEventListener('locationchange', function() {
    check();
})

// Inject button if needed
function check() {
    if (window.location.href.includes("/server/")) {
        checkInject(function(shouldInject) {
            if (shouldInject) {
                go();
            }
        });
    }
}

// Returns true if media is directly playable (e.g. movie and single episode)
// Note: does not work for Music
function checkInject(callback) {
    // Get action bar
    waitForElement(ACTION_BAR).then(el => {
        setTimeout(function() {
            // Media is playable if there's not a descendant list
            callback(queryClasses(document, DESCENDANT_LIST).length === 0);
        }, 500);
    });
}

// Inject custom button
function go() {
    
    // Get action bar
    var el = queryClasses(document, ACTION_BAR)[0];
    
    if (el.querySelector("#id-iina") == null) { // make sure we only add the custom button once

        // Get more button
        var more_button = el.querySelector('[data-qa-id="preplay-more"]');
        if (more_button == null) {
            more_button = el.querySelector('[data-testid="preplay-more"]');
        }

        // Clone it
        var cloned = more_button.cloneNode(true);

        // Customize it
        cloned.id = 'id-iina';
        while (cloned.hasChildNodes()) {
            cloned.removeChild(cloned.lastChild);
        }
        cloned.textContent = '\xa0\xa0\xa0play with iina\xa0\xa0\xa0';

        // Add click action
        cloned.addEventListener('click', function() {

            // Click more button once to get download link
            more_button.click();
            
            // Get the menu
            waitForElement(MENU_SCROLLER).then(menu => {
                
                // Get link and dispatch it to SafariExtensionHandler
                var dl = menu.querySelector('[target="downloadFileFrame"]');
                if (dl) {
                    safari.extension.dispatchMessage(dl.href);
                }

                // Click more button once again to close the menu
                more_button.click();
            });
        }, false);

        // Append custom button after more button
        more_button.parentNode.insertBefore(cloned, more_button.nextSibling);
    }
}

// Source: https://stackoverflow.com/a/52809105
history.pushState = ( f => function pushState(){
    var ret = f.apply(this, arguments);
    window.dispatchEvent(new Event('pushstate'));
    window.dispatchEvent(new Event('locationchange'));
    return ret;
})(history.pushState);

history.replaceState = ( f => function replaceState(){
    var ret = f.apply(this, arguments);
    window.dispatchEvent(new Event('replacestate'));
    window.dispatchEvent(new Event('locationchange'));
    return ret;
})(history.replaceState);

window.addEventListener('popstate',()=>{
    window.dispatchEvent(new Event('locationchange'))
});

// Source: https://stackoverflow.com/a/61511955
function waitForElement(selector) {
    return new Promise(resolve => {
        if (queryClasses(document, selector)[0]) {
            return resolve(queryClasses(document, selector)[0]);
        }
        
        const observer = new MutationObserver(mutations => {
            if (queryClasses(document, selector)[0]) {
                resolve(queryClasses(document, selector)[0]);
                observer.disconnect();
            }
        });
        
        observer.observe(document.body, { childList: true, subtree: true });
    });
}

function queryClasses(document, className) {
    return document.querySelectorAll('[class^="' + className + '"],[class*=" ' + className + '"]')
}
