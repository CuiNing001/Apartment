//
//  ChooseView.h
//  Apartment
//
//  Created by henghui on 2016/10/24.
//  Copyright © 2016年 henghui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseView : UIView

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (copy, nonatomic) void(^cellClicked)(NSInteger index);

- (instancetype)initWithFrame:(CGRect)frame;


@end
