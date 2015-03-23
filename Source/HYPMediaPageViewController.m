#import "HYPMediaPageViewController.h"
#import "HYPMediaPageItemViewController.h"
#import "UIImageView+AFNetworking.h"

@interface HYPMediaPageViewController ()

@property (nonatomic) UIPageViewController *pageViewController;
@property (nonatomic) NSArray *imageURLStrings;
@property (nonatomic) UIImage *placeholderImage;

@end

@implementation HYPMediaPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addChildViewController:self.pageViewController];

    [self.view addSubview:self.pageViewController.view];

    NSDictionary *views = @{@"pageViewController": self.pageViewController.view};

    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[pageViewController]|"
                                             options:0
                                             metrics:nil
                                               views:views]];

    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[pageViewController]|"
                                             options:0
                                             metrics:nil
                                               views:views]];

    [self.pageViewController didMoveToParentViewController:self];
}

#pragma mark - Getters

- (UIPageViewController *)pageViewController
{
    if (_pageViewController) return _pageViewController;

    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    _pageViewController.view.translatesAutoresizingMaskIntoConstraints = NO;

    return _pageViewController;
}

#pragma mark - Public

- (void)setImageURLStrings:(NSArray *)imageURLStrings andPlaceholderImage:(UIImage *)placeholderImage
{
    self.placeholderImage = placeholderImage;
    self.imageURLStrings = imageURLStrings;

    if (!self.imageURLStrings || !self.imageURLStrings.count) return;

    [self.pageViewController setViewControllers:[NSArray arrayWithObject:[self viewControllerAtIndex:0]]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:nil];

    self.pageViewController.dataSource = self;
}

#pragma mark - UIPageControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((HYPMediaPageItemViewController *)viewController).index;

    if (index == 0) return nil;

    index--;

    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((HYPMediaPageItemViewController *)viewController).index;

    index++;

    if (index == self.imageURLStrings.count) return nil;

    return [self viewControllerAtIndex:index];
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    NSString *imageURL = self.imageURLStrings[index];

    HYPMediaPageItemViewController *mediaItemViewController = [HYPMediaPageItemViewController new];
    mediaItemViewController.index = index;

    [mediaItemViewController.imageView setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:self.placeholderImage];

    return mediaItemViewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return self.imageURLStrings.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
