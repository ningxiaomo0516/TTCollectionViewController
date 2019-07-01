//
//  MessageModel.h
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/7/1.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageModel : NSObject
@property (nonatomic,copy) NSString *username;
@property (nonatomic,copy) NSString *message;
@property (nonatomic,copy) NSString *level;
/// 该Model对应的Cell高度
@property (nonatomic, assign) CGFloat cellHeight;
@end

NS_ASSUME_NONNULL_END
