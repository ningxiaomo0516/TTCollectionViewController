//
//  CardLayout.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/12/30.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "CardLayout.h"

@implementation CardLayout
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    //拿到当前可见区域内的布局属性
    NSArray *oldItems = [super layoutAttributesForElementsInRect:rect];
    //处理当前可见区域内的布局属性吸顶
    [oldItems enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *attributes, NSUInteger idx, BOOL *stop) {
        [self recomputeCellAttributesFrame:attributes];
    }];
    return oldItems;
}

- (void)recomputeCellAttributesFrame:(UICollectionViewLayoutAttributes *)attributes{
    //获取悬停处的y值
    CGFloat minY = CGRectGetMinY(self.collectionView.bounds) + self.collectionView.contentInset.top;
    //拿到布局属性应该出现的位置
    CGFloat finalY = MAX(minY, attributes.frame.origin.y);
    CGPoint origin = attributes.frame.origin;
    origin.y = finalY;
    attributes.frame = (CGRect){origin, attributes.frame.size};
    //根据IndexPath设置zIndex能确立顶部悬停的cell被后来的cell覆盖的层级关系
    attributes.zIndex = attributes.indexPath.row;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    //由于cell在滑动过程中会不断修改cell的位置，所以需要不断重新计算所有布局属性的信息
    return YES;
}
@end
