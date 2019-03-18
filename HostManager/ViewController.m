//
//  ViewController.m
//  HostManager
//
//  Created by North on 2019/3/18.
//  Copyright © 2019 North. All rights reserved.
//

#import "ViewController.h"
#import "HostManagerHelper.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ipLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [[HostManagerHelper shareHeler] setDefalutAddress:^NSMutableArray<AddressModel *> *{
        
        NSMutableArray *array = @[].mutableCopy;
        {
            AddressModel *model = [[AddressModel alloc] initWithName:@"百度" ip:@"www.baidu.com" host:nil];
            model.isSelected = YES;
            [array addObject:model];
            
        }
        return array;
        
    }];
    
    
    [self setUpNotice];
    
    [self CurrentAddressChangeNotice];
    
}

- (void)setUpNotice{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CurrentAddressChangeNotice) name:KCurrentAddressChangeNotice object:nil];
    
}

- (void)CurrentAddressChangeNotice{
    
    self.ipLabel.text = CURRENTADDRESS.length >0?CURRENTADDRESS:@"未设置当前地址";
    
}


- (IBAction)showBtnAction:(id)sender {
    
    [[HostManagerHelper shareHeler] showManagerController];
}


- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
@end
