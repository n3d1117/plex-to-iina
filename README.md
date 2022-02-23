# plex-to-iina
[![MIT License](https://img.shields.io/badge/License-MIT-blue)](https://opensource.org/licenses/mit-license.php)
[![Platform](http://img.shields.io/badge/platform-macOS-red.svg?style=flat)](https://developer.apple.com/resources/)
[![Platform](https://img.shields.io/badge/swift-5.0-orange.svg?style=flat)](https://swift.org/blog/swift-5-released/)

A Safari extension to play [Plex](https://www.plex.tv) content with [IINA](https://iina.io).

## Screenshot
![](https://user-images.githubusercontent.com/11541888/103807622-f7383e80-5056-11eb-9cf4-d54026ff0593.png)

## Requirements
* macOS with Safari >= 13
* [IINA](https://iina.io)
* [Plex](https://www.plex.tv) media server (note: it works with shared servers but only if you're the owner)
## Build instructions
* Clone this repository:

```bash
git clone https://github.com/n3d1117/plex-to-iina.git
```
* Open `plex-to-iina.xcodeproj` in Xcode:

```bash
cd plex-to-iina/
open plex-to-iina.xcodeproj
```

* Optional: If you're using your own domain on your Plex server, please add that into `plex-to-iina/plex-to-iina Extension/Info.plist` and `NSExtension -> SFSafariWebsiteAccess -> AllowedDomains` section before building the project. 
* Choose your identity for Development Team under project settings. (you can set that up with a regular Apple ID, no need for Apple Development Program)
* Build and run the `plex-to-iina` scheme!

**NOTE**: If you’re not part of the Apple Development Program, the extension might not show up in Safari Extensions preferences. To show it, you need to enable `Allow Unsigned Extensions` from the `Develop` menu.
You can read more about this in the [official documentation](https://developer.apple.com/documentation/safariservices/safari_app_extensions/building_a_safari_app_extension).

## License
MIT License. See [LICENSE](LICENSE) file for further information.
