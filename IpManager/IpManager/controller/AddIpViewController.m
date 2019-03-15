//
//  AddIpViewController.m
//  IpManager
//
//  Created by North on 2019/3/13.
//  Copyright © 2019 North. All rights reserved.
//

#import "AddIpViewController.h"
#import "IpManagerHelper.h"
#import "IpModel.h"
@interface AddIpViewController ()<UITextFieldDelegate>

@property (retain ,nonatomic) UILabel *tipLabel;
@property (retain ,nonatomic) UILabel *descLabel;
@property (retain ,nonatomic) UITextField *nameTextFiled;
@property (retain ,nonatomic) UIImageView *nameLineView;
@property (retain ,nonatomic) UITextField *inputTextFiled1;
@property (retain ,nonatomic) UITextField *inputTextFiled2;
@property (retain ,nonatomic) UITextField *inputTextFiled3;
@property (retain ,nonatomic) UITextField *inputTextFiled4;
@property (retain ,nonatomic) UITextField *hostTextFiled;

@property (retain ,nonatomic) UIImageView *lineView1;
@property (retain ,nonatomic) UIImageView *lineView2;
@property (retain ,nonatomic) UIImageView *lineView3;
@property (retain ,nonatomic) UIImageView *lineView4;
@property (retain ,nonatomic) UIImageView *hostLineView;

@property (retain ,nonatomic) UILabel *pointView1;
@property (retain ,nonatomic) UILabel *pointView2;
@property (retain ,nonatomic) UILabel *pointView3;
@property (retain ,nonatomic) UILabel *pointView4;


@property (retain ,nonatomic) UIButton *sureBtn;
@property (retain ,nonatomic) UILabel *changeLabel;
@property (retain ,nonatomic) UIImageView *changeView;

@end

@implementation AddIpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpView];
    
    [self checkFill];
    
}

- (void)setUpView{
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.tipLabel = [UILabel new];
    self.tipLabel.text = @"IP方式";
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
    
    self.inputTextFiled1 = [UITextField new];
    self.inputTextFiled1.textAlignment = NSTextAlignmentCenter;
    self.inputTextFiled1.delegate = self;
    self.inputTextFiled1.font = [UIFont systemFontOfSize:18];
    self.inputTextFiled1.keyboardType = UIKeyboardTypeNumberPad;
    self.inputTextFiled1.placeholder = @"192";
    [self.view addSubview:self.inputTextFiled1];
    
     [self.inputTextFiled1 addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
    
    self.inputTextFiled2 = [UITextField new];
    self.inputTextFiled2.textAlignment = NSTextAlignmentCenter;
    self.inputTextFiled2.delegate = self;
    self.inputTextFiled2.font = [UIFont systemFontOfSize:18];
    self.inputTextFiled2.keyboardType = UIKeyboardTypeNumberPad;
    self.inputTextFiled2.placeholder = @"168";
    [self.view addSubview:self.inputTextFiled2];
    
     [self.inputTextFiled2 addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
    
    self.inputTextFiled3 = [UITextField new];
    self.inputTextFiled3.textAlignment = NSTextAlignmentCenter;
    self.inputTextFiled3.delegate = self;
    self.inputTextFiled3.font = [UIFont systemFontOfSize:18];
    self.inputTextFiled3.keyboardType = UIKeyboardTypeNumberPad;
    self.inputTextFiled3.placeholder = @"1";
    [self.view addSubview:self.inputTextFiled3];
    
     [self.inputTextFiled3 addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
    
    self.inputTextFiled4 = [UITextField new];
    self.inputTextFiled4.textAlignment = NSTextAlignmentCenter;
    self.inputTextFiled4.delegate = self;
    self.inputTextFiled4.font = [UIFont systemFontOfSize:18];
    self.inputTextFiled4.keyboardType = UIKeyboardTypeNumberPad;
    self.inputTextFiled4.placeholder = @"1";
    [self.view addSubview:self.inputTextFiled4];
    
     [self.inputTextFiled4 addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
    
    self.hostTextFiled = [UITextField new];
    self.hostTextFiled.textAlignment = NSTextAlignmentCenter;
    self.hostTextFiled.delegate = self;
    self.hostTextFiled.placeholder = @"8888";
    self.hostTextFiled.font = [UIFont systemFontOfSize:18];
    self.hostTextFiled.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.hostTextFiled];
    
     [self.hostTextFiled addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
    
    
    self.lineView1 = [UIImageView new];
    self.lineView1.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
    [self.view addSubview:self.lineView1];
    
    self.lineView2 = [UIImageView new];
    self.lineView2.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
    [self.view addSubview:self.lineView2];
    
    self.lineView3 = [UIImageView new];
    self.lineView3.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
    [self.view addSubview:self.lineView3];
    
    self.lineView4 = [UIImageView new];
    self.lineView4.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
    [self.view addSubview:self.lineView4];
    
    self.hostLineView = [UIImageView new];
    self.hostLineView.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
    [self.view addSubview:self.hostLineView];
    
    
    self.pointView1 = [UILabel new];
    self.pointView1.font = [UIFont systemFontOfSize:14];
    self.pointView1.text = @".";
    self.pointView1.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self.pointView1 sizeToFit];
    [self.view addSubview:self.pointView1];
    
    
    self.pointView2 = [UILabel new];
    self.pointView2.text = @".";
    self.pointView2.font = [UIFont systemFontOfSize:14];
    self.pointView2.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self.pointView2 sizeToFit];
    [self.view addSubview:self.pointView2];
    
    
    self.pointView3 = [UILabel new];
    self.pointView3.text = @".";
    self.pointView3.font = [UIFont systemFontOfSize:14];
    self.pointView3.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self.pointView3 sizeToFit];
    [self.view addSubview:self.pointView3];
    
    self.pointView4 = [UILabel new];
    self.pointView4.text = @":";
    self.pointView4.font = [UIFont systemFontOfSize:14];
    self.pointView4.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self.pointView4 sizeToFit];
    [self.view addSubview:self.pointView4];
    
    
    self.sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    self.sureBtn.layer.cornerRadius = 4;
    self.sureBtn.backgroundColor = [UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1];
    [self.sureBtn addTarget:self action:@selector(sureBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.sureBtn];
    
    
    self.changeLabel = [UILabel new];
    self.changeLabel.text = @"域名方式";
    self.changeLabel.textColor = [UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1];
    self.changeLabel.font = [UIFont systemFontOfSize:14];
    [self.changeLabel sizeToFit];
    
    [self.view addSubview:self.changeLabel];
    
    [self addTapToView:self.changeLabel ation:@selector(changeDomainAction)];
    
    self.changeView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ip_change"]];
    
    [self.view addSubview:self.changeView];
    
    [self addTapToView:self.changeView ation:@selector(changeDomainAction)];

    
}
- (void)addTapToView:(UIView *)view ation:(SEL)action{
    
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:action]];
    
}
- (void)sureBtnAction{
    
    [self.view endEditing:YES];
    
    NSString *ip = [NSString stringWithFormat:@"%@.%@.%@.%@:%@",self.inputTextFiled1.text,self.inputTextFiled2.text,self.inputTextFiled3.text,self.inputTextFiled4.text,self.hostTextFiled.text];
    
    
    IpModel *model = [[IpModel alloc] initWithName:self.nameTextFiled.text.length>0?self.nameTextFiled.text:@"未命名服务器" ip:ip host:self.hostTextFiled.text];
    
    [[IpManagerHelper shareHeler] saveNewItem:model];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (void)changeDomainAction{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KChangeDomainWayNotice object:nil];
}




- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if(textField == self.nameTextFiled){
        
        self.nameLineView.backgroundColor =[UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1];
        
        return;
    }
    if(textField == self.inputTextFiled1){
        
        self.lineView1.backgroundColor =[UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1];
        
        return;
    }
    
    if(textField == self.inputTextFiled2){
        
        self.lineView2.backgroundColor =[UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1];
        
        return;
    }
    
    if(textField == self.inputTextFiled3){
        
        self.lineView3.backgroundColor =[UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1];
        
        return;
    }
    
    if(textField == self.inputTextFiled4){
        
        self.lineView4.backgroundColor =[UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1];
        
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
    if(textField == self.inputTextFiled1){
        
        self.lineView1.backgroundColor =[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
        
        return;
    }
    
    if(textField == self.inputTextFiled2){
        
        self.lineView2.backgroundColor =[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
        
        return;
    }
    
    if(textField == self.inputTextFiled3){
        
        self.lineView3.backgroundColor =[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
        
        return;
    }
    
    if(textField == self.inputTextFiled4){
        
        self.lineView4.backgroundColor =[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
        
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
    
    BOOL fill1 = self.inputTextFiled1.text.length >0;
    BOOL fill2 = self.inputTextFiled2.text.length >0;
    BOOL fill3 = self.inputTextFiled3.text.length >0;
    BOOL fill4 = self.inputTextFiled4.text.length >0;
    BOOL fillHost = self.hostTextFiled.text.length >0;

    self.sureBtn.enabled = (fill1 && fill2 && fill3 && fill4 && fillHost);
    self.sureBtn.backgroundColor =self.sureBtn.enabled?[UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1]:[UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
    
    
    
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
   CGFloat width = CGRectGetWidth(self.view.bounds);
   CGFloat height = CGRectGetHeight(self.view.bounds);
   
    
    self.tipLabel.frame = CGRectMake(30, 25, CGRectGetWidth(self.tipLabel.bounds), CGRectGetHeight(self.tipLabel.bounds));
    self.descLabel.frame = CGRectMake(30, CGRectGetMaxY(self.tipLabel.frame) + 15, CGRectGetWidth(self.descLabel.bounds), CGRectGetHeight(self.descLabel.bounds));
    
    self.nameTextFiled.frame = CGRectMake(30, CGRectGetMaxY(self.descLabel.frame) + 46, width - 30 *2, 50);
    
    self.nameLineView.frame = CGRectMake(30, CGRectGetMaxY(self.nameTextFiled.frame) + 4, width - 30 *2, 1/[UIScreen mainScreen].scale);
    
    
    CGFloat pointWidth = CGRectGetWidth(self.pointView1.bounds);
    CGFloat inputWidth = (width - 30 *2 - pointWidth *4)/5;
    
    self.inputTextFiled1.frame = CGRectMake(30, CGRectGetMaxY(self.nameLineView.frame) + 41, inputWidth, 50);
    self.pointView1.frame = CGRectMake(CGRectGetMaxX(self.inputTextFiled1.frame),CGRectGetMinY(self.inputTextFiled1.frame) + (50 -CGRectGetHeight(self.pointView1.bounds))/2.0 , CGRectGetWidth(self.pointView1.bounds), CGRectGetHeight(self.pointView1.bounds));
    
    self.inputTextFiled2.frame = CGRectMake(CGRectGetMaxX(self.pointView1.frame),CGRectGetMinY(self.inputTextFiled1.frame), inputWidth ,50);
    
    self.pointView2.frame = CGRectMake(CGRectGetMaxX(self.inputTextFiled2.frame),CGRectGetMinY(self.inputTextFiled2.frame) + (50 -CGRectGetHeight(self.pointView2.bounds))/2.0 , CGRectGetWidth(self.pointView2.bounds), CGRectGetHeight(self.pointView2.bounds));
    
    
    self.inputTextFiled3.frame = CGRectMake(CGRectGetMaxX(self.pointView2.frame),CGRectGetMinY(self.inputTextFiled1.frame), inputWidth ,50);
    
    self.pointView3.frame = CGRectMake(CGRectGetMaxX(self.inputTextFiled3.frame),CGRectGetMinY(self.inputTextFiled3.frame) + (50 -CGRectGetHeight(self.pointView2.bounds))/2.0 , CGRectGetWidth(self.pointView3.bounds), CGRectGetHeight(self.pointView3.bounds));
    
    self.inputTextFiled4.frame = CGRectMake(CGRectGetMaxX(self.pointView3.frame),CGRectGetMinY(self.inputTextFiled1.frame), inputWidth ,50);
    
    self.pointView4.frame = CGRectMake(CGRectGetMaxX(self.inputTextFiled4.frame),CGRectGetMinY(self.inputTextFiled4.frame) + (50 -CGRectGetHeight(self.pointView2.bounds))/2.0 , CGRectGetWidth(self.pointView4.bounds), CGRectGetHeight(self.pointView4.bounds));
    
    self.hostTextFiled .frame =CGRectMake(CGRectGetMaxX(self.pointView4.frame),CGRectGetMinY(self.inputTextFiled1.frame), inputWidth ,50);
    
    self.lineView1.frame = CGRectMake(CGRectGetMinX(self.inputTextFiled1.frame), CGRectGetMaxY(self.inputTextFiled1.frame)+2 , inputWidth , 1/[UIScreen mainScreen].scale);
    
    self.lineView2.frame = CGRectMake(CGRectGetMinX(self.inputTextFiled2.frame), CGRectGetMaxY(self.inputTextFiled2.frame)+2 , inputWidth , 1/[UIScreen mainScreen].scale);
    
    self.lineView3.frame = CGRectMake(CGRectGetMinX(self.inputTextFiled3.frame), CGRectGetMaxY(self.inputTextFiled3.frame)+2 , inputWidth , 1/[UIScreen mainScreen].scale);
    
    self.lineView4.frame = CGRectMake(CGRectGetMinX(self.inputTextFiled4.frame), CGRectGetMaxY(self.inputTextFiled4.frame)+2 , inputWidth , 1/[UIScreen mainScreen].scale);
    
    self.hostLineView.frame = CGRectMake(CGRectGetMinX(self.hostTextFiled.frame), CGRectGetMaxY(self.hostTextFiled.frame)+2 , inputWidth , 1/[UIScreen mainScreen].scale);
    
    self.sureBtn.frame = CGRectMake(30, CGRectGetMaxY(self.hostLineView.frame)+50, width - 30 * 2, 44);
    
    self.changeView.frame = CGRectMake(width - self.changeView.image.size.width -30, height - self.changeView.image.size.height -50, self.changeView.image.size.width, self.changeView.image.size.height);
    
    self.changeLabel.frame = CGRectMake(CGRectGetMinX(self.changeView.frame) - CGRectGetWidth(self.changeLabel.bounds) - 5, CGRectGetMidY(self.changeView.frame) - CGRectGetHeight(self.changeLabel.bounds)/2.0, CGRectGetWidth(self.changeLabel.bounds), CGRectGetHeight(self.changeLabel.bounds));
    
    
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

@end
