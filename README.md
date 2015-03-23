# AsyncMediaSlider

[![CI Status](http://img.shields.io/travis/hyperoslo/AsyncMediaSlider.svg?style=flat)](https://travis-ci.org/hyperoslo/AsyncMediaSlider)
[![Version](https://img.shields.io/cocoapods/v/AsyncMediaSlider.svg?style=flat)](http://cocoadocs.org/docsets/AsyncMediaSlider)
[![License](https://img.shields.io/cocoapods/l/AsyncMediaSlider.svg?style=flat)](http://cocoadocs.org/docsets/AsyncMediaSlider)
[![Platform](https://img.shields.io/cocoapods/p/AsyncMediaSlider.svg?style=flat)](http://cocoadocs.org/docsets/AsyncMediaSlider)

## Usage

```objc
In your View Controller:

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];

    self.mediaPageViewController = [HYPMediaPageViewController new];

    [self.mediaPageViewController setImageURLStrings:@[@"http://lorempixel.com/640/640/sports",
                                                       @"http://lorempixel.com/g/640/640/transport",
                                                       @"http://lorempixel.com/640/640/food/"]
                             andPlaceholderImage:[UIImage imageNamed:@"hypPlaceholderImage"]];

    self.mediaPageViewController.view.frame = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.view.bounds), HYPMediaPageViewHeight);
    self.mediaPageViewController.view.center = self.view.center;
    
    [self.view addSubview:self.mediaPageViewController.view];
}
```

## Installation

**AsyncMediaSlider** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AsyncMediaSlider'
```

## Author

Hyper Interaktiv AS, ios@hyper.no

## License

**AsyncMediaSlider** is available under the MIT license. See the LICENSE file for more info.
