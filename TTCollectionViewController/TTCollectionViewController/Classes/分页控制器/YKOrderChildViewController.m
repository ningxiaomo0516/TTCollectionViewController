//
//  YKOrderChildViewController.m
//  FlightShare_live
//
//  Created by 宁小陌 on 2019/12/2.
//  Copyright © 2019 寜小陌. All rights reserved.
//

#import "YKOrderChildViewController.h"
#import "YKOrderChildTableViewCell.h"

@interface YKOrderChildViewController ()
/// 每页多少数据
@property (nonatomic, assign) NSInteger pageSize;
/// 当前页
@property (nonatomic, assign) NSInteger pageIndex;
@end

@implementation YKOrderChildViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pageSize = 20;
    self.pageIndex = 1;
    [self initView];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = kViewColorNormal;
}

- (void)set_base_item{
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.mainTableView registerClass:[YKOrderChildTableViewCell class] forCellReuseIdentifier:[YKOrderChildTableViewCell reuseIdentifier]];
    
}

- (void) initView{
    [self.view addSubview:self.mainTableView];
    [self.mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
}

#pragma mark - Table view data source
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YKOrderChildTableViewCell *tools = [YKOrderChildTableViewCell cellWithTableViewCell:tableView forIndexPath:indexPath];
    tools.backgroundColor = kRandomColor;
    return tools;
}

// 多少个分组 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;//self.dataArray.count;
}

#pragma mark -- 设置Header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) return 200;
    return 195;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
