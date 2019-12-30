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
        self.avatarView.image = [UIImage imageNamed:@"1801577716159_.pic_hd"];
        self.imagesView.image = [UIImage imageNamed:@"WechatIMG42"];
    }
    return self;
}

- (void) initView{
    [self addSubview:self.imagesView];
    [self.imagesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    
    [self addSubview:self.avatarView];
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(20));
        make.width.height.equalTo(@(60));
        make.bottom.equalTo(self.mas_bottom).offset(-20);
    }];
}

- (UIImageView *)imagesView{
    if (!_imagesView) {
        _imagesView = [[UIImageView alloc] init];
    }
    return _imagesView;
}

- (UIImageView *)avatarView{
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc] init];
    }
    return _avatarView;
}
@end
