//
//  NoticeView.m
//  Apartment
//
//  Created by henghui on 2016/10/20.
//  Copyright © 2016年 henghui. All rights reserved.
//

#import "NoticeView.h"

@interface NoticeView ()<UITableViewDelegate,UITableViewDataSource>

// 标识当前滚动公告栏要取到的数据源的下标
@property (nonatomic,assign)NSInteger currentIndex;

// 公告数据源
@property (nonatomic,strong)NSMutableArray *dataArr;


@end

static NSString *const cell = @"cell";  // cell标识符

@implementation NoticeView

- (NSMutableArray *)dataArr{
    
    if (!_dataArr) {
        
        self.dataArr = [NSMutableArray array];
    }
    return _dataArr;
}



- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        NSArray *viewArray = [[NSBundle mainBundle]loadNibNamed:@"NoticeView" owner:self options:nil];
        
        self = viewArray[0];
        
        self.frame = frame;
        
        [self loadTime];
        
        self.tableView.delegate = self;
        
        self.tableView.dataSource = self;
        
        // 取消tableView上cell的分割线
        _tableView.separatorStyle = NO;
        
        // 注册cell
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cell];
        
         _dataArr = @[@"第一条公告",@"第二条公告",@"第三条公告",@"第四条公告",@"第五条公告"].mutableCopy;
        
        // 设置公告栏最初从第一条数据开始滚动
        _currentIndex = 0;
        
        // 添加定时器,使tableView滚动
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(tableViewScrollToTop) userInfo:nil repeats:YES];

        
        
    }
    return self;
}

#pragma mark - 获取当前时间
- (void)loadTime{
    
    //获取当前时间日期
    NSDate *date=[NSDate date];
    
    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
    
    [format1 setDateFormat:@"yyyy-MM-dd"];
    
    NSString *dateStr;
    
    dateStr=[format1 stringFromDate:date];
    
    self.dateLabel.text = dateStr;
    
    NSLog(@"%@",dateStr);
    
}

// 请求公告数据
- (void)loadData{
    
   
    
}

#pragma mark - tableView代理方法

// cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArr.count;
}

// row高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 20;
}

// 公告栏赋值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:10];
    
    cell.backgroundColor = _tableView.backgroundColor;
    
    cell.textLabel.textColor = [UIColor orangeColor];
    
    // 取消cell的点击效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = _dataArr[_currentIndex];
    
    return cell;
    
    
}

// 实现定时器的方法,2秒上滑一次
- (void)tableViewScrollToTop{
    
    // 判断当前的数据源是不是最后一个
    if (_currentIndex == self.dataArr.count-1) {
        
        // 将要展示的数据源设置成第一个
        _currentIndex = 0;
    }else{
        
        _currentIndex++;
    }
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:(UITableViewRowAnimationTop)];
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
