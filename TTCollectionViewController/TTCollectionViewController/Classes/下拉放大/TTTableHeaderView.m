//
//  TTTableHeaderView.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/7/8.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTTableHeaderView.h"

@implementation TTTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
        self.backgroundColor = [UIColor clearColor];
        self.imagesView.image = [UIImage imageNamed:@"c7_mine_背景_x"];
    }
    return self;
}

- (void) initView{
    [self addSubview:self.imagesView];
    [self.imagesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
}

- (UIImageView *)imagesView{
    if (!_imagesView) {
        _imagesView = [[UIImageView alloc] init];
    }
    return _imagesView;
}

@end
