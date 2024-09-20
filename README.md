# Cometter
[![Version](https://img.shields.io/cocoapods/v/YourLibraryName.svg?style=flat)](https://cocoapods.org/pods/Cometter)
[![License](https://img.shields.io/cocoapods/l/YourLibraryName.svg?style=flat)](https://cocoapods.org/pods/Cometter)
[![Platform](https://img.shields.io/cocoapods/p/YourLibraryName.svg?style=flat)](https://cocoapods.org/pods/Cometter)


## Requirements
- iOS 16.0+
- Xcode 12.0+
- Swift 5.0+

## Installation

### Podfile
```ruby
pod 'Cometter'
```

### Package.swift 
```swift
let package = Package(
  name: "MyPackage",
  dependencies: [
    .package(url: "https://github.com/gomminjae/Cometter.git")
  ],
  targets: [
    .target(name: "MyTarget", dependencies: ["Cometter"])
  ]
)
```
## At a Glance 

```swift
let cometter = Cometter()
cometter.particleImage = UIImage(named: "{your particle image}")
view.addSubview(cometter)
cometter.enableGestures = [.pin,.tap] // we have 2 gestures
```


## Author

gomminjae, gommj0611@naver.com

## License

cometter is available under the MIT license. See the LICENSE file for more info.
