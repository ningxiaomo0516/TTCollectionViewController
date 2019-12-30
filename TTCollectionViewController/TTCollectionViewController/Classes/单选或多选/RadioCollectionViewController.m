//
//  RadioCollectionViewController.m
//  TTCollectionViewController
//
//  Created by 宁小陌 on 2019/12/30.
//  Copyright © 2019 宁小陌. All rights reserved.
//

#import "RadioCollectionViewController.h"
#import "RadioCell.h"

static NSInteger TAG_ID = 0xdea;
static NSInteger SelectMax = 9 ;

@interface RadioModel : NSObject

@property (nonatomic , strong) NSString *channleId ;
@property (nonatomic , strong) NSString *name ;
@property (nonatomic , assign) BOOL isSelectedItem ;
//.....

@end

@implementation RadioModel

@end

@interface RadioCollectionViewController ()
@property (nonatomic, strong) NSMutableArray *selectedData; //选中的数据
@property (nonatomic, strong) NSMutableArray<RadioModel* > *dataSoure;    //数据源
@property (nonatomic, assign) BOOL isRadio;  //是否单选
@end

@implementation RadioCollectionViewController

static NSString * const reuseIdentifier = @"RadioCell";
- (instancetype)init{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 2;
    layout.minimumInteritemSpacing = 2;
    layout.itemSize = CGSizeMake((kScreenWidth-9)/4, 100);
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[RadioCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    _isRadio = NO;
    self.selectedData = [NSMutableArray array];
    self.dataSoure = [NSMutableArray array];
    for (int i = 0 ; i < 100; i ++) {
        RadioModel *model = [RadioModel new];
        model.channleId = [NSString stringWithFormat:@"%td",TAG_ID + i] ;
        model.name = [NSString stringWithFormat:@"%d",i];
        model.isSelectedItem = NO;
        [self.dataSoure addObject:model];
    }
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // Register cell classes
    
    //右上角视图
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 30);
    [button setTitle:@"多选" forState:UIControlStateNormal];
    [button setTitle:@"单选" forState:UIControlStateSelected];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickRightBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithCustomView:button];
    [self.navigationItem setRightBarButtonItem:rightButton];
}

- (void)clickRightBtn:(id)sender{
    UIButton *button = (UIButton*)sender;
    _isRadio = !_isRadio;
    button.selected = _isRadio;
    //还原所有值
    [self.selectedData removeAllObjects];
    [self emptyAllSelectState];
    [self.collectionView reloadData];
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
    RadioCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // Configure the cell
    RadioModel *model = self.dataSoure[indexPath.item];
    cell.imageButton.selected = model.isSelectedItem;
    
    cell.ClickImageButton = ^{
        if (self->_isRadio) {
            [self didRadioSelectItemWithIndexPath:indexPath];
        }else
            [self didSelectItemCellWithIndexPath:indexPath];
    };
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_isRadio) {
        [self didRadioSelectItemWithIndexPath:indexPath];
    }else
        [self didSelectItemCellWithIndexPath:indexPath];
}

//多选点击
- (void)didSelectItemCellWithIndexPath:(NSIndexPath*)indexPath{
    RadioModel *model = self.dataSoure[indexPath.item];
    model.isSelectedItem = !model.isSelectedItem;
    
    if (model.isSelectedItem){
        if (self.selectedData.count >= SelectMax){
            model.isSelectedItem = NO;//最后一次点击的
            NSLog(@"最多选九张");
            return;
        }else{
            [self.selectedData addObject:model];
        }
    }else{
        [self.selectedData removeObject:model];
    }
    NSLog(@"self.selectedData.count = %td",self.selectedData.count);
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
}

//单选点击
- (void)didRadioSelectItemWithIndexPath:(NSIndexPath*)indexPath{
    [self emptyAllSelectState];
    RadioModel *model = self.dataSoure[indexPath.item];
    model.isSelectedItem = YES;
    [self.collectionView reloadData];
}

//选中状态制空
- (void)emptyAllSelectState{
    [self.dataSoure enumerateObjectsUsingBlock:^(RadioModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.isSelectedItem = NO;
    }];
}
@end
