//
//  AddViewController.m
//  IpManager
//
//  Created by North on 2019/3/14.
//  Copyright © 2019 North. All rights reserved.
//

#import "AddViewController.h"
#import "AddDomainViewController.h"
#import "AddIpViewController.h"
#import "IpManagerHelper.h"

@interface AddViewController ()
{
    UIView *contentView;
    AddIpViewController *ipControlller;
    AddDomainViewController *domainControlller;
}
@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpView];
    
    [self setUpNotice];
    
}

- (void)setUpView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ip_退出"] style:UIBarButtonItemStylePlain target:self action:@selector(exitBtnAction)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ip_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnAction)];
    
    {
        
        contentView = [UIView new];
        [self.view addSubview:contentView];
        
    }
    
    {
        
        ipControlller = [[AddIpViewController alloc]init];
        [self addChildViewController:ipControlller];
        [contentView addSubview:ipControlller.view];
        [ipControlller didMoveToParentViewController:self];
    }
    
    {
        
        domainControlller = [[AddDomainViewController alloc]init];
        [self addChildViewController:domainControlller];
        [contentView addSubview:domainControlller.view];
        [domainControlller didMoveToParentViewController:self];
    }
    
    
    //默认显示ip
    ipControlller.view.hidden = NO;
    domainControlller.view.hidden =YES;
    
    
}

- (void)setUpNotice{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeDomainAction) name:KChangeDomainWayNotice object:nil];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeIpAction) name:KChangeIpWayNotice object:nil];
    
}

- (void)changeIpAction{
    
    [UIView transitionWithView:contentView duration:.3 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        
        self->ipControlller.view.hidden = NO;
        self->domainControlller.view.hidden =YES;
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    
}

- (void)changeDomainAction{
    
    [UIView transitionWithView:contentView duration:.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        
        self->ipControlller.view.hidden = YES;
        self->domainControlller.view.hidden =NO;
        
    } completion:^(BOOL finished) {
        
    }];
    
}
- (void)backBtnAction{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)exitBtnAction{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    CGFloat barHeight = self.navigationController.navigationBar.bounds.size.height + [UIApplication sharedApplication].statusBarFrame.size.height;
    
    CGRect frame = CGRectMake(0, barHeight, width, height - barHeight);
    
    contentView.frame = frame;
    
    ipControlller.view.frame = contentView.bounds;
    domainControlller.view.frame = contentView.bounds;
    
    
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}

@end
