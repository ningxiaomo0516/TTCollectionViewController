//
//  CardCollectionViewController.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/12/30.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "CardCollectionViewController.h"
#import "CardLayout.h"
#import "CardCollectionViewCell.h"

@interface CardCollectionViewController ()

@end

@implementation CardCollectionViewController

static NSString * const reuseIdentifier = @"CardCollectionViewController";
- (instancetype)init{
    CardLayout *layout = [[CardLayout alloc]init];
    layout.minimumLineSpacing = -5 ;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.itemSize = CGSizeMake(kScreenWidth - 11, 110);
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[CardCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.titleLabel.backgroundColor = kRandomColor;
    cell.titleLabel.text = [NSString stringWithFormat:@"--%td--",indexPath.item];
    return cell;
}

@end
