//
//  TTNavigationController.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/6/20.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TTNavigationController.h"

@interface TTNavigationController ()

@end

@implementation TTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置UINavigationBar的主题
    [self setupNavigationBarTheme];
}

- (void) setupNavigationBarTheme {
    // 1.去掉背景图片和底部线条
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    UIImage *backgroundImage = [self lz_imageWithColor:kNavigationColorNormal];
    [self.navigationBar setBackgroundImage:[backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(5, 1, 5, 1)] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.tintColor = kColorWithRGB(51, 51, 51);
    //去掉导航栏下边的投影
    UIImage *shadowImage = [self lz_imageWithColor:[UIColor clearColor]];
    self.navigationBar.shadowImage = [shadowImage resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
    
    self.navigationBar.barTintColor = kNavigationColorNormal;
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:kColorWithRGB(251, 251, 251)};
    self.navigationBar.translucent = NO;// NavigationBar 是否透明
    self.navigationBar.barStyle = UIBarStyleBlackTranslucent;
}

/**
 *  生成图片
 *
 *  @param color  图片颜色
 *
 *  @return 生成的图片
 */
- (UIImage *) lz_imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);   //图片尺寸
    UIGraphicsBeginImageContext(rect.size);             //填充画笔
    CGContextRef context = UIGraphicsGetCurrentContext();//根据所传颜色绘制
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);                       //联系显示区域
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();// 得到图片信息
    UIGraphicsEndImageContext();//消除画笔
    
    return image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
