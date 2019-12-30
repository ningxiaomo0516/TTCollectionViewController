//
//  HorizontalScrollCell.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/12/31.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "HorizontalScrollCell.h"

@implementation HorizontalScrollCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kColorWithRGB(222, 222, 222);
        [self initView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = kColorWithRGB(222, 222, 222);
        [self initView];
    }
    return self;
}

- (void) initView{
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(20));
        make.centerY.equalTo(self);
    }];
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = kColorWithRGB(211, 0, 0);
        _titleLabel.font = [UIFont systemFontOfSize:15.f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
@end
