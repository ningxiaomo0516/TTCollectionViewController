//
//  TTClubCollectionViewCell.h
//  SCDropDownMenu
//
//  Created by 宁小陌 on 2019/6/20.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TTClubCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) UILabel *textLabel;
//方块视图的缓存池标示
+ (NSString *)cellIdentifier;
// 获取方块视图对象
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
