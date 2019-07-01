//
//  TTMessageCell.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/7/1.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTMessageCell.h"
@interface TTMessageCell ()
@property (nonatomic, strong) UILabel *messsageLabel;
@end

@implementation TTMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = kClearColor;
        self.backgroundColor = kClearColor;
        // 创建UI
        [self createUI];
    }
    
    return self;
}

- (void)createUI {
    /** 发言 */
    self.messsageLabel = [[UILabel alloc] init];
    self.messsageLabel.numberOfLines = 0;
    self.messsageLabel.preferredMaxLayoutWidth = 250-20;
    self.messsageLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.25];
    [self.contentView addSubview:self.messsageLabel];
    [self.messsageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(8);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-8);
    }];
}



- (void)setMessageModel:(MessageModel *)messageModel {
    // 创建一个可变属性字符串
    NSMutableAttributedString *finalStr = [[NSMutableAttributedString alloc] init];
    
    // 创建姓名
    NSAttributedString *nameStr = [[NSAttributedString alloc] initWithString:messageModel.username attributes:@{NSFontAttributeName: kFontSizeMedium15, NSForegroundColorAttributeName:kWhiteColor}];
    
    // 创建发言内容
    NSAttributedString *messageStr = [[NSAttributedString alloc] initWithString:messageModel.message attributes:@{NSFontAttributeName: kFontSizeMedium15, NSForegroundColorAttributeName: [UIColor yellowColor]}];
    
    // 拼接上两个字符串
    [finalStr appendAttributedString:nameStr];
    [finalStr appendAttributedString:messageStr];
    self.messsageLabel.attributedText = finalStr;
}

// 根绝数据计算cell的高度
- (CGFloat)heightForModel:(MessageModel *)messageModel {
    [self setMessageModel:messageModel];
    [self layoutIfNeeded];
    CGFloat cellHeight = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height+1;
    return cellHeight;
}

@end
