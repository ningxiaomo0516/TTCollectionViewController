//
//  TTBannerCollectionViewCell.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/6/20.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTBannerCollectionViewCell.h"

@implementation TTBannerCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kClearColor;
        [self initView];
        self.titleLabel.text = @"100张电影票 请你看大片!";
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = kWhiteColor;
        [self initView];
    }
    return self;
}

- (void)setBannerModel:(BannerModel *)bannerModel{
    _bannerModel = bannerModel;
    self.imagesView.image = kGetImage(bannerModel.imagesName);
    self.titleLabel.text = bannerModel.titleText;
}

- (void) initView {
    [self.contentView addSubview:self.imagesView];
    [self.imagesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    
    [self.contentView addSubview:self.boxView];
    [self.boxView addSubview:self.imagesViewBottom];
    [self.boxView addSubview:self.titleLabel];
    [self.boxView addSubview:self.countLabel];
    
    [self.imagesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
    [self.boxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.equalTo(@(40));
    }];
    [self.imagesViewBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.boxView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(15));
        make.centerY.equalTo(self.boxView);
        make.right.equalTo(self.countLabel.mas_left);
    }];
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.boxView.mas_right).offset(-15);
        make.centerY.equalTo(self.boxView);
    }];
}

- (UIImageView *)imagesView{
    if (!_imagesView) {
        _imagesView = [[UIImageView alloc] init];
        //        _imagesView.contentMode = UIViewContentModeScaleAspectFit;;
        //        _imagesView.clipsToBounds = YES;
    }
    return _imagesView;
}

- (UIView *)boxView{
    if (!_boxView) {
        _boxView = [[UIView alloc] init];
        _boxView.backgroundColor = kClearColor;
        _boxView.hidden = YES;
    }
    return _boxView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = kWhiteColor;
        _titleLabel.font = kFontSizeMedium15;
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

- (UIImageView *)imagesViewBottom{
    if (!_imagesViewBottom) {
        _imagesViewBottom = [[UIImageView alloc] init];
        _imagesViewBottom.image = kGetImage(@"live_banner_bottom");
    }
    return _imagesViewBottom;
}

- (UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc] init];
        _countLabel.textColor = kWhiteColor;
        _countLabel.font = kFontSizeMedium12;
        _countLabel.numberOfLines = 1;
        _countLabel.textAlignment = NSTextAlignmentRight;
        [_countLabel sizeToFit];
    }
    return _countLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}
@end
