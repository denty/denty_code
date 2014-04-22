//
//  CoverFlowView.m
//  MagicPuzzle
//
//  Created by broy denty on 14-4-21.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "CoverFlowView.h"
#import "iCarousel.h"
#import "SWSnapshotStackView.h"
@implementation CoverFlowView
{
    iCarousel *m_CoverFlow;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        m_CoverFlow = [[iCarousel alloc] initWithFrame:self.frame];
        [self addSubview:m_CoverFlow];
        [m_CoverFlow setDataSource:self];
        [m_CoverFlow setDelegate:self];
        [m_CoverFlow setType:iCarouselTypeInvertedTimeMachine];
    }
    return self;
}

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 10;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view;
{
    
    if (view == nil)
    {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 5, 300, 500)];
        SWSnapshotStackView *imageStackView = [[SWSnapshotStackView alloc] initWithFrame:CGRectMake(10, 110, 280, 280)];
        [imageStackView setTag:101];
        [view addSubview:imageStackView];
//        [imageStackView setDisplayAsStack:YES];
        NSLog(@"new");
    }
    SWSnapshotStackView *imageStackView = (SWSnapshotStackView *)[view viewWithTag:101];
    [imageStackView setContentMode:UIViewContentModeScaleAspectFit];
    imageStackView.image = [UIImage imageNamed:@"Lion_puzzle.jpg"];
//    [imageStackView setBackgroundColor:[UIColor redColor]];
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    [self.selectDelegate selectImageIndex:index];
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
        NSLog(@"%d",carousel.currentItemIndex);
}

- (void)refreshData:(NSArray*)data
{
    
}
@end
