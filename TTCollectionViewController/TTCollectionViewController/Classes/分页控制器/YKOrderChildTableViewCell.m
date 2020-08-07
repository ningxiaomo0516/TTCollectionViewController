//
//  YKOrderChildTableViewCell.m
//  FlightShare_live
//
//  Created by 宁小陌 on 2019/12/2.
//  Copyright © 2019 寜小陌. All rights reserved.
//

#import "YKOrderChildTableViewCell.h"

@implementation YKOrderChildTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/// Cell视图的缓存池标示
+ (NSString *)reuseIdentifier{
    static NSString *footerIdentifier = @"YKOrderChildTableViewCell";
    return footerIdentifier;
}
/// 获取Cell视图对象
+ (instancetype)cellWithTableViewCell:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    //从缓存池中寻找底部视图对象，如果没有，该方法自动调用alloc/initWithFrame创建一个新的底部视图返回
    NSString *reuseIdentifier = [YKOrderChildTableViewCell reuseIdentifier];
    YKOrderChildTableViewCell* tools = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    return tools;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = kRandomColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}


@end
