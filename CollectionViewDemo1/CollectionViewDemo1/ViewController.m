//
//  ViewController.m
//  CollectionViewDemo1
//
//  Created by liu on 15/12/31.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "LineLayout.h"
#import "CricleLayout.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *imageNames;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (NSMutableArray *)imageNames
{
    if (!_imageNames) {
        _imageNames = [NSMutableArray array];
        for (NSInteger i = 1; i <= 20; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%ld", (long)i];
            [_imageNames addObject:imageName];
        }
    }
    
    return _imageNames;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CricleLayout *layout = [[CricleLayout alloc] init];
    self.collectionView.collectionViewLayout = layout;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageNames.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    
    cell.imageName = self.imageNames[indexPath.row];
    
    return cell;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[LineLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[CricleLayout alloc] init] animated:YES];
    } else {
        [self.collectionView setCollectionViewLayout:[[LineLayout alloc] init] animated:YES];
    }
}

@end
