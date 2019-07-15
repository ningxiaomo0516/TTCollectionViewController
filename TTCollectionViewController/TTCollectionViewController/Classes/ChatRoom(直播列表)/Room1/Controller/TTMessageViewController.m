//
//  TTMessageViewController.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/7/1.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTMessageViewController.h"
#import "TTMessageCell.h"

static NSString *const rctextCellIndentifier = @"TTMessageCell";
@interface TTMessageViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *chatTableView;
@property (nonatomic, strong) NSMutableArray *messageArray;
@property (nonatomic, strong) TTMessageCell *tempCell;

@end

@implementation TTMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 我们再创建一个按钮，点击可从后面追加一些数据进来
    UIImage *rightImg = kGetImage(@"c51_plus_add");
    rightImg = [rightImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:rightImg
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(didTapShareButton:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    // 创建
    self.tempCell = [[TTMessageCell alloc] initWithStyle:0 reuseIdentifier:rctextCellIndentifier];
    
    
    // 仔细观察cell的出现方式,cell的出现方式有一个动画
    [self setupUI];
    
    // 模拟一些数据源
    NSArray *nameArr = @[@"张三：", @"李四：", @"王五：", @"陈六：", @"吴老二："];
    NSArray *messageArr = @[@"ash快点回家爱是妒忌哈市党和国家按时到岗哈时代光华撒国会大厦国会大厦国会大厦更好的噶山东黄金撒旦哈安师大噶是个混蛋撒",
                            @"傲世江湖点撒恭候大驾水草玛瑙现在才明白你个坏蛋擦边沙尘暴你先走吧出现在",
                            @"撒点花噶闪光灯",
                            @"按时间大公司大概好久撒大概好久撒党和国家按时到岗哈师大就萨达数据库化打算几点撒谎就看电视骄傲的撒金葵花打暑假工大撒比的撒谎讲大话手机巴士差距啊市场报价啊山东黄金as擦伤擦啊as擦肩时擦市场报价按时VC阿擦把持啊三重才撒啊双层巴士吃按时吃啊双层巴士擦报啥错",
                            @"as大帅哥大孤山街道安师大好噶时间过得撒黄金国度"];
    // 向数据源中随机放入500个Model
    self.messageArray = [[NSMutableArray alloc] init];
    for (int i=0; i<500; i++) {
        MessageModel *model = [[MessageModel alloc] init];
        model.username = nameArr[arc4random()%nameArr.count];
        model.message = messageArr[arc4random()%messageArr.count];
        [self.messageArray addObject:model];
    }
    
    // 再滚动到最底部
    [self.chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.messageArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
    [self.chatTableView reloadData];
    
}

- (void)setupUI {
    [self.view addSubview:self.chatTableView];
    [self.chatTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(240);
        make.top.mas_equalTo(200);
    }];
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    [self setBackgroundImage:kGetImage(@"live_background")];
}

- (void)setBackgroundImage:(UIImage *)image{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [image drawInRect:self.view.bounds];
    UIImage *bgImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
}

/// 点击右上角的加号弹出菜单选项
- (void)didTapShareButton:(UIBarButtonItem *)barButtonItem {
    [self addMessage];
}

- (void)addMessage {
    // 模拟一些数据源
    NSArray *nameArr = @[@"张三：", @"李四：", @"王五：", @"陈六：", @"吴老二："];
    NSArray *messageArr = @[@"ash快点回家爱是妒忌哈市党和国家按时到岗哈时代光华撒国会大厦国会大厦国会大厦更好的噶山东黄金撒旦哈安师大噶是个混蛋撒",
                            @"傲世江湖点撒恭候大驾水草玛瑙现在才明白你个坏蛋擦边沙尘暴你先走吧出现在",
                            @"撒点花噶闪光灯",
                            @"按时间大公司大概好久撒大概好久撒党和国家按时到岗哈师大就萨达数据库化打算几点撒谎就看电视骄傲的撒金葵花打暑假工大撒比的撒谎讲大话手机巴士差距啊市场报价啊山东黄金as擦伤擦啊as擦肩时擦市场报价按时VC阿擦把持啊三重才撒啊双层巴士吃按时吃啊双层巴士擦报啥错",
                            @"as大帅哥大孤山街道安师大好噶时间过得撒黄金国度"];
    // 添加一个Model，在追加到Tableview中
    MessageModel *model = [[MessageModel alloc] init];
    model.username = nameArr[arc4random()%nameArr.count];
    model.message = messageArr[arc4random()%messageArr.count];
    [self.messageArray addObject:model];
    
    // 插入到tableView中
    [self.chatTableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.messageArray.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    
    
    // 再滚动到最底部
    [self.chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.messageArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageModel *model = self.messageArray[indexPath.row];
    if (model.cellHeight == 0) {
        CGFloat cellHeight = [self.tempCell heightForModel:self.messageArray[indexPath.row]];
        // 缓存给model
        model.cellHeight = cellHeight;
        return cellHeight;
    } else {
        return model.cellHeight;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TTMessageCell *tools = [tableView dequeueReusableCellWithIdentifier:rctextCellIndentifier forIndexPath:indexPath];
    [tools setMessageModel:self.messageArray[indexPath.row]];
    return tools;
}


- (UITableView *)chatTableView{
    if (!_chatTableView) {
        _chatTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _chatTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _chatTableView.delegate = self;
        _chatTableView.dataSource = self;
        _chatTableView.alwaysBounceVertical = YES;
        _chatTableView.showsVerticalScrollIndicator = NO;
        [_chatTableView registerClass:[TTMessageCell class] forCellReuseIdentifier:rctextCellIndentifier];
        _chatTableView.backgroundColor = [UIColor clearColor];
        _chatTableView.estimatedRowHeight = 0;
        _chatTableView.estimatedSectionHeaderHeight = 0;
        _chatTableView.estimatedSectionFooterHeight = 0;
    }
    return _chatTableView;
}

@end
