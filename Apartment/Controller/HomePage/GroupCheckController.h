//
//  GroupCheckController.h
//  Apartment
//
//  Created by henghui on 2016/10/21.
//  Copyright © 2016年 henghui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GroupCheckController : UIViewController

// 土地性质
@property (weak, nonatomic) IBOutlet UITextField *chooseLandTypeBtn;

// 房屋性质
@property (weak, nonatomic) IBOutlet UITextField *chooseHouseTypeTextField;

// 产权期限
@property (weak, nonatomic) IBOutlet UILabel *deadlineLable;

// 房屋起始年限
@property (weak, nonatomic) IBOutlet UITextField *startYearTextField;

// 产权关系
@property (weak, nonatomic) IBOutlet UITextField *propertyOrderTextField;

// 房源面积
@property (weak, nonatomic) IBOutlet UITextField *housingArea;

// 房屋楼层
@property (weak, nonatomic) IBOutlet UITextField *floorTextField;

// 标准面积
@property (weak, nonatomic) IBOutlet UITextField *standardSize;

// 可租面积
@property (weak, nonatomic) IBOutlet UITextField *rentArea;

// 可租层数
@property (weak, nonatomic) IBOutlet UITextField *rentFloorTextField;

// 可租房间数
@property (weak, nonatomic) IBOutlet UITextField *rentRoomNumber;

// 单间面积
@property (weak, nonatomic) IBOutlet UITextField *roomArea;

// 日租金
@property (weak, nonatomic) IBOutlet UITextField *dailyRent;

// 月租金
@property (weak, nonatomic) IBOutlet UILabel *mounthRentLabel;

// 年租金
@property (weak, nonatomic) IBOutlet UILabel *yearRentLabel;

// 租贷期限
@property (weak, nonatomic) IBOutlet UITextField *leaseTextField;

// 租金递增
@property (weak, nonatomic) IBOutlet UITextField *increasingTextField;

// 租金支付方式
@property (weak, nonatomic) IBOutlet UITextField *methodOfPayment;

// 免租期
@property (weak, nonatomic) IBOutlet UITextField *rentFreePeriod;


// 出租率
@property (weak, nonatomic) IBOutlet UITextField *rentsTextField;

// 物业优势
@property (weak, nonatomic) IBOutlet UITextView *superiorityTextView;


// 物业劣势
@property (weak, nonatomic) IBOutlet UITextView *weaknessTextView;







@end
