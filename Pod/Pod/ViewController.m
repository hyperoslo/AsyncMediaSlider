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

    self.mediaPageViewController = [HYPMediaPageViewController new];

    [self.mediaPageViewController setImageURLStrings:@[@"http://lorempixel.com/640/640/sports",
                                                       @"http://lorempixel.com/g/640/640/transport",
                                                       @"http://lorempixel.com/640/640/food/"]
                             andPlaceholderImage:[UIImage imageNamed:@"hypPlaceholderImage"]];

    self.mediaPageViewController.view.frame = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.view.bounds), HYPMediaPageViewHeight);
    self.mediaPageViewController.view.center = self.view.center;
    
    [self.view addSubview:self.mediaPageViewController.view];
}

@end
