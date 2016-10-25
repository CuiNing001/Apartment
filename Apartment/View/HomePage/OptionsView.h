//
//  OptionsView.h
//  Apartment
//
//  Created by henghui on 2016/10/18.
//  Copyright © 2016年 henghui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionsView : UIView

// 定义block属性
@property (copy, nonatomic) void(^buttonClick)(NSInteger tag);

- (instancetype)initWithFrame:(CGRect)frame;


@property (weak, nonatomic) IBOutlet UIButton *planBtn;

@end
