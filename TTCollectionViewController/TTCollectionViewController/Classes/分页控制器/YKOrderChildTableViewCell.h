//
//  YKOrderChildTableViewCell.h
//  FlightShare_live
//
//  Created by 宁小陌 on 2019/12/2.
//  Copyright © 2019 寜小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YKOrderChildTableViewCell : UITableViewCell
/// Cell视图的缓存池标示
+ (NSString *)reuseIdentifier;
/// 获取Cell视图对象
+ (instancetype)cellWithTableViewCell:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, strong) UIView *boxView;
/// 航空公司图标
@property (nonatomic, strong) UIImageView   *airline_imagesView;
@property (nonatomic, strong) UIImageView   *imagesView_logo;
@property (nonatomic, strong) UIImageView   *imagesArrow;
/// 出发时间
@property (nonatomic, strong) UILabel       *dep_time_label;
/// 抵达时间
@property (nonatomic, strong) UILabel       *arr_time_label;
/// 航空公司和航班号
@property (nonatomic, strong) UILabel       *airline_label;
/// 出发机场
@property (nonatomic, strong) UILabel       *depAirport_label;
/// 抵达机场
@property (nonatomic, strong) UILabel       *arrAirport_label;
/// 乘机人姓名
@property (nonatomic, strong) UILabel       *username_label;
/// 出发日期
@property (nonatomic, strong) UILabel       *dep_date_label;

/// 票价
@property (nonatomic, strong) UILabel       *price_label;
/// 状态
@property (nonatomic, strong) UILabel       *status_label;

/// 分割线
@property (nonatomic,strong) UIView         *linerView_t;
@property (nonatomic,strong) UIView         *linerView_b;
@property (nonatomic,strong) UIView         *linerView_l;
@property (nonatomic,strong) UIView         *linerView_r;

/// 支付按钮
@property (nonatomic, strong) UIButton   *payButton;
/// 取消按钮
@property (nonatomic, strong) UIButton   *cancelButton;
/// 退票按钮
@property (nonatomic, strong) UIButton   *refundButton;
/// 改签按钮
@property (nonatomic, strong) UIButton   *updateButton;

/// 查看详情
@property (nonatomic, strong) UIButton   *childButton;

@end

NS_ASSUME_NONNULL_END
