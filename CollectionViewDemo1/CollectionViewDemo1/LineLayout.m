//
//  LineLayout.m
//  CollectionViewDemo1
//
//  Created by liu on 15/12/31.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import "LineLayout.h"

#define kImageHW 180

@implementation LineLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (void)prepareLayout
{
    [super prepareLayout];

    self.itemSize = CGSizeMake(kImageHW, kImageHW + 20);
    CGFloat inset = (self.collectionView.frame.size.width - kImageHW) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = kImageHW * 0.2;
}


- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{    
    //停止后的rect
    CGRect lastRect;
    lastRect.size = self.collectionView.frame.size;
    lastRect.origin = proposedContentOffset;
    
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    //取出听之后显示在屏幕范围的attr
    NSArray *array = [super layoutAttributesForElementsInRect:lastRect];
    
    CGFloat adjustDisX = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in array) {
        if (ABS(attr.center.x - centerX) < ABS(adjustDisX)) {
            adjustDisX = attr.center.x - centerX;
        }
    }
    
    return [super targetContentOffsetForProposedContentOffset:CGPointMake(proposedContentOffset.x + adjustDisX, proposedContentOffset.y) withScrollingVelocity:velocity];
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //当前的区域
    CGRect visiableRect;
    visiableRect.origin = self.collectionView.contentOffset;
    visiableRect.size = self.collectionView.bounds.size;
    
    //中心点x
    CGFloat centerX = visiableRect.origin.x + self.collectionView.bounds.size.width * 0.5;
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes *attr in array) {
        //过滤不在屏幕范围的attr
        if(!CGRectIntersectsRect(visiableRect, attr.frame)) continue;
        
        CGFloat itemCenterX = attr.center.x;
        
        CGFloat scale = 1 + 0.2 * (1 - (ABS(itemCenterX - centerX) / 150));
        attr.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return array;
}

@end
