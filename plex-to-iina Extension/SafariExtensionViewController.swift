//
//  SafariExtensionViewController.swift
//  plex-to-iina Extension
//
//  Created by ned on 05/01/21.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {
    
    static let shared: SafariExtensionViewController = {
        let shared = SafariExtensionViewController()
        shared.preferredContentSize = NSSize(width:320, height:240)
        return shared
    }()

}
