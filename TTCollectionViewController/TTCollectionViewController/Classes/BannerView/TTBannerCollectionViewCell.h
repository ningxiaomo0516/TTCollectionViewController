//
//  TTBannerCollectionViewCell.h
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/6/20.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BannerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTBannerCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView   *imagesView;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UIView        *boxView;
@property (nonatomic, strong) UIImageView   *imagesViewBottom;
@property (nonatomic, strong) UILabel       *countLabel;
@property (nonatomic, strong) BannerModel   *bannerModel;
@end

NS_ASSUME_NONNULL_END
