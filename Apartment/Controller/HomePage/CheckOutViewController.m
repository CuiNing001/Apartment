//
//  CheckOutViewController.m
//  Apartment
//
//  Created by henghui on 2016/10/21.
//  Copyright © 2016年 henghui. All rights reserved.
//

#import "CheckOutViewController.h"

@interface CheckOutViewController ()

@end

@implementation CheckOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

 // 集中实勘报告
- (IBAction)groupCheckBtn:(UIButton *)sender {
    
    NSLog(@"集中实勘报告");
}

 // 分散实勘报告
- (IBAction)disperseCheckBtn:(UIButton *)sender {
    
    NSLog(@"分散实勘报告");
}


// 返回上一界面
- (IBAction)backToView:(UIBarButtonItem *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
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
