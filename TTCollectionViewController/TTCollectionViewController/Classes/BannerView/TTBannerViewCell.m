//
//  TTBannerViewCell.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/6/20.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTBannerViewCell.h"
#import "TYPageControl.h"
#import "TYCyclePagerView.h"
#import "TTBannerCollectionViewCell.h"

static NSString* reuseIdentifier = @"TTBannerCollectionViewCell";
@interface TTBannerViewCell()<TYCyclePagerViewDataSource,TYCyclePagerViewDelegate>
@property (nonatomic, strong) TYCyclePagerView *pagerView;
@property (nonatomic, strong) TYPageControl *pageControl;
@property (nonatomic, copy)TTBannerViewCellCallBlock callBlock;

@end

@implementation TTBannerViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self initView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor clearColor];
        [self initView];
    }
    return self;
}

- (void)setBannerImagesDidOnClickCallBlock:(TTBannerViewCellCallBlock)block{
    self.callBlock = block;
}

- (void)setBannerArray:(NSMutableArray *)bannerArray{
    _bannerArray = bannerArray;
    [self initView];
}


- (void) initView{
    [self addPagerView];
    if (self.bannerArray.count>1) {
        self.pagerView.autoScrollInterval = 3;//自动轮播时间
    }
    self.pageControl.numberOfPages = self.bannerArray.count;
    [self.pagerView reloadData];
}

- (void)addPagerView {
    
    [self addSubview:self.pagerView];
    //    [self.pagerView lz_setCornerRadius:3.0];
    
    [self.pagerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.bottom.equalTo(self);
    }];
    
    /// 需要显示
    if (self.isPageControl) {
        [self addPageControl];
        [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.pagerView.mas_bottom).offset(-15);
            make.centerX.equalTo(self);
        }];
    }else{
        /// 显示数字
        
        //        TTLog(@" - -- 11111 ");
    }
}

#pragma mark - TYCyclePagerViewDataSource

- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return self.bannerArray.count;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    TTBannerCollectionViewCell *tools = [pagerView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndex:index];
    tools.bannerModel = self.bannerArray[index];
    tools.boxView.hidden = self.isPageControl;
    tools.countLabel.text = [NSString stringWithFormat:@"%ld/%ld",index+1,(unsigned long)self.bannerArray.count];
    if (self.bannerArray.count == 1) {
        tools.countLabel.hidden = true;
    }
    return tools;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.itemSpacing = 0.0;//间距
    layout.itemVerticalCenter = YES;
    layout.minimumAlpha = 0.3;
    layout.itemSize = CGSizeMake(self.frame.size.width,self.frame.size.height);
    return layout;
}


- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    _pageControl.currentPage = toIndex;
    //[_pageControl setCurrentPage:newIndex animate:YES];
    //    TTLog(@"%ld ->  %ld",fromIndex,toIndex);
}

- (TYCyclePagerView *)pagerView{
    if (!_pagerView) {
        _pagerView = [[TYCyclePagerView alloc]  init];
        [_pagerView registerClass:[TTBannerCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        _pagerView.dataSource = self;
        _pagerView.delegate = self;
        _pagerView.isInfiniteLoop = YES;//是否回到第一页
        _pagerView.autoScrollInterval = 3;//自动轮播时间
    }
    return _pagerView;
}

- (void)addPageControl {
    TYPageControl *pageControl = [[TYPageControl alloc]init];
    //pageControl.numberOfPages = _datas.count;
    pageControl.currentPageIndicatorSize = CGSizeMake(6, 6);
    pageControl.pageIndicatorSize = CGSizeMake(6, 6);
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageControl.pageIndicatorTintColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    //    pageControl.pageIndicatorImage = kGetImage(@"live_gunlun_nor");
    //    pageControl.currentPageIndicatorImage = kGetImage(@"live_gunlun_press");
    //    pageControl.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    //    pageControl.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //    pageControl.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //    [pageControl addTarget:self action:@selector(pageControlValueChangeAction:) forControlEvents:UIControlEventValueChanged];
    [_pagerView addSubview:pageControl];
    _pageControl = pageControl;
}
@end
