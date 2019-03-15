//
//  AddDomainViewController.m
//  IpManager
//
//  Created by North on 2019/3/13.
//  Copyright © 2019 North. All rights reserved.
//

#import "AddDomainViewController.h"
#import "IpManagerHelper.h"
#import "IpModel.h"

@interface AddDomainViewController ()<UITextFieldDelegate>

@property (retain ,nonatomic) UILabel *tipLabel;
@property (retain ,nonatomic) UILabel *descLabel;
@property (retain ,nonatomic) UITextField *nameTextFiled;
@property (retain ,nonatomic) UIImageView *nameLineView;
@property (retain ,nonatomic) UITextField *domainTextFiled;
@property (retain ,nonatomic) UITextField *hostTextFiled;
@property (retain ,nonatomic) UIImageView *domainLineView;
@property (retain ,nonatomic) UIImageView *hostLineView;
@property (retain ,nonatomic) UILabel *pointView;
@property (retain ,nonatomic) UIButton *sureBtn;
@property (retain ,nonatomic) UILabel *changeLabel;
@property (retain ,nonatomic) UIImageView *changeView;

@end

@implementation AddDomainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpView];
    
    [self checkFill];
    
}

- (void)setUpView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    
    self.tipLabel = [UILabel new];
    self.tipLabel.text = @"域名方式";
    self.tipLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 22];
    self.tipLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [self.tipLabel sizeToFit];
    [self.view addSubview:self.tipLabel];
    
    
    self.descLabel = [UILabel new];
    self.descLabel.text = @"手动添加，连接新的服务器";
    self.descLabel.font = [UIFont systemFontOfSize:14];
    self.descLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [self.descLabel sizeToFit];
    [self.view addSubview:self.descLabel];
    
    self.nameTextFiled = [UITextField new];
    self.nameTextFiled.placeholder = @"请输入服务器名称（选填）";
    self.nameTextFiled.delegate = self;
    self.nameTextFiled.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.nameTextFiled];
    
    self.nameLineView = [UIImageView new];
    self.nameLineView.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
    [self.view addSubview:self.nameLineView];
    
    self.domainTextFiled = [UITextField new];
    self.domainTextFiled.delegate = self;
    self.domainTextFiled.font = [UIFont systemFontOfSize:18];
    self.domainTextFiled.keyboardType = UIKeyboardTypeURL;
    self.domainTextFiled.placeholder = @"www.magic-beans.cn";
    [self.view addSubview:self.domainTextFiled];
    
    
    self.hostTextFiled = [UITextField new];
    self.hostTextFiled.textAlignment = NSTextAlignmentCenter;
    self.hostTextFiled.delegate = self;
    self.hostTextFiled.font = [UIFont systemFontOfSize:18];
    self.hostTextFiled.keyboardType = UIKeyboardTypeNumberPad;
    self.hostTextFiled.placeholder = @"8888";
    [self.view addSubview:self.hostTextFiled];
    
    [self.domainTextFiled addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
    
    
    self.domainLineView = [UIImageView new];
    self.domainLineView.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
    [self.view addSubview:self.domainLineView];
    
    
    
    self.hostLineView = [UIImageView new];
    self.hostLineView.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
    [self.view addSubview:self.hostLineView];
    
    
    self.pointView = [UILabel new];
    self.pointView.font = [UIFont systemFontOfSize:14];
    self.pointView.text = @":";
    self.pointView.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self.pointView sizeToFit];
    [self.view addSubview:self.pointView];
    
    
    self.sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    self.sureBtn.layer.cornerRadius = 4;
    self.sureBtn.backgroundColor = [UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1];
    [self.sureBtn addTarget:self action:@selector(sureBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.sureBtn];
    
    
    self.changeLabel = [UILabel new];
    self.changeLabel.text = @"IP方式";
    self.changeLabel.textColor = [UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1];
    self.changeLabel.font = [UIFont systemFontOfSize:14];
    [self.changeLabel sizeToFit];
    
    [self.view addSubview:self.changeLabel];
    
    [self addTapToView:self.changeLabel ation:@selector(changeIpAction)];
    
    self.changeView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ip_change"]];
    
    [self.view addSubview:self.changeView];
    
    [self addTapToView:self.changeView ation:@selector(changeIpAction)];
    
    
}
- (void)addTapToView:(UIView *)view ation:(SEL)action{
    
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:action]];
    
}

- (void)changeIpAction{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KChangeIpWayNotice object:nil];
}


- (void)sureBtnAction{
    
    [self.view endEditing:YES];
    
    IpModel *model = [[IpModel alloc] initWithName:self.nameTextFiled.text.length>0?self.nameTextFiled.text:@"未命名服务器" ip:self.domainTextFiled.text host:self.hostTextFiled.text];
   
    
    [[IpManagerHelper shareHeler] saveNewItem:model];
    
     [self.navigationController popViewControllerAnimated:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if(textField == self.nameTextFiled){
        
        self.nameLineView.backgroundColor =[UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1];
        
        return;
    }
    if(textField == self.domainTextFiled){
        
        self.domainLineView.backgroundColor =[UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1];
        
        return;
    }
    
   
    if(textField == self.hostTextFiled){
        
        self.hostLineView.backgroundColor =[UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1];
        
        return;
    }
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if(textField == self.nameTextFiled){
        
        self.nameLineView.backgroundColor =[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
        
        return;
    }
    if(textField == self.domainTextFiled){
        
        self.domainLineView.backgroundColor =[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
        
        return;
    }
    
    
    if(textField == self.hostTextFiled){
        
        self.hostLineView.backgroundColor =[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
        
        return;
    }
}

- (void)textFieldDidChanged:(UITextField *)textField{
    
    [self checkFill];
}

- (void)checkFill{
    
    self.sureBtn.enabled = self.domainTextFiled.text.length>0;
    self.sureBtn.backgroundColor =self.sureBtn.enabled?[UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1]:[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
    
    
    
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    
    
    self.tipLabel.frame = CGRectMake(30,25, CGRectGetWidth(self.tipLabel.bounds), CGRectGetHeight(self.tipLabel.bounds));
    self.descLabel.frame = CGRectMake(30, CGRectGetMaxY(self.tipLabel.frame) + 15, CGRectGetWidth(self.descLabel.bounds), CGRectGetHeight(self.descLabel.bounds));
    
    self.nameTextFiled.frame = CGRectMake(30, CGRectGetMaxY(self.descLabel.frame) + 46, width - 30 *2, 50);
    
    self.nameLineView.frame = CGRectMake(30, CGRectGetMaxY(self.nameTextFiled.frame) + 4, width - 30 *2, 1/[UIScreen mainScreen].scale);
    
    
    
    
    self.hostTextFiled.frame = CGRectMake(width - 50 -30, CGRectGetMaxY(self.nameLineView.frame) + 41 , 50 , 50);

    
    self.hostLineView.frame = CGRectMake(CGRectGetMinX(self.hostTextFiled.frame), CGRectGetMaxY(self.hostTextFiled.frame)+2 , 50 , 1/[UIScreen mainScreen].scale);
    
    self.pointView.frame = CGRectMake(CGRectGetMinX(self.hostTextFiled.frame) - self.pointView.frame.size.width, CGRectGetMidY(self.hostTextFiled.frame) - self.pointView.bounds.size.height/2.0, self.pointView.bounds.size.width, self.pointView.bounds.size.height);
    
    
    self.domainTextFiled.frame = CGRectMake(30,CGRectGetMinY(self.hostTextFiled.frame), CGRectGetMinX(self.pointView.frame) -30, 50);
    
    self.domainLineView.frame = CGRectMake(CGRectGetMinX(self.domainTextFiled.frame), CGRectGetMaxY(self.domainTextFiled.frame)+2 , CGRectGetWidth(self.domainTextFiled.frame) , 1/[UIScreen mainScreen].scale);
    
    
    
    self.sureBtn.frame = CGRectMake(30, CGRectGetMaxY(self.hostLineView.frame)+50, width - 30 * 2, 44);
    
    self.changeView.frame = CGRectMake(width - self.changeView.image.size.width -30, height - self.changeView.image.size.height -50, self.changeView.image.size.width, self.changeView.image.size.height);
    
    self.changeLabel.frame = CGRectMake(CGRectGetMinX(self.changeView.frame) - CGRectGetWidth(self.changeLabel.bounds) - 5, CGRectGetMidY(self.changeView.frame) - CGRectGetHeight(self.changeLabel.bounds)/2.0, CGRectGetWidth(self.changeLabel.bounds), CGRectGetHeight(self.changeLabel.bounds));
    
    
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

@end
