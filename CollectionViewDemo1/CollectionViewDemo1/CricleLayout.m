//
//  CricleLayout.m
//  CollectionViewDemo1
//
//  Created by liu on 15/12/31.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import "CricleLayout.h"

@implementation CricleLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < items; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        [array addObject:attr];
    }
    
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    
    attr.size = CGSizeMake(40, 40);
    
    CGFloat circleRadius = 100;
    CGPoint circleCenter = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
    
    CGFloat angleDetal = (2 * M_PI) / [self.collectionView numberOfItemsInSection:indexPath.section];
    CGFloat angle = indexPath.item * angleDetal;
    
    
    attr.center = CGPointMake(circleCenter.x + circleRadius * cosf(angle), circleCenter.y - circleRadius * sinf(angle));
    
    attr.zIndex = indexPath.item;
    
    return attr;
}

@end
