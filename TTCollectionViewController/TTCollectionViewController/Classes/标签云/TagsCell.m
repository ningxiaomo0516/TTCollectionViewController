//
//  TagsCell.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/12/30.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TagsCell.h"

@implementation TagsCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kColorWithRGB(248, 248, 248);
        [self initView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = kColorWithRGB(248, 248, 248);
        [self initView];
    }
    return self;
}

- (void) initView{
    self.contentView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.contentView.layer.borderWidth = 0.65;
    [self addSubview:self.titlelabel];
    [self.titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (UILabel *)titlelabel{
    if (!_titlelabel) {
        _titlelabel = [[UILabel alloc] init];
        _titlelabel.textColor = kColorWithRGB(211, 0, 0);
        _titlelabel.font = [UIFont systemFontOfSize:15.f];
        _titlelabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titlelabel;
}
@end
