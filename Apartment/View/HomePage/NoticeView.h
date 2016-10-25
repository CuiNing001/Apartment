//
//  NoticeView.h
//  Apartment
//
//  Created by henghui on 2016/10/20.
//  Copyright © 2016年 henghui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoticeView : UIView

// 日期label
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

// 展示公告内容
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (instancetype)initWithFrame:(CGRect)frame;

@end
