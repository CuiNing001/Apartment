//
//  GroupCheckController.m
//  Apartment
//
//  Created by henghui on 2016/10/21.
//  Copyright © 2016年 henghui. All rights reserved.
//

#import "GroupCheckController.h"
#import "ChooseView.h"
#import "HousePropertyChooseView.h"

@interface GroupCheckController ()<UITextFieldDelegate,UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UIView *backGroundView;

@property (strong, nonatomic) ChooseView *chooseView; // 土地性质选择框

@property (strong, nonatomic) HousePropertyChooseView *houseProperty; // 房屋性质

@end

@implementation GroupCheckController

- (ChooseView *)chooseView{
    
    if (!_chooseView) {
        
        self.chooseView = [[ChooseView alloc]init];
    }
    return _chooseView;
}

- (HousePropertyChooseView *)houseProperty{
    
    if (!_houseProperty) {
        
        self.houseProperty = [[HousePropertyChooseView alloc]init];
    }
    return _houseProperty;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    // 指定textField代理
    [self addDelegate];
    
    // 添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(returnKey:)];
    
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES
    tap.cancelsTouchesInView = NO;
    
    [self.backGroundView addGestureRecognizer:tap];
    
    
}


#pragma mark - 土地性质选择框
- (IBAction)chooseBtn:(UIButton *)sender {
    
        // 设置选中状态图标
        [sender setImage:[UIImage imageNamed:@"下拉按钮选中@2x"] forState:(UIControlStateSelected)];
  
    // 添加选择框
    self.chooseView.frame = CGRectMake(_chooseLandTypeBtn.frame.origin.x, _chooseLandTypeBtn.frame.origin.y+30, _chooseLandTypeBtn.frame.size.width, 265);
    
    [self.backGroundView addSubview:_chooseView];
    
    // 点击显示选择框
    self.chooseView.hidden = NO;
    
    
    __weak typeof (self)weakSelf = self;
    // 回调选中对应cell的block
    _chooseView.cellClicked = ^(NSInteger index){
        
        // 改编按钮图标
        [sender setImage:[UIImage imageNamed:@"下拉按钮一般@2x"] forState:(UIControlStateSelected)];
       
        // 根据cell的下标改变所选内容
        switch (index) {
            case 0:
                
                weakSelf.chooseLandTypeBtn.text = @"居住用地";
                
                weakSelf.deadlineLable.text = @"70";
                break;
                
            case 1:
                
                weakSelf.chooseLandTypeBtn.text = @"工业用地";
                
                weakSelf.deadlineLable.text = @"50";
                break;
                
            case 2:
                
                weakSelf.chooseLandTypeBtn.text = @"仓库用地";
                
                weakSelf.deadlineLable.text = @"50";
                break;
                
            case 3:
                
                weakSelf.chooseLandTypeBtn.text = @"商业用地";
                
                weakSelf.deadlineLable.text = @"40";
                break;
                
            case 4:
                
                weakSelf.chooseLandTypeBtn.text = @"综合用地";
                
                weakSelf.deadlineLable.text = @"50";
                break;
                
            case 5:
                
                weakSelf.chooseLandTypeBtn.text = @"其他用地";
                
                weakSelf.deadlineLable.text = @"50";
                break;
       
        }
    };
    
    
}

#pragma mark - 房屋性质选择框

- (IBAction)housePropertyBtn:(UIButton *)sender {
    
    // 设置选中状态图标
    [sender setImage:[UIImage imageNamed:@"下拉按钮选中@2x"] forState:(UIControlStateSelected)];
    
    // 添加选择框
    self.houseProperty.frame = CGRectMake(_chooseHouseTypeTextField.frame.origin.x, _chooseHouseTypeTextField.frame.origin.y+30, _chooseHouseTypeTextField.frame.size.width, 265);
    
    [self.backGroundView addSubview:_houseProperty];
    
    // 点击显示选择框
    self.houseProperty.hidden = NO;
    
    
    __weak typeof (self)weakSelf = self;
    // 回调选中对应cell的block
    weakSelf.houseProperty.cellClicked = ^(NSInteger index){
        
        // 改编按钮图标
        [sender setImage:[UIImage imageNamed:@"下拉按钮一般@2x"] forState:(UIControlStateSelected)];
        
        // 根据cell的下标改变所选内容
        switch (index) {
            case 0:
                
                weakSelf.chooseHouseTypeTextField.text = @"商品房";
                break;
                
            case 1:
                
                weakSelf.chooseHouseTypeTextField.text = @"安置房";
                break;
                
            case 2:
                
                weakSelf.chooseHouseTypeTextField.text = @"写字楼";
                break;
                
            case 3:
                
                weakSelf.chooseHouseTypeTextField.text = @"工业用房";
                break;
                
            case 4:
                
                weakSelf.chooseHouseTypeTextField.text = @"宾馆";
                break;
                
            case 5:
                
                weakSelf.chooseHouseTypeTextField.text = @"厂房/仓库";
                break;
                
            case 6:
                
                weakSelf.chooseHouseTypeTextField.text = @"村民自建房";
                break;
                
        }
    };
    
}




// 返回上一界面
- (IBAction)backToVC:(UIBarButtonItem *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


// 返回主界面
- (IBAction)backToRootVC:(UIBarButtonItem *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

// 下一步按钮
- (IBAction)nextStepBtn:(UIButton *)sender {
    
    NSLog(@"下一步");
}

#pragma mark - 指定textField代理
// 添加textField代理
- (void)addDelegate{
    
    _chooseLandTypeBtn.delegate = self;
    
    _chooseHouseTypeTextField.delegate = self;
    
    _startYearTextField.delegate = self;
    
    _propertyOrderTextField.delegate = self;
    
    _housingArea.delegate = self;
    
    _floorTextField.delegate = self;
    
    _standardSize.delegate = self;
    
    _rentArea.delegate = self;
    
    _rentFloorTextField.delegate = self;
    
    _rentRoomNumber.delegate = self;
    
    _roomArea.delegate = self;
    
    _dailyRent.delegate = self;
    
    _leaseTextField.delegate = self;
    
    _increasingTextField.delegate = self;
    
    _methodOfPayment.delegate = self;
    
    _rentFreePeriod.delegate = self;
    
    _rentsTextField.delegate = self;
    
    _superiorityTextView.delegate = self;
    
    _weaknessTextView.delegate = self;
}


#pragma mark - 文本编辑框代理方法
// 取消textfield编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (textField == _chooseHouseTypeTextField) {
        
        return NO;
    }else if (textField == _chooseLandTypeBtn){
        
        return NO;
    }else{
        
        return YES;
    }
    
 
}

// textField回收键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}


// textView回收键盘
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if ([@"\n" isEqualToString:text] == YES){
        
        [textView resignFirstResponder];
        
        return NO;
    }
    
    return YES;
}

// 点击屏幕回收键盘
- (void)returnKey:(UITapGestureRecognizer *)tap{
    
    [_backGroundView endEditing:YES];
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
