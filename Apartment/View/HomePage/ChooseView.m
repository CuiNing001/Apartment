//
//  ChooseView.m
//  Apartment
//
//  Created by henghui on 2016/10/24.
//  Copyright © 2016年 henghui. All rights reserved.
//

#import "ChooseView.h"

@interface ChooseView ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray *chooseArray;

@end

@implementation ChooseView

- (NSArray *)chooseArray{
    
    if (!_chooseArray) {
        
        self.chooseArray = [NSArray array];
    }
    return _chooseArray;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        NSArray *viewArray = [[NSBundle mainBundle]loadNibNamed:@"ChooseView" owner:self options:nil];
        
        self = viewArray[0];
        
        self.frame = frame;
        
        self.tableView.delegate = self;
        
        self.tableView.dataSource = self;
        
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
        _chooseArray = @[@"居住用地",@"工业用地",@"仓库用地",@"商业用地",@"综合用地",@"其他用地"];
    }
    return self;
}

#pragma mark - tableView代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _chooseArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // cell字体居中
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    // cell字体大小
    cell.textLabel.font = [UIFont systemFontOfSize:11];
    
    // 点击cell改变字体颜色
    cell.textLabel.highlightedTextColor = [UIColor orangeColor];
    
    // cell赋值
    cell.textLabel.text = _chooseArray[indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    // 点击隐藏tableView
    self.tableView.superview.hidden = YES;
    
    // 实现block
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
