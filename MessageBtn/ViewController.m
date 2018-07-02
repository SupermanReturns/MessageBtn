//
//  ViewController.m
//  MessageBtn
//
//  Created by Superman on 2018/7/1.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSInteger _count;
    NSInteger _number;
}

@property (nonatomic, strong) UIButton *msgBtn;
@property (nonatomic, strong) UITextField *phoneNumber;
@property (nonatomic, strong) UITextField *msgTextField;

@property (nonatomic, strong) UIButton *loginBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.phoneNumber = [[UITextField alloc] initWithFrame:CGRectMake(40, 100, [UIScreen mainScreen].bounds.size.width -40*2 -60, 30)];
    self.phoneNumber.borderStyle = UITextBorderStyleRoundedRect;
    self.phoneNumber.placeholder = @"请输入手机号";
    [self.view addSubview:self.phoneNumber];
    
    self.msgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.msgBtn.frame = CGRectMake(self.phoneNumber.frame.origin.x +self.phoneNumber.frame.size.width +5, self.phoneNumber.frame.origin.y, 60, 30);
    [self.msgBtn setTitle:@"点击获取" forState:UIControlStateNormal];
    self.msgBtn.titleLabel.textColor = [UIColor whiteColor];
    self.msgBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    self.msgBtn.backgroundColor = [UIColor orangeColor];
    [self.msgBtn addTarget:self action:@selector(onBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.msgBtn];
    
    self.msgTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.phoneNumber.frame.origin.x, self.phoneNumber.frame.origin.y +self.phoneNumber.frame.size.height +20, self.phoneNumber.frame.size.width -60, self.phoneNumber.frame.size.height)];
    self.msgTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.msgTextField.placeholder = @"请输入短信验证码";
    [self.view addSubview:self.msgTextField];
    
    
    // 注册按钮
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.frame = CGRectMake(self.msgTextField.frame.origin.x, self.msgTextField.frame.origin.y +self.msgTextField.frame.size.height +20, [UIScreen mainScreen].bounds.size.width -self.msgTextField.frame.origin.x *2, 30);
    [self.loginBtn setTitle:@"注册" forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = [UIColor orangeColor];
    self.loginBtn.titleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.loginBtn];
    [self.loginBtn addTarget:self action:@selector(onBtnLogin) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)onBtnAction:(UIButton *)sender
{
    // 在这里发获取验证码的交易
    NSString *msg;
    if ([self.phoneNumber.text isEqualToString:@""] || self.phoneNumber.text == NULL) {
        msg = @"手机号不能为空";
    }
    
    if (msg.length !=0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    [self performSelector:@selector(sendAction) withObject:nil];
}
- (void)sendAction
{
    self.msgBtn.enabled = NO;
    _count = 60;
    _number = 0;
    [self.msgBtn setTitle:@"60秒" forState:UIControlStateDisabled];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}

- (void)timerFired:(NSTimer *)_timer
{
    if (_count !=0 && _number ==0) {
        _count -=1;
        NSString *str = [NSString stringWithFormat:@"%ld秒", (long)_count];
        [self.msgBtn setTitle:str forState:UIControlStateDisabled];
    }else{
        [_timer invalidate];
        self.msgBtn.enabled = YES;
        [self.msgBtn setTitle:@"点击获取" forState:UIControlStateNormal];
    }
}

- (void)onBtnLogin
{
    NSString *msg =@"";
    if ([self.msgTextField.text isEqualToString:@"" ]|| self.msgTextField.text ==NULL) {
        msg = @"验证码不能为空";
    }
    if (msg.length !=0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示 " message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    self.msgBtn.enabled = YES;
    [self.msgBtn setTitle:@"点击获取" forState:UIControlStateDisabled];
    _number = 1;
    
    // 发登录的交易
    [self performSelector:@selector(login) withObject:nil];
}
- (void)login
{
    
    //    self.msgBtn.enabled = NO;
    //    _count = 60;
    //    _number = 0;
    //    [self.msgBtn setTitle:@"60秒" forState:UIControlStateDisabled];
    //    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
