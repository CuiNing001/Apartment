//
//  HousePropertyChooseView.m
//  Apartment
//
//  Created by henghui on 2016/10/25.
//  Copyright © 2016年 henghui. All rights reserved.
//

#import "HousePropertyChooseView.h"

@interface HousePropertyChooseView ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *dataSourceArray;

@end

@implementation HousePropertyChooseView

- (NSMutableArray *)dataSourceArray{
    
    if (!_dataSourceArray) {
        
        self.dataSourceArray = [NSMutableArray array];
    }
    return _dataSourceArray;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        NSArray *viewArray = [[NSBundle mainBundle]loadNibNamed:@"HousePropertyChooseView" owner:self options:nil];
        
        self = viewArray[0];
        
        self.frame = frame;
        
        self.tableView.delegate = self;
        
        self.tableView.dataSource = self;
        
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
        _dataSourceArray = @[@"商品房",@"安置房",@"写字楼",@"工业用房",@"宾馆",@"厂房/仓库",@"村民自建房"].mutableCopy;
    }
    return self;
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    cell.textLabel.font = [UIFont systemFontOfSize:11];
    
    cell.textLabel.highlightedTextColor = [UIColor orangeColor];
    
    cell.textLabel.text = _dataSourceArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 点击隐藏tableView
    self.tableView.superview.hidden = YES;
    
    self.cellClicked(indexPath.row);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
