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

private let ProjectURL = "https://github.com/n3d1117/plex-to-iina"

struct PopoverView: View {
    var body: some View {
        VStack(spacing: 5) {
            if #available(OSXApplicationExtension 11.0, *) {
                Link("plex-to-iina", destination: URL(string: ProjectURL)!)
                    .font(.title)
            } else {
                // Fallback on earlier versions
                Button("plex-to-iina", action: {
                    () -> Void
                    in
                    NSWorkspace.shared.open(URL(string: ProjectURL)!)
                })
                    .buttonStyle(PlainButtonStyle())
                    .font(.title)
                    .foregroundColor(.blue)
            }
            HStack(spacing: 5) {
                Text("made with")
                if #available(OSXApplicationExtension 11.0, *) {
                    Image(systemName: "heart.fill")
                } else {
                    Text("􀊵")
                        .foregroundColor(.red)
                }
                Text("by ned")
            }
        }.padding(20)
    }
}
