//
//  YKOrderViewController.m
//  FlightShare_live
//
//  Created by 宁小陌 on 2019/12/2.
//  Copyright © 2019 寜小陌. All rights reserved.
//

#import "YKOrderViewController.h"
#import "WMPageController.h"
#import "YKOrderChildViewController.h"

@interface YKOrderViewController ()<WMPageControllerDelegate>

@end

@implementation YKOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.setPageViewControllers];
    self.title = @"全部订单";
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = kViewColorNormal;
}

#pragma mark -- setter/getter
- (UIView *)setPageViewControllers {
    WMPageController *pageController = [self p_defaultController];
    pageController.titleFontName = @"PingFang-SC-Medium";
    pageController.titleSizeNormal = 14;  /// 默认字体大小
    pageController.titleSizeSelected = 15;/// 选中字体大小
    pageController.menuViewStyle = WMMenuViewStyleLine;/// 样式
    pageController.menuViewLayoutMode = WMMenuViewLayoutModeCenter;//居中模式
    pageController.menuItemWidth = kScreenWidth/5;/// 宽度
    pageController.titleColorSelected = kTextColor51;
    pageController.titleColorNormal = kTextColor153;
    pageController.progressWidth = 20;
    pageController.progressColor = kColorWithRGB(255, 180, 0);
    pageController.menuBGColor = kNavigationColorNormal;
    if (self.selectIndex==0) {
        pageController.selectIndex = 0;
    }else if(self.selectIndex==1){
        pageController.selectIndex = 1;
    }else if(self.selectIndex==2){
        pageController.selectIndex = 3;
    }else{
        pageController.selectIndex = 0;
    }
    
    [self addChildViewController:pageController];
//    [pageController didMoveToParentViewController:self];
    
    return pageController.view;
}

- (WMPageController *)p_defaultController {
    /// 机票订单状态 1 订单待支付 2 订单已支付 3 订单处理中 4 订单已出票 5 订单已取消 6退票中 7退票完成
    NSArray *titles = @[@"全部",@"待支付",@"待出行",@"退/改签",@"已取消"];
    NSArray *kidArr = @[@"200",@"1",@"4",@"67",@"5"];
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    for (int i=0; i<titles.count; i++) {
        YKOrderChildViewController *vc  = [YKOrderChildViewController new];
        vc.title = kidArr[i];
        [viewControllers addObject:vc];
    }
    WMPageController *pageVC = [[WMPageController alloc] initWithViewControllerClasses:viewControllers andTheirTitles:titles];
    [pageVC setViewFrame:CGRectMake(0,0, kScreenWidth, kScreenHeight-kNavBarHeight)];
    pageVC.delegate = self;
    pageVC.menuHeight = 40;
//    pageVC.postNotification = YES;
//    pageVC.bounces = YES;
    return pageVC;
}

@end
