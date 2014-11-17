//
//  LineCollectionViewLayout.m
//  collectionView
//
//  Created by broy denty on 14-9-24.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "LineCollectionViewLayout.h"

@implementation LineCollectionViewLayout
-(id)init
{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(270, 400);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsMake(200, 0.0, 200, 0.0);
        self.minimumLineSpacing = 10.0;
//        self.minimumInteritemSpacing = 20;
    }
    return self;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
//    [self layoutAttributesForElementsInRect:CGRectMake(proposedContentOffset.x, proposedContentOffset.y, 100, 100)];
//    移动到屏幕中心
    CGFloat offDistance = MAXFLOAT;
    CGRect proposeRect = CGRectMake(proposedContentOffset.x, proposedContentOffset.y, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    NSArray * attributesLayout = [self layoutAttributesForElementsInRect:CGRectMake(proposedContentOffset.x, proposedContentOffset.y, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height)];
    for (UICollectionViewLayoutAttributes * attributeLayer in attributesLayout) {
        if (CGRectIntersectsRect(attributeLayer.frame, proposeRect)) {
                CGFloat tempDistance = attributeLayer.center.x - (proposeRect.origin.x+self.collectionView.frame.size.width/2);
            if (ABS(offDistance)>ABS(tempDistance))
            {
                offDistance = tempDistance;
            }
        }
    }
    NSLog(@"%f,%f",velocity.x,velocity.y);
    return CGPointMake(proposeRect.origin.x+offDistance, proposeRect.origin.y);
}

//- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
//{
//    CGRect visiableRect = CGRectMake(self.collectionView.contentOffset.x, self.collectionView.contentOffset.y, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
//    CGFloat maxDistance = (self.itemSize.width/2+self.collectionView.bounds.size.width/2);
//    NSMutableArray *refactorArray;
//    NSArray *originArray = [super layoutAttributesForElementsInRect:rect];
//    for (UICollectionViewLayoutAttributes * layoutAttribute in originArray) {
//        CGFloat offdistance = layoutAttribute.center.x-(rect.origin.x+self.collectionView.bounds.size.width/2);
//        if (maxDistance<offdistance) {
//            NSLog(@"%f----------%f",maxDistance,offdistance);
//            NSLog(@"%d",originArray.count);
//        }
//    }
//    return [super layoutAttributesForElementsInRect:rect];
//}
@end
