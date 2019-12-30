//
//  HorizontalScrollLayout.h
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/12/31.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/* 求显示页数 */
UIKIT_EXTERN NSUInteger numberOfPages(NSUInteger itemsInPage, NSUInteger totalCount);
@interface HorizontalScrollLayout : UICollectionViewFlowLayout
/* 每页缩进 */
@property (nonatomic, assign) UIEdgeInsets pageInset;

/* 每页包含的数量 */
@property (nonatomic, assign) NSUInteger numberOfItemsInPage;

/* 每页多少列 */
@property (nonatomic, assign) NSUInteger columnsInPage;
@end

NS_ASSUME_NONNULL_END
