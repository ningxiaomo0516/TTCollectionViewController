//
//  TTClubCollectionViewCell.m
//  SCDropDownMenu
//
//  Created by 宁小陌 on 2019/6/20.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTClubCollectionViewCell.h"

@implementation TTClubCollectionViewCell
//方块视图的缓存池标示
+(NSString *)cellIdentifier{
    static NSString *cellIdentifier = @"CollectionViewCellIdentifier";
    return cellIdentifier;
}
//获取方块视图对象
+(instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath{
    TTClubCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:[TTClubCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    return cell;
    
}
//注册了方块视图后，当缓存池中没有底部视图的对象时候，自动调用alloc/initWithFrame创建
- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        UILabel *textLabel=[[UILabel alloc]init];
        textLabel.numberOfLines=0;
        textLabel.textAlignment=NSTextAlignmentCenter;
        textLabel.font=[UIFont systemFontOfSize:15];
        textLabel.textColor=[UIColor whiteColor];
        [self.contentView addSubview:textLabel];
        self.textLabel=textLabel;
        [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
        }];
    }
    return self;
}
@end
