//
//  SafariExtensionViewController.swift
//  plex-to-iina Extension
//
//  Created by ned on 05/01/21.
//

import SwiftUI
import SafariServices

class PopoverViewWrapper: SFSafariExtensionViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        self.view = NSHostingView(rootView: PopoverView())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

struct PopoverView: View {
    var body: some View {
        VStack(spacing: 5) {
            Link("plex-to-iina", destination: URL(string: "https://github.com/n3d1117/plex-to-iina")!)
                .font(.title)
            HStack(spacing: 5) {
                Text("made with")
                Image(systemName: "heart.fill")
                    .imageScale(.small)
                    .foregroundColor(.red)
                Text("by ned")
            }
        }.padding(20)
    }
}
