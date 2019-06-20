//
//  TTBannerViewCell.h
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/6/20.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TTBannerViewCellCallBlock)(NSInteger idx);
@interface TTBannerViewCell : UICollectionViewCell
- (void)setBannerImagesDidOnClickCallBlock:(TTBannerViewCellCallBlock)block;
@property (nonatomic, strong) NSMutableArray *bannerArray;
@property (nonatomic, assign) BOOL isPageControl;
@end

NS_ASSUME_NONNULL_END
