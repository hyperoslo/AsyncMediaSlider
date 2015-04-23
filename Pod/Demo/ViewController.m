#import "ViewController.h"
#import "HYPMediaPageViewController.h"

static const CGFloat HYPMediaPageViewHeight = 357.0f;
static const CGFloat HYPMediaPageViewControlsHeight = 37.0f;

@interface ViewController ()

@property (nonatomic) HYPMediaPageViewController *mediaPageViewController;
@property (nonatomic) NSLayoutConstraint *mediaPageViewControllerHeightConstraint;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];

    self.mediaPageViewController = [HYPMediaPageViewController new];
    self.mediaPageViewController.view.translatesAutoresizingMaskIntoConstraints = NO;

    [self.mediaPageViewController setImageURLStrings:@[@"http://lorempixel.com/640/640/sports",
                                                       @"http://lorempixel.com/g/640/640/transport",
                                                       @"http://lorempixel.com/640/640/food/"]
                                 andPlaceholderImage:[UIImage imageNamed:@"hypPlaceholderImage"]];

    [self.view addSubview:self.mediaPageViewController.view];

    NSDictionary * views = @{@"mediaPageViewController": self.mediaPageViewController.view};

    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[mediaPageViewController]|"
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
                                   constant:HYPMediaPageViewControlsHeight/2.0f]];

    self.mediaPageViewControllerHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.mediaPageViewController.view
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0f
                                  constant:HYPMediaPageViewHeight];

    [self.mediaPageViewController.view addConstraint:self.mediaPageViewControllerHeightConstraint];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (CGRectGetHeight(self.view.bounds) > self.mediaPageViewControllerHeightConstraint.constant) {
        self.mediaPageViewControllerHeightConstraint.constant = HYPMediaPageViewHeight - 2.0 * HYPMediaPageViewControlsHeight;
    } else {
        self.mediaPageViewControllerHeightConstraint.constant = HYPMediaPageViewHeight;
    }
}

@end
