//
//  TTRoomChatViewController.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/7/1.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTRoomChatViewController.h"
#import "MessageModel.h"
#import "TTRoomChatTableViewCell.h"

static NSString *const rctextCellIndentifier = @"TTRoomChatTableViewCell";
@interface TTRoomChatViewController ()<UITableViewDelegate,UITableViewDataSource>

/*!
聊天内容的消息Cell数据模型的数据源

@discussion 数据源中存放的元素为消息Cell的数据模型，即RCCRMessageModel对象。
*/
@property(nonatomic, strong) NSMutableArray<MessageModel *> *messageArray;
/*!
 会话页面的CollectionView
 */
@property(nonatomic, strong) UITableView *chatTableView;

@property (nonatomic, strong) TTRoomChatTableViewCell *tempMsgCell;

@end

@implementation TTRoomChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *rightImg = kGetImage(@"c51_plus_add");
    rightImg = [rightImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:rightImg
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(didTapShareButton:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    // 用于计算高度
    self.tempMsgCell = [[TTRoomChatTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rctextCellIndentifier];
    [self setupUI];
    // 模拟一些数据源
    NSArray *nameArr = @[@"看我的大白眼：",
                         @"我是大白：",
                         @"大白眼：",
                         @"大白：",
                         @"吴老二："];
    NSArray *messageArr = @[@"平时使用Mac自带终端时是不是觉得主题太单调、代码不能自动提示、语法不能高亮。那么今天就来调教一下，让它变得漂亮些、活儿更好一些。",
                            @"简单介绍下oh-my-zsh",
                            @"Oh My Zsh是一款社区驱动的命令行工具，正如它的主页上说的，Oh My Zsh 是一种生活方式。 它基于zsh命令行，提供了主题配置，插件机制，已经内置的便捷操作。",
                            @"哈哈哈哈哈"];
    // 向数据源中随机放入500个Model
    for (int i=0; i<100; i++) {
        MessageModel *model = [[MessageModel alloc] init];
        model.username = nameArr[arc4random()%nameArr.count];
        model.message = messageArr[arc4random()%messageArr.count];
        [self.messageArray addObject:model];
    }
    
    // 再滚动到最底部
    [self.chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.messageArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
    [self.chatTableView reloadData];
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
    NSArray *nameArr = @[@"看我的大白眼：", @"我是大白：", @"大白眼：", @"大白：", @"吴老二："];
    NSArray *messageArr = @[@"平时使用Mac自带终端时是不是觉得主题太单调、代码不能自动提示、语法不能高亮。那么今天就来调教一下，让它变得漂亮些、活儿更好一些。",
                            @"简单介绍下oh-my-zsh",
                            @"Oh My Zsh是一款社区驱动的命令行工具，正如它的主页上说的，Oh My Zsh 是一种生活方式。 它基于zsh命令行，提供了主题配置，插件机制，已经内置的便捷操作。",
                            @"哈哈哈哈哈"];
    
    MessageModel *model = [[MessageModel alloc] init];
    model.username = nameArr[arc4random()%nameArr.count];
    model.message = messageArr[arc4random()%messageArr.count];
    
    [self.messageArray addObject:model];
    
    // 插入到tableView中
    [self.chatTableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.messageArray.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    // 再滚动到最底部
    [self.chatTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.messageArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:YES];
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

#pragma mark - <UITableViewDelegate,UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.messageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageModel *messageModel = [self.messageArray objectAtIndex:indexPath.row];
    TTRoomChatTableViewCell *tools = [tableView dequeueReusableCellWithIdentifier:rctextCellIndentifier forIndexPath:indexPath];;
    tools.messageModel = messageModel;
    return tools;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageModel *model = [self.messageArray objectAtIndex:indexPath.row];
    if (model.cellHeight == 0) {
        CGFloat cellHeight = [self.tempMsgCell heightForModel:model];
        model.cellHeight = cellHeight;
        return cellHeight;
    }else{
        return model.cellHeight;
    }
}

- (UITableView *)chatTableView{
    if (!_chatTableView) {
        _chatTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _chatTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _chatTableView.delegate = self;
        _chatTableView.dataSource = self;
        _chatTableView.alwaysBounceVertical = YES;
        _chatTableView.showsVerticalScrollIndicator = NO;
        [_chatTableView registerClass:[TTRoomChatTableViewCell class] forCellReuseIdentifier:rctextCellIndentifier];
        _chatTableView.backgroundColor = [UIColor clearColor];
        _chatTableView.estimatedRowHeight = 0;
        _chatTableView.estimatedSectionHeaderHeight = 0;
        _chatTableView.estimatedSectionFooterHeight = 0;
    }
    return _chatTableView;
}

- (NSMutableArray<MessageModel *> *)messageArray {
    if (!_messageArray) {
        _messageArray = [NSMutableArray array];
    }
    return _messageArray;
}

@end
