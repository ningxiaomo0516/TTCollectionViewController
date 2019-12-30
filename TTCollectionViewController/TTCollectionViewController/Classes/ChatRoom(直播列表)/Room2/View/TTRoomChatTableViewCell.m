//
//  TTRoomChatTableViewCell.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/7/1.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTRoomChatTableViewCell.h"
#import "MessageModel.h"
#import <YYKit.h>

@interface TTRoomChatTableViewCell()

/// 显示消息内容的Label
@property (nonatomic, strong) YYLabel *messsageLabel;
@property (nonatomic, strong) UIView *messageView;

@end
@implementation TTRoomChatTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.messageView];
        [self.contentView addSubview:self.messsageLabel];
    }
    return self;
}

- (void)setMessageModel:(MessageModel *)messageModel{
    _messageModel = messageModel;
    // 进行数据赋值
    // 创建一个可变属性字符串
    NSMutableAttributedString *finalStr = [[NSMutableAttributedString alloc]init];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = 3;
    
    UIImage *image = [UIImage imageNamed:@"dengji_1"]; // 测试数据
    NSMutableAttributedString *attachText = [NSMutableAttributedString attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:kFontSizeMedium15 alignment:YYTextVerticalAlignmentCenter];
    [finalStr appendAttributedString:attachText];
    [finalStr appendAttributedString:[[NSAttributedString alloc] initWithString:self.messageModel.username attributes:@{NSFontAttributeName : kFontSizeMedium15,NSForegroundColorAttributeName:kWhiteColor}]];
    
    [finalStr appendAttributedString:[[NSAttributedString alloc] initWithString:self.messageModel.message attributes:@{NSFontAttributeName : kFontSizeMedium15,NSForegroundColorAttributeName:[UIColor yellowColor],NSParagraphStyleAttributeName:paragraphStyle}]];
    
    [finalStr addAttributes:@{NSParagraphStyleAttributeName:paragraphStyle} range:NSMakeRange(0, finalStr.length)];
    
    
    self.messsageLabel.attributedText = finalStr;
    
    // 很关键 宽度一定要准确 (250 是tableview的宽度,-10是让文本左右留出10的宽度)
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(250 - 10.0f, MAXFLOAT)];
    YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:container text:self.messsageLabel.attributedText];
    self.messsageLabel.textLayout = textLayout;
    
    self.messsageLabel.frame = CGRectMake(4,4, textLayout.textBoundingSize.width, textLayout.textBoundingSize.height);
    self.messageView.frame = CGRectMake(0, 0, self.messsageLabel.width + 8, self.messsageLabel.height + 6);
}


// 根绝数据计算cell的高度
- (CGFloat)heightForModel:(MessageModel *)messageModel {
    
    [self setMessageModel:messageModel];
    // 很关键
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(250 - 10.0f, MAXFLOAT)];
    YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:container text:self.messsageLabel.attributedText];
    CGSize __labelSize = textLayout.textBoundingSize;
    return __labelSize.height + 15;
}

#pragma mark - lazy
- (YYLabel *)messsageLabel {
    
    if (!_messsageLabel) {
        _messsageLabel = [[YYLabel alloc]init];
        _messsageLabel.numberOfLines = 0;
        _messsageLabel.textAlignment = NSTextAlignmentLeft;
        _messsageLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _messsageLabel.displaysAsynchronously = YES;
        _messsageLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    }
    return _messsageLabel;
}

- (UIView *)messageView {
    if (!_messageView) {
        _messageView = [[UIView alloc]init];
        _messageView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.25];
        // 如果切原价卡顿的话,可以使用背景图
        _messageView.layer.cornerRadius = 4;
        _messageView.layer.masksToBounds = YES;
    }
    return _messageView;
}


@end
