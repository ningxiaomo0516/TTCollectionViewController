//
//  RadioCell.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/12/30.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "RadioCell.h"

@implementation RadioCell
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

- (IBAction)selectButton:(id)sender {
    if (self.ClickImageButton) {
        self.ClickImageButton();
    }
}

- (void) initView{
    [self addSubview:self.imageButton];
    [self.imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self);
    }];
}

- (UIButton *)imageButton{
    if (!_imageButton) {
        _imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_imageButton addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
        [_imageButton setImage:[UIImage imageNamed:@"deselect"] forState:UIControlStateNormal];
        [_imageButton setImage:[UIImage imageNamed:@"select"] forState:UIControlStateSelected];
    }
    return _imageButton;
}
@end
