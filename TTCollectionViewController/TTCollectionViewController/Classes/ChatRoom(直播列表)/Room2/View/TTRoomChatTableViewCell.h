//
//  TTRoomChatTableViewCell.h
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/7/1.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MessageModel;
@interface TTRoomChatTableViewCell : UITableViewCell
@property (nonatomic, strong) MessageModel *messageModel;

- (CGFloat)heightForModel:(MessageModel *)messageModel;
@end

NS_ASSUME_NONNULL_END
