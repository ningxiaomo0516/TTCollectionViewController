//
//  TTTableHeaderViewController.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/7/8.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTTableHeaderViewController.h"
#import "TTTableHeaderView.h"

#define HeaderHeight 274

@interface TTTableHeaderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView        * tableView;   //tableView
@property(nonatomic, strong) TTTableHeaderView  * headerView;  //headerView

@end

@implementation TTTableHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)initTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.tableView.tableHeaderView = self.headerView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld个cell",indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY < 0) {
        CGFloat totalOffsetY = HeaderHeight + ABS(offsetY);
        CGFloat f = totalOffsetY / HeaderHeight;
        self.headerView.imagesView.frame = CGRectMake(- (kScreenWidth * f - kScreenWidth) / 2, offsetY, kScreenWidth * f, totalOffsetY);
    }
}

- (TTTableHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[TTTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, HeaderHeight)];
    }
    return _headerView;
}
@end
