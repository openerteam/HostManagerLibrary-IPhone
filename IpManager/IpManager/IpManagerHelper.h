//
//  IpManagerHelper.h
//  IpManager
//
//  Created by North on 2019/3/12.
//  Copyright © 2019 North. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IpModel.h"


#define IPADDRESS [IpManagerHelper shareHeler].currentAddress

#define KChangeDomainWayNotice       @"ChangeDomainWayNotice"
#define KChangeIpWayNotice           @"ChangeIpWayNotice"
#define KCurrentAddressChangeNotice  @"CurrentAddressChangeNotice" //当前ip改变通知
#define KNewAddressNotice            @"NewAddressNotice"      //新增ip通知




typedef NSMutableArray<IpModel *> * (^ReulstBlock)(void);

@interface IpManagerHelper : NSObject

+ (instancetype)shareHeler;

- (void)setDefalutAddress:(ReulstBlock)reulstBlock;

- (NSString *)currentAddress;

- (IpModel *)currentItem;

- (NSArray *)readSaveIpArray;

- (NSString *)savePath;

- (void)saveNewItem:(IpModel *)item;

- (void)deleteItem:(IpModel *)item;

- (void)changeCurrentAddress:(IpModel *)item;

- (void)showManagerController;





@end

