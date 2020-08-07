//
//  TTBaseTableViewController.h
//  YiKao
//
//  Created by 宁小陌 on 2019/3/20.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TTBaseTableViewController : TTBaseViewController
/// 给当前view添加识别手势,点击tableView中带有输入框点击背景关闭键盘
- (void) addGesture:(UITableView *) tableView;


@property (nonatomic, strong) UITableView       *mainTableView;
@property (nonatomic, strong) NSMutableArray    *dataArray;
/// 基础设置
- (void) set_base_item;
/// 无数据的情况下
- (void)analysisData;
/// 结束刷新,是否加载数据
- (void) endRefreshing:(BOOL) reloadData;

@end

NS_ASSUME_NONNULL_END
