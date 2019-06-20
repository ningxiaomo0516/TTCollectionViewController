//
//  TTClubCollectionHeaderView.h
//  SCDropDownMenu
//
//  Created by 宁小陌 on 2019/6/20.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TTClubCollectionHeaderView : UICollectionReusableView
@property (strong, nonatomic) UILabel *textLabel;
@property (strong, nonatomic) UIImageView *imagesView;

//顶部视图的缓存池标示
+ (NSString *)headerViewIdentifier;
//获取顶部视图对象
+ (instancetype)headerViewWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
