//
//  CollectionViewCell.m
//  CollectionViewDemo1
//
//  Created by liu on 15/12/31.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CollectionViewCell

- (void)setImageName:(NSString *)imageName
{
    _imageName = [imageName copy];
    
    self.imageView.image = [UIImage imageNamed:imageName];
}


@end
