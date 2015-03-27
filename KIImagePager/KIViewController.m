//
//  KIViewController.m
//  KIImagePager
//
//  Created by Marcus Kida on 07.04.13.
//  Copyright (c) 2013 Marcus Kida. All rights reserved.
//

#import "KIViewController.h"

@interface KIViewController () <KIImagePagerDelegate, KIImagePagerDataSource>
{
    IBOutlet KIImagePager *_imagePager;
}
@end

@implementation KIViewController
{
    
    NSInteger currentIndex; // current selected image index
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.left.hidden = YES;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _imagePager.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    _imagePager.pageControl.pageIndicatorTintColor = [UIColor blackColor];
//    _imagePager.slideshowTimeInterval = 5.5f;
    _imagePager.slideshowShouldCallScrollToDelegate = YES;
}

#pragma mark - KIImagePager DataSource
- (NSArray *) arrayWithImages:(KIImagePager*)pager
{
    self.arrImages = @[
                       @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen1.png",
                       @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen2.png",
                       @"https://raw.github.com/kimar/tapebooth/master/Screenshots/Screen3.png"
                       ];
    return self.arrImages;
}
- (IBAction)next:(id)sender {
    _imagePager.currentPage = currentIndex +1;
    currentIndex = currentIndex +1;
    [self setStatusForNextPrevButton];
}
- (IBAction)previous:(id)sender {
    _imagePager.currentPage = currentIndex -1;
    currentIndex= currentIndex -1;
    [self setStatusForNextPrevButton];
}

- (UIViewContentMode) contentModeForImage:(NSUInteger)image inPager:(KIImagePager *)pager
{
    return UIViewContentModeScaleAspectFill;
}

- (NSString *) captionForImageAtIndex:(NSUInteger)index inPager:(KIImagePager *)pager
{
    return @[
             @"First screenshot",
             @"Another screenshot",
             @"Last one! ;-)"
             ][index];
}
- (void)setStatusForNextPrevButton
{
    NSInteger lastIndex = self.arrImages.count - 1;
    NSLog(@"count %ld index %lu",(long)lastIndex,(unsigned long)index);
    if (currentIndex == 0)                         // first screen shot
    {
        self.left.hidden = YES;
    }
    else if(currentIndex == lastIndex)
    {
        self.right.hidden = YES;
    }
    else                                    // last screen shot
    {
        self.right.hidden = NO;
        self.left.hidden = NO;
    }

}
#pragma mark - KIImagePager Delegate
- (void) imagePager:(KIImagePager *)imagePager didScrollToIndex:(NSUInteger)index
{
    currentIndex = index;
    [self setStatusForNextPrevButton];
}

- (void) imagePager:(KIImagePager *)imagePager didSelectImageAtIndex:(NSUInteger)index
{
    NSLog(@"%s %lu", __PRETTY_FUNCTION__, (unsigned long)index);
}

@end
