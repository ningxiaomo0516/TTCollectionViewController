//
//  TTClubCollectionViewController.m
//  SCDropDownMenu
//
//  Created by 宁小陌 on 2019/6/20.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTClubCollectionViewController.h"
#import "TTClubCollectionViewCell.h"
#import "TTClubCollectionHeaderView.h"
#import "TTClubCollectionFooterView.h"
#import "BannerModel.h"
#import "TTBannerViewCell.h"

#import "TTRoomChatViewController.h"
#import "TTMessageViewController.h"
#import "TTTableHeaderViewController.h"
#import "RadioCollectionViewController.h"
#import "TagsCollectionViewController.h"
#import "CardCollectionViewController.h"
#import "HorizontalScrollViewController.h"
#import "YKOrderViewController.h"
static NSString* reuseIdentifierBanner  = @"TTBannerViewCell";

@interface TTClubCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;//容器视图
@property (strong, nonatomic) NSMutableArray *bannerArray;

@end
@implementation TTClubCollectionViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"UICollectionView";
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark - UICollectionViewDataSource
//设置容器中有多少个组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 10;
}

// 设置每个组有多少个CollectionViewCell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return section+1;
}

// 设置方块的视图
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        TTBannerViewCell *tools = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierBanner forIndexPath:indexPath];
        tools.bannerArray = self.bannerArray;
        return tools;
    }else{
        //获取cell视图，内部通过去缓存池中取，如果缓存池中没有，就自动创建一个新的cell
        TTClubCollectionViewCell *cell=[TTClubCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
        cell.contentView.backgroundColor=kRandomColor;
        cell.textLabel.text = [NSString stringWithFormat:@"Cell %2ld",(long)indexPath.row];
        return cell;
    }
}

// 设置顶部视图和底部视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        //获取顶部视图
        TTClubCollectionHeaderView *headerView=[TTClubCollectionHeaderView headerViewWithCollectionView:collectionView forIndexPath:indexPath];
        //设置顶部视图属性
        headerView.backgroundColor=kViewColorNormal;
        NSString *titleText = @"";
        NSString *imageName = @"";
        UIColor *colorText;
        if (indexPath.section==1) {
            titleText = @"推荐";
            imageName = @"俱乐部_推荐";
            colorText = kColorWithRGB(176, 23, 23);
        }else if (indexPath.section==2) {
            titleText = @"热门";
            imageName = @"俱乐部_热门";
            colorText = kColorWithRGB(255, 108, 0);
        }else if (indexPath.section==3) {
            titleText = @"专区";
            imageName = @"俱乐部_体验课";
            colorText = kColorWithRGB(86, 206, 86);
        }else{
            titleText = @"精选";
            imageName = @"俱乐部_精选";
            colorText = kColorWithRGB(253, 195, 72);
        }
        headerView.imagesView.image = kGetImage(imageName);
        headerView.textLabel.text = titleText;
        headerView.textLabel.textColor = colorText;
        return headerView;
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        //获取底部视图
        TTClubCollectionFooterView *footerView=[TTClubCollectionFooterView footerViewWithCollectionView:collectionView forIndexPath:indexPath];
        //设置底部视图属性
        footerView.backgroundColor=kColorWithRGB(238, 238, 238);
        footerView.textLabel.text = @"";
        return footerView;
        
    }
    return nil;
}

#pragma mark - UICollectionViewDelegateFlowLayout
// 设置各个CollectionViewCell的大小尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat space = 10;
    CGFloat margin = 15*2;
    CGFloat width = (kScreenWidth-space*2-margin)/3;
    CGFloat height = width;
    if (indexPath.section==0) {
        width = kScreenWidth;
        height = 165;
    }else if(indexPath.section==1){
        width = (kScreenWidth-space*1-margin)/2;
    }else if(indexPath.section==2){
        width = (kScreenWidth-space*2-margin)/3;
    }else if(indexPath.section==3){
        width = (kScreenWidth-space*3-margin)/4;
        height = width;
    }
    return CGSizeMake(width, height);
}

/// Cell之间的列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (section==0) {
        return 0;
    }
    return 10;
}

/// Cell之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section==0) {
        return 0;
    }
    return 10;
}

// 设置每一组的上下左右间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section==0) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return UIEdgeInsetsMake(0, 15, 10, 15);
}
/// 设置Header的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(kScreenWidth,0);
    }
    return CGSizeMake(kScreenWidth,40);
}
/// 设置footer呈现的size, 如果布局是垂直方向的话，size只需设置高度，宽与collectionView一致
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(kScreenWidth,10);
}

#pragma mark - UICollectionViewDelegate
// CollectionViewCell被选中会调用
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            TTRoomChatViewController *vc = [[TTRoomChatViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            TTMessageViewController *vc = [[TTMessageViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else if (indexPath.section==2){
        if (indexPath.row==0) {
            TTTableHeaderViewController *vc = [[TTTableHeaderViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row==1){
            RadioCollectionViewController *vc = [[RadioCollectionViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            TagsCollectionViewController *vc = [[TagsCollectionViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else if(indexPath.section==3){
        if (indexPath.row==0) {
            CardCollectionViewController *vc = [[CardCollectionViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else if(indexPath.row==1){
            HorizontalScrollViewController *vc = [[HorizontalScrollViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else if(indexPath.row==2){
            YKOrderViewController *vc = [[YKOrderViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else{
//        NSString *tipsTxext = [NSString stringWithFormat:@"点击选择了第%ld组，第%ld个方块",(long)indexPath.section,(long)indexPath.row];
//        Toast(tipsTxext);
    }
}
// CollectionViewCell取消选中会调用
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *tipsTxext = [NSString stringWithFormat:@"取消选择第%ld组，第%ld个方块",(long)indexPath.section,(long)indexPath.row];
    Toast(tipsTxext);
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        // 创建布局对象
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        // 设置滚动方向为垂直滚动，说明方块是从左上到右下的布局排列方式
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //确定item的大小
        //        flowLayout.itemSize = CGSizeMake(100, 120);
        // 确定横向间距(设置行间距)
        flowLayout.minimumLineSpacing = 0;
        // 确定纵向间距(设置列间距)
        flowLayout.minimumInteritemSpacing = 0;
        // 确定距离上左下右的距离
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        // 设置顶部视图和底部视图的大小，当滚动方向为垂直时，设置宽度无效，当滚动方向为水平时，设置高度无效
        flowLayout.headerReferenceSize = CGSizeMake(100, 40);
        flowLayout.footerReferenceSize = CGSizeMake(100, 40);
        // 创建容器视图
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = kViewColorNormal;

        // 设置代理
        _collectionView.delegate = self;
        // 设置数据源
        _collectionView.dataSource = self;
        // 是否显示纵向滚动条
        _collectionView.showsVerticalScrollIndicator = NO;
        // 是否显示横向滚动条
        _collectionView.showsHorizontalScrollIndicator = NO;
        // 是否有弹簧效果
        _collectionView.bounces = YES;
        
        
        //注册容器视图中显示的方块视图
        [_collectionView registerClass:[TTClubCollectionViewCell class] forCellWithReuseIdentifier:[TTClubCollectionViewCell cellIdentifier]];
        // 注册Banner
        [_collectionView registerClass:[TTBannerViewCell class] forCellWithReuseIdentifier:reuseIdentifierBanner];
        
        //注册容器视图中显示的顶部视图
        [_collectionView registerClass:[TTClubCollectionHeaderView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:[TTClubCollectionHeaderView headerViewIdentifier]];
        
        //注册容器视图中显示的底部视图
        [_collectionView registerClass:[TTClubCollectionFooterView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                   withReuseIdentifier:[TTClubCollectionFooterView footerViewIdentifier]];
    }
    return _collectionView;
}

- (NSMutableArray *)bannerArray{
    if (!_bannerArray) {
        _bannerArray = [[NSMutableArray alloc] init];
        NSArray* titleArr = @[@"100张电影票 请你看大片!",@"1000张电影票 请你看大片!",@"10000张电影票 请你看大片!"];
        NSArray* imagesArr = @[@"c31_club_banner",@"c31_club_banner1",@"c31_club_banner2"];
        for (int j = 0; j < titleArr.count; j ++) {
            BannerModel *model = [[BannerModel alloc] init];
            model.titleText = [titleArr objectAtIndex:j];
            model.imagesName = [imagesArr objectAtIndex:j];
            [_bannerArray addObject:model];
        }
    }
    return _bannerArray;
}
@end
