//
//  OptionsView.m
//  Apartment
//
//  Created by henghui on 2016/10/18.
//  Copyright © 2016年 henghui. All rights reserved.
//

#import "OptionsView.h"

@interface OptionsView ()

@end

@implementation OptionsView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        NSArray *viewArray = [[NSBundle mainBundle]loadNibNamed:@"OptionsView" owner:self options:nil];
        
        self = viewArray[0];
        
        self.frame = frame;
        
        self.planBtn.tag = 1000;
        
      
        
        }
    return self;
}

// 我的计划
- (IBAction)myPlanBtn:(UIButton *)sender {
    
    // 实现block
    self.buttonClick(sender.tag);
    
    NSLog(@"我的计划");
}

// 待办事项
- (IBAction)backlogBtn:(UIButton *)sender {
    
    // 实现block
    self.buttonClick(sender.tag);
    
    NSLog(@"待办事项");
}

// 收支统计
- (IBAction)statisticsBtn:(UIButton *)sender {
    
    // 实现block
    self.buttonClick(sender.tag);
    
    NSLog(@"收支统计");
}

// 老板键
- (IBAction)bossKeyBtn:(UIButton *)sender {
    
    // 实现block
    self.buttonClick(sender.tag);
    
    NSLog(@"老板键");
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
