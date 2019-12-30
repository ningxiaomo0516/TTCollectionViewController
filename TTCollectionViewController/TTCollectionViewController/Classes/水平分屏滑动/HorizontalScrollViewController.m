//
//  HorizontalScrollViewController.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/12/31.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "HorizontalScrollViewController.h"
#import <Masonry/Masonry.h>
#import "HorizontalScrollCell.h"
#import "HorizontalScrollLayout.h"

static NSString * const reuseIdentifier = @"HorizontalScrollCell";
@interface HorizontalScrollViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, weak) UIPageControl *pageControl;
@end

@implementation HorizontalScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO ;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HorizontalScrollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%td",indexPath.item];
    return cell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger page = floor(scrollView.contentOffset.x) / self.view.bounds.size.width;
    if ( page >=0 && page <= self.pageControl.numberOfPages ){
        self.pageControl.currentPage = page;
    }
}

#pragma mark - lazy

- (UICollectionView*)collectionView{
    if (!_collectionView) {
        HorizontalScrollLayout *layout = [[HorizontalScrollLayout alloc]init];
        layout.itemSize = CGSizeMake((self.view.bounds.size.width-10-8)/4, (300-4)/3);
        layout.minimumInteritemSpacing = 2;
        layout.minimumLineSpacing = 2;
        layout.numberOfItemsInPage = 16;
        layout.columnsInPage = 4;
        layout.pageInset = UIEdgeInsetsMake(0, 5, 0, 5);
        
        UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        collection.backgroundColor = [UIColor whiteColor];
        collection.pagingEnabled = YES;
        collection.delegate   = self;
        collection.dataSource = self;
        [collection registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
        [self.view addSubview:collection];
        [self.view bringSubviewToFront:self.pageControl];
        _collectionView = collection;
        [collection mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(@200);
            make.height.mas_equalTo(@300);
            make.left.right.mas_equalTo(@0);
        }];
    }
    return _collectionView;
}

- (UIPageControl*)pageControl{
    if (!_pageControl) {
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.numberOfPages = 7;
        pageControl.currentPage   = 0;
        pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
        [self.view addSubview:pageControl];
        _pageControl = pageControl;
        [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.collectionView.mas_bottom).mas_offset(@5);
            make.left.mas_equalTo(@50);
            make.right.mas_equalTo(@(-50));
        }];
    }
    return _pageControl;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
