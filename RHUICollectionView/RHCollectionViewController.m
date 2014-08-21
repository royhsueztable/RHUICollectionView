//
//  RHCollectionViewController.m
//  RHUICollectionView
//
//  Created by Roy Hsu on 2014/8/21.
//  Copyright (c) 2014年 Roy Hsu. All rights reserved.
//

#import "RHCollectionViewController.h"

@interface RHCollectionViewController ()

@end

@implementation RHCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setup];
}

- (void)setup
{
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (UIColor *)getRandomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    return color;
}


#pragma mark - UICollectionViewController data source.

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure cell...
    cell.backgroundColor = [self getRandomColor];
    
    return cell;
}


#pragma mark - RACollectionViewDelegateTripletLayout delegate.

- (CGSize)collectionView:(UICollectionView *)collectionView sizeForLargeItemsInSection:(NSInteger)section
{
    return CGSizeMake(200, 200);
}

- (CGFloat)minimumInteritemSpacingForCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

- (CGFloat)minimumLineSpacingForCollectionView:(UICollectionView *)collectionView
{
    return 5;
}


@end
