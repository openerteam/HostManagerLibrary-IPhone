//
//  IpHomeViewController.m
//  IpManager
//
//  Created by North on 2019/3/12.
//  Copyright © 2019 North. All rights reserved.
//

#import "IpHomeViewController.h"
#import "IpManagerHelper.h"
#import "IpHostCell.h"
#import "AddViewController.h"
#import "PhoneDetailViewController.h"


@interface IpHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (retain ,nonatomic) UITableView *tableView;
@property (retain ,nonatomic) UIView *headView;
@property (retain ,nonatomic) UIView *topView;
@property (retain ,nonatomic) UIView *bottomView;
@property (retain ,nonatomic) UILabel *topLabel;
@property (retain ,nonatomic) UILabel *tipLabel;
@property (retain ,nonatomic) UIImageView *nextView;
@property (retain ,nonatomic) UILabel *bottomLabel;
@property (retain ,nonatomic) UIImageView *addView;

@property (retain ,nonatomic) UILabel *nameLabel;
@property (retain ,nonatomic) UILabel *ipLabel;


@end

@implementation IpHomeViewController

//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//
//    [self initData];
//
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpView];
    
    [self setUpNotice];
    
    [self currentAddressChangeNotice];
    
}

- (void)setUpView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ip_退出"] style:UIBarButtonItemStylePlain target:self action:@selector(exitBtnAction)];
    
    
    
    {
        self.headView = [UIView new];
       
        [self.view addSubview:self.headView];
        
    
        self.topView = [UIView new];
        self.topView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
        [self.headView addSubview:self.topView];
        
        self.topLabel = [UILabel new];
        self.topLabel.text = @"当前连接";
        self.topLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 14];
        self.topLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        [self.topLabel sizeToFit];
        [self.topView addSubview:self.topLabel];
        
        self.nextView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ip_下一步"]];
        [self.topView addSubview:self.nextView];
        [self addTapToView:self.nextView ation:@selector(phoneDetailAction)];
        
        
        self.tipLabel = [UILabel new];
        self.tipLabel.text = @"查看本机信息";
        self.tipLabel.font = [UIFont systemFontOfSize:14];
        self.tipLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        [self.tipLabel sizeToFit];
        [self.topView addSubview:self.tipLabel];
        
        [self addTapToView:self.tipLabel ation:@selector(phoneDetailAction)];
        
        
        self.bottomView = [UIView new];
        self.bottomView.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
        [self.headView addSubview:self.bottomView];
        
        self.bottomLabel = [UILabel new];
        self.bottomLabel.text = @"可用连接";
        self.bottomLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size: 14];
        self.bottomLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        [self.bottomLabel sizeToFit];
        [self.bottomView addSubview:self.bottomLabel];
        
        
        self.addView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ip_add"]];
        [self.bottomView addSubview:self.addView];
        [self addTapToView:self.addView ation:@selector(addMoreAction)];
        
        
        self.nameLabel = [UILabel new];
        self.nameLabel.text = @"";
        self.nameLabel.font = [UIFont systemFontOfSize:16];
        self.nameLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [self.headView addSubview:self.nameLabel];
        
        self.ipLabel = [UILabel new];
        self.ipLabel.text = @"";
        self.ipLabel.font = [UIFont systemFontOfSize:16];
        self.ipLabel.textColor = [UIColor colorWithRed:0/255.0 green:132/255.0 blue:253/255.0 alpha:1];
        [self.headView addSubview:self.ipLabel];
        
        
    }
    
    
    {
        self.tableView = [UITableView new];
        
        self.tableView.tableFooterView = [UIView new];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.view addSubview:self.tableView];
        
        
        [self.tableView registerClass:[IpHostCell class] forCellReuseIdentifier:@"IpHostCell"];
        
        
    }
    
    
}

- (void)setUpNotice{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newAddressNotice) name:KNewAddressNotice object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(currentAddressChangeNotice) name:KCurrentAddressChangeNotice object:nil];
    
}

- (void)newAddressNotice{
    
    [self.tableView reloadData];
}

- (void)currentAddressChangeNotice{
    
    IpModel *model = [IpManagerHelper shareHeler].currentItem;
    
    if(model){
        
        self.nameLabel.text = model.name;
        self.ipLabel.text = model.host.length>0?[NSString stringWithFormat:@"%@:%@",model.ip,model.host]:model.ip;
    }else{
        
        self.nameLabel.text = @"未当前设置服务器";
        self.ipLabel.text = @"";
    }
    
    
    [self.nameLabel sizeToFit];
    [self.ipLabel sizeToFit];
}

- (void)addTapToView:(UIView *)view ation:(SEL)action{
    
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:action]];
    
}

#pragma mark - 事件

- (void)exitBtnAction{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)phoneDetailAction{
    
    PhoneDetailViewController *controller = [[PhoneDetailViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
    
    
}

- (void)addMoreAction{
    
    AddViewController *controller = [[AddViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}



#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [IpManagerHelper shareHeler].readSaveIpArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 75;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    IpHostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IpHostCell"];
    
    [cell setIpData:[IpManagerHelper shareHeler].readSaveIpArray[indexPath.row]];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    IpModel *item = [IpManagerHelper shareHeler].readSaveIpArray[indexPath.row];
    [[IpManagerHelper shareHeler] changeCurrentAddress:item];
    [tableView reloadData];
    [self exitBtnAction];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    //第二组可以左滑删除
    IpModel *item = [IpManagerHelper shareHeler].readSaveIpArray[indexPath.row];
    return !item.isSelected;
}

// 定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

// 进入编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    IpModel *item = [IpManagerHelper shareHeler].readSaveIpArray[indexPath.row];
    [[IpManagerHelper shareHeler] deleteItem:item];
    
    [tableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
}

// 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    
    
    self.headView.frame = CGRectMake(0, self.navigationController.navigationBar.bounds.size.height + [UIApplication sharedApplication].statusBarFrame.size.height, CGRectGetWidth(self.view.bounds), 190);
    
    self.topView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 45);
    
    self.topLabel.frame = CGRectMake(15, (CGRectGetHeight(self.topView.bounds) - CGRectGetHeight(self.topLabel.bounds))/2.0, CGRectGetWidth(self.topLabel.bounds), CGRectGetHeight(self.topLabel.bounds));
    
    self.nextView.frame = CGRectMake(CGRectGetWidth(self.view.bounds) - 15 - self.nextView.image.size.width, (CGRectGetHeight(self.topView.bounds) - self.nextView.image.size.height)/2.0, self.nextView.image.size.width, self.nextView.image.size.height);
    
    
    self.tipLabel.frame = CGRectMake(CGRectGetMinX(self.nextView.frame) - 8 - CGRectGetWidth(self.tipLabel.bounds), (CGRectGetHeight(self.topView.bounds) - CGRectGetHeight(self.tipLabel.bounds))/2.0,CGRectGetWidth(self.tipLabel.bounds), CGRectGetHeight(self.tipLabel.bounds));
    
    self.bottomView.frame = CGRectMake(0, 145, CGRectGetWidth(self.view.bounds), 45);
    
    self.bottomLabel.frame = CGRectMake(15, (CGRectGetHeight(self.bottomView.bounds) - CGRectGetHeight(self.bottomLabel.bounds))/2.0, CGRectGetWidth(self.bottomLabel.bounds), CGRectGetHeight(self.bottomLabel.bounds));
    
    
    self.addView.frame = CGRectMake(CGRectGetWidth(self.view.bounds) - 15 - self.addView.image.size.width, (CGRectGetHeight(self.bottomView.bounds) - self.addView.image.size.height)/2.0, self.addView.image.size.width, self.addView.image.size.height);
    
    
    self.tableView.frame = CGRectMake(0, CGRectGetMaxY(self.headView.frame), CGRectGetWidth(self.view.bounds),CGRectGetMaxY(self.view.frame) - CGRectGetMaxY(self.headView.frame));
    
    
    self.nameLabel.frame = CGRectMake((self.view.bounds.size.width - self.nameLabel.bounds.size.width)/2.0, 0, self.nameLabel.bounds.size.width, self.nameLabel.bounds.size.height);
    
    CGPoint center = self.nameLabel.center;
    center.y = 45 + 38;
    self.nameLabel.center = center;
    

    self.ipLabel.frame = CGRectMake((self.view.bounds.size.width - self.ipLabel.bounds.size.width)/2.0, 0, self.ipLabel.bounds.size.width, self.ipLabel.bounds.size.height);
    
    CGPoint center2 = self.ipLabel.center;
    center2.y = 45 + 66;
    self.ipLabel.center = center2;
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}



@end
