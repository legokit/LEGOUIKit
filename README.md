# LEGOUIKit

[![CI Status](https://img.shields.io/travis/564008993@qq.com/LEGOUIKit.svg?style=flat)](https://travis-ci.org/564008993@qq.com/LEGOUIKit)
[![Version](https://img.shields.io/cocoapods/v/LEGOUIKit.svg?style=flat)](https://cocoapods.org/pods/LEGOUIKit)
[![License](https://img.shields.io/cocoapods/l/LEGOUIKit.svg?style=flat)](https://cocoapods.org/pods/LEGOUIKit)
[![Platform](https://img.shields.io/cocoapods/p/LEGOUIKit.svg?style=flat)](https://cocoapods.org/pods/LEGOUIKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LEGOUIKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LEGOUIKit'
```

## SubSpec - LGNavigation
```
/**
 添加自定义view，不更改布局信息
 */
- (UIView *)addCustomView:(__kindof UIView *)customView
            clickCallBack:(itemCallback)callback;

/**
 添加titleView，内部自动适配 iPhone X
 */
- (void)addTitleView:(UIView *)titleView;

/**
 添加左部按钮
 */
- (LGNavigationButton *)addLeftButtonWithTitle:(NSString *)title
                                 clickCallBack:(itemCallback)callback;

- (LGNavigationButton *)addLeftButtonWithTitle:(NSString *)title
                                         image:(UIImage *)image
                                 clickCallBack:(itemCallback)callback;

- (LGNavigationButton *)addLeftButtonWithImage:(UIImage *)image
                                 clickCallBack:(itemCallback)callback;

/**
 添加右部按钮
 */
- (LGNavigationButton *)addRightButtonWithTitle:(NSString *)title
                                  clickCallBack:(itemCallback)callback;

- (LGNavigationButton *)addRightButtonWithTitle:(NSString *)title
                                          image:(UIImage *)image
                                  clickCallBack:(itemCallback)callback;

- (LGNavigationButton *)addRightButtonWithImage:(UIImage *)image
                                  clickCallBack:(itemCallback)callback;

```

## Author

564008993@qq.com, 564008993@qq.com

## License

LEGOUIKit is available under the MIT license. See the LICENSE file for more info.
