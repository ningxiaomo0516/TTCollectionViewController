//
//  TagsModel.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/12/30.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TagsModel.h"

@implementation TagsModel

- (CGSize)contentSize{
    //字体大小写死
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:15.f]};
    CGSize textSize = [_name boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 1000)
                                          options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    _contentSize = CGSizeMake(ceil(textSize.width), ceil(textSize.height));
    return _contentSize;
}

@end
