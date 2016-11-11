//
//  HomePageViewController.m
//  Apartment
//
//  Created by henghui on 2016/10/17.
//  Copyright © 2016年 henghui. All rights reserved.
//

#import "HomePageViewController.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "HomePageCell.h"
#import "SycleScrollView.h"
#import "SDCycleScrollView.h"
#import "OptionsView.h"
#import "NoticeView.h"
#import "CheckOutViewController.h"


#define kHeadView_Height 180  // headView高度

@interface HomePageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,SDCycleScrollViewDelegate>

@property (nonatomic,strong) SycleScrollView *sycleScrollView;

@property (strong,nonatomic) SDCycleScrollView *scycleScroll;

@property (strong,nonatomic) NSArray *imageArray; // 存储图标文件

@property (strong,nonatomic) NSArray *scycleImageGroup; // 存储本地图片

@property (strong,nonatomic) OptionsView *optionsView; // 选项按钮

@property (strong,nonatomic) NoticeView *notice; //公告


@end


@implementation HomePageViewController

// 懒加载
- (NSArray *)imageArray{
    
    if (!_imageArray) {
        
        self.imageArray = [[NSArray alloc]init];
    }
    return _imageArray;
}

- (NSArray *)scycleImageGroup{
    
    if (!_scycleImageGroup) {
        
        self.scycleImageGroup = [[NSArray alloc]init];
    }
    return _scycleImageGroup;
}

- (OptionsView *)optionsView{
    
    if (!_optionsView) {
        
        self.optionsView = [[OptionsView alloc]init];
    }
    return _optionsView;
}

- (NoticeView *)notice{
    
    if (!_notice) {
        
        self.notice = [[NoticeView alloc]init];
    }
    return _notice;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageArray = @[@"房屋实勘@2x",@"整租管理@2x",@"合租管理@2x",@"集中整租@2x",@"房屋预估@2x",@"财务管理@2x",@"维修管理@2x",@"储备房源@2x",@"微信管理@2x"];
    
    _scycleImageGroup = @[@"banner",@"测试1",@"测试4"];
    
    [self loadSubView];
    
    
    
    [self loadData];
    
}


// 加载子视图
- (void)loadSubView{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    _collectionView.collectionViewLayout = flowLayout;
    
    self.collectionView.delegate = self;
    
    self.collectionView.dataSource = self;
    
    // 注册cell
    [_collectionView registerNib:[UINib nibWithNibName:@"HomePageCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    // 注册页眉
    [_collectionView registerClass:[SycleScrollView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    
    // 设置页眉高度
    flowLayout.headerReferenceSize = CGSizeMake(size_width, kHeadView_Height+100);
    
    // 设置item大小
    flowLayout.itemSize = CGSizeMake(size_width/3-10, 115);
    
    // 缩进量
    flowLayout.sectionInset = UIEdgeInsetsMake(7, 10, 5, 10);
    
    // 列间距
    flowLayout.minimumInteritemSpacing = 5;

    
}

#pragma mark - 轮播图代理方法

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
       
    NSLog(@"轮播图");
}


// 加载数据
- (void)loadData{
    
    
    
}


#pragma mark - 设置页眉
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableView = nil;
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        // 设置本地轮播图
        _scycleScroll = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, size_width, kHeadView_Height) shouldInfiniteLoop:YES imageNamesGroup:_scycleImageGroup];
        
        _scycleScroll.contentMode = UIViewContentModeScaleAspectFill;
        
        self.sycleScrollView = [_collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        
        reusableView = _sycleScrollView;
        
        self.scycleScroll.delegate = self;
        
        [reusableView addSubview:_scycleScroll];
        
        // 添加选项按钮
        _optionsView = [[OptionsView alloc]initWithFrame:CGRectMake(0, _scycleScroll.frame.size.height, size_width, 60)];
        
        //    _optionsView = [[OptionsView alloc]initWithFrame:CGRectMake(0, 0, size_width, 60)];
        
        [reusableView addSubview:_optionsView];
        
        self.optionsView.buttonClick = ^(NSInteger tag){
            
            if (tag == 1000) {
                
                NSLog(@"计划按钮回调");
            }else if (tag == 1001){
                
                NSLog(@"待办事项按钮回调");
            }else if (tag == 1002){
                
                NSLog(@"收支统计回调");
            }else if (tag == 1003){
                
                NSLog(@"老板键回调");
            }
            
        };
        
        // 添加公告栏
        _notice = [[NoticeView alloc]initWithFrame:CGRectMake(0, _optionsView.frame.origin.y+_optionsView.frame.size.height+10, size_width, 30)];
        
        [reusableView addSubview:_notice];


        
        
    }
    
    return reusableView;
}

#pragma mark - collection代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
        return _imageArray.count;
    
}

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

//    return 2;
//}


// item赋值
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomePageCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:_imageArray[indexPath.row]];
    
    return cell;
}

// 点击item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        CheckOutViewController *checkOutVC = [self.storyboard instantiateViewControllerWithIdentifier:@"checkOutVC"];
        [self.navigationController pushViewController:checkOutVC animated:YES ];
        
        NSLog(@"房屋实勘");
    }else if (indexPath.row == 1){
        
        NSLog(@"整租管理");
    }else{
        
        NSLog(@"item");
    }
}

/*
- (void)scrollViewDidScroll:(UIScrollView *)scrollView

{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY<0) {
        
        CGFloat scale = 1- (offsetY/50);
        
        scale = (scale>=1)?scale:1;
        
        self.scycleScroll.transform = CGAffineTransformMakeScale(scale, scale);
        
    }
    
}
*/



- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
