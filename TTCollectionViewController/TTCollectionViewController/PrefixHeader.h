//
//  PrefixHeader.h
//  SCDropDownMenu
//
//  Created by 宁小陌 on 2018/7/9.
//  Copyright © 2018年 宁小陌. All rights reserved.
//

#ifndef PrefixHeader_h
#define PrefixHeader_h
#import "TTNavigationController.h"
#import "TTBaseViewController.h"
#import "Masonry.h"
#import "NSObject+Toast.h"

//// 日志打印
#ifdef DEBUG
#define TTLog(...) NSLog(@"\n\n[文件名:%s] 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define TTLog(...)
#endif

// 1.RGBA
#define kColorWithRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define kColorWithRGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define kViewColorNormal kColorWithRGB(244, 244, 244)
#define kNavigationColorNormal kColorWithRGB(211, 0, 0)
#define kColorText51 kColorWithRGB(51, 51, 51)
#define kClearColor [UIColor clearColor]
#define kWhiteColor [UIColor whiteColor]

#define kNavBarHeight   (kScreenHeight == 812.0 ? 88 : 64)
#define kScreenWidth    ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight   ([UIScreen mainScreen].bounds.size.height)
#define kScreenScale    [UIScreen mainScreen].scale


#define Toast(tips) [self tt_make:tips]

/// 交叉后的宽度
#define kCrossScreenWidth   (kScreenWidth > kScreenHeight ?  kScreenHeight : kScreenWidth)
/// 交叉后的高度
#define kCrossScreenHeight  (kScreenWidth > kScreenHeight ?  kScreenWidth : kScreenHeight)
/// 交叉后iPhone X的宽度
#define kCrossScreenWidth_X (kScreenWidth > kScreenHeight ?  812.00 : 375.00)
/// 交叉后iPhone X的高度
#define kCrossScreenHeight_X (kScreenWidth > kScreenHeight ?  375.000 : 812.00)

#define kRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

/// 读取本地图片资源
#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

#define kFontWithNameMedium     @"PingFang-SC-Medium"
#define kFontSizeMedium12 [UIFont fontWithName:kFontWithNameMedium size:12]
#define kFontSizeMedium13 [UIFont fontWithName:kFontWithNameMedium size:13]
#define kFontSizeMedium15 [UIFont fontWithName:kFontWithNameMedium size:15]
#endif /* PrefixHeader_h */
