#import "HYPMediaPageItemViewController.h"

@implementation HYPMediaPageItemViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addSubview:self.imageView];

    NSDictionary *views = @{@"imageView": self.imageView};

    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|"
                                             options:0
                                             metrics:nil
                                               views:views]];

    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]|"
                                             options:0
                                             metrics:nil
                                               views:views]];
}

- (UIImageView *)imageView
{
    if (_imageView) return _imageView;

    _imageView = [UIImageView new];
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;

    return _imageView;
}

@end
