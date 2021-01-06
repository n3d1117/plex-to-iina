//
//  SafariExtensionHandler.swift
//  plex-to-iina Extension
//
//  Created by ned on 05/01/21.
//

import SafariServices

class SafariExtensionHandler: SFSafariExtensionHandler {
    
    override func popoverViewController() -> SFSafariExtensionViewController {
        PopoverViewWrapper()
    }
    
    override func messageReceived(withName messageName: String, from page: SFSafariPage, userInfo: [String : Any]?) {
        launchIINA(withURL: messageName)
    }
    
    // Source: https://github.com/iina/iina/tree/develop/OpenInIINA
    fileprivate func launchIINA(withURL url: String) {
        guard let escapedURL = url.addingPercentEncoding(withAllowedCharacters: .alphanumerics),
              let url = URL(string: "iina://weblink?url=\(escapedURL)") else {
            return
        }
        NSWorkspace.shared.open(url)
    }
    
}
