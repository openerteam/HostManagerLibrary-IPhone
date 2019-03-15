//
//  ViewController.m
//  IpManager
//
//  Created by North on 2019/3/12.
//  Copyright © 2019 North. All rights reserved.
//

#import "ViewController.h"
#import "IpManagerHelper.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   [[IpManagerHelper shareHeler] setDefalutAddress:^NSMutableArray<IpModel *> *{
      
        NSMutableArray *array = @[].mutableCopy;
        {
            IpModel *model = [[IpModel alloc] initWithName:@"百度" ip:@"www.baidu.com" host:nil];
            model.isSelected = YES;
            [array addObject:model];
 
        }
        return array;
        
    }];
    
    
}
- (IBAction)managerBtnAction:(id)sender {
    
    [[IpManagerHelper shareHeler] showManagerController];
    
    
}


@end
