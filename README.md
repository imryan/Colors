# Colors

[![CI Status](http://img.shields.io/travis/imryan/Colors.svg?style=flat)](https://travis-ci.org/imryan/Colors)
[![Version](https://img.shields.io/cocoapods/v/Colors.svg?style=flat)](http://cocoapods.org/pods/Colors)
[![License](https://img.shields.io/cocoapods/l/Colors.svg?style=flat)](http://cocoapods.org/pods/Colors)
[![Platform](https://img.shields.io/cocoapods/p/Colors.svg?style=flat)](http://cocoapods.org/pods/Colors)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![](colors.gif)

## Requirements

## Installation

Colors is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Colors'
```

## Usage

Fetch all color palettes
```swift
// Fetch all color palettes
Colors.fetchPalettes { (palettes) in
    if let palettes = palettes {
        // Retrieved palettes
    }
}
```

Fetch single color palette by its identifier
```swift
// Fetch one color palette
Colors.fetchPalette(withId: "57cad90de956653b3248cfdb") { (palette) in
    if let palette = palette {
        // Retrieved palette
    }
}
```

## Author

Ryan Cohen, notryancohen@gmail.com

## License

Colors is available under the MIT license. See the LICENSE file for more info.
