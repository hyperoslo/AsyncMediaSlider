#import "ViewController.h"
#import "HYPMediaPageViewController.h"

static const CGFloat HYPMediaPageViewHeight = 357.0f;

@interface ViewController ()

@property (nonatomic, strong) HYPMediaPageViewController *mediaPageViewController;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];

    [self.view addSubview:self.mediaPageViewController.view];

    NSDictionary *views = @{@"mediaPageView": self.mediaPageViewController.view};

    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[mediaPageView]|"
                                             options:0
                                             metrics:nil
                                               views:views]];

    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.mediaPageViewController.view
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1.0f
                                   constant:0.0f]];
}

#pragma mark - Getters

- (HYPMediaPageViewController *)mediaPageViewController
{
    if (_mediaPageViewController) return _mediaPageViewController;

    _mediaPageViewController = [HYPMediaPageViewController new];
    _mediaPageViewController.view.translatesAutoresizingMaskIntoConstraints = NO;

    [_mediaPageViewController setImageURLStrings:@[@"http://lorempixel.com/640/640/sports",
                                                   @"http://lorempixel.com/g/640/640/transport",
                                                   @"http://lorempixel.com/640/640/food/"]
                             andPlaceholderImage:[UIImage imageNamed:@"hypPlaceholderImage"]];

    [_mediaPageViewController.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.mediaPageViewController.view
                                  attribute:NSLayoutAttributeHeight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                  attribute:NSLayoutAttributeNotAnAttribute
                                 multiplier:1.0f
                                   constant:HYPMediaPageViewHeight]];

    return _mediaPageViewController;
}

@end
