//
//  TagsCollectionViewController.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/12/30.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "TagsCollectionViewController.h"
#import "TagsLayout.h"
#import "TagsCell.h"
#import "TagsModel.h"
#import <MJExtension/MJExtension.h>

@interface TagsCollectionViewController ()<UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray *dataSoure;
@end

@implementation TagsCollectionViewController

static NSString * const reuseIdentifier = @"TagsCell";
- (instancetype)init{
    TagsLayout *layout = [[TagsLayout alloc]init];
    layout.delegate = self;
    return [super initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = kWhiteColor;
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[TagsCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSoure.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell
    TagsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    TagsModel *model = self.dataSoure[indexPath.item];
    cell.titlelabel.text = model.name;
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    TagsModel *model = self.dataSoure[indexPath.item];
    CGFloat width = 0;
    if (model.contentSize.width+10>kScreenWidth-20) {
        width = kScreenWidth-20;
    }else{
        width = model.contentSize.width + 10;
    }
    //10 为左右间距和
    return CGSizeMake(width , 21);
}

- (NSMutableArray*)dataSoure{
    if (!_dataSoure) {
        /* 模拟数据 */
        NSArray *array = [NSArray arrayWithObjects:
                          @{@"name":@"北国"},
                          @{@"name":@"美丽的热巴"},
                          @{@"name":@"海贼王"},
                          @{@"name":@"雪"},
                          @{@"name":@"四川省成都市武侯区天和东街四川省成都市武侯区天和东街四川省成都市武侯区天和东街四川省成都市武侯区天和东街"},
                          @{@"name":@"强风吹拂"},
                          @{@"name":@"北京"},
                          @{@"name":@"落差"},
                          @{@"name":@"购物的男孩"},
                          @{@"name":@"摇摆的风扇"},
                          @{@"name":@"热门"},
                          @{@"name":@"风景~"},
                          @{@"name":@"棒子达"},
                          @{@"name":@"上地"},
                          @{@"name":@"泰山"},
                          @{@"name":@"它"},
                          @{@"name":@"屋里面"}, nil];
        
        _dataSoure = [NSMutableArray array];
        for (NSDictionary *item in array) {
            TagsModel *model = [TagsModel mj_objectWithKeyValues:item];
            [_dataSoure addObject:model];
        }
    }
    return _dataSoure;
}


@end
