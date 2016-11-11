//
//  MessageViewController.m
//  Apartment
//
//  Created by henghui on 2016/10/17.
//  Copyright © 2016年 henghui. All rights reserved.
//

#import "MessageViewController.h"
#import "OptionsView.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //获取当前时间日期
    NSDate *date=[NSDate date];
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    
    [format setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    
    NSString *dateStr;
    
    dateStr=[format stringFromDate:date];
    
    NSLog(@"%@",dateStr);
    
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(10, 200, 300, 80)];
    
    text.text = dateStr;
    
    [self.view addSubview:text];
    
    
    
    
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
