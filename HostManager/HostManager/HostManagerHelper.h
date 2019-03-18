//
//  HostManagerHelper.h
//  HostManager
//
//  Created by North on 2019/3/18.
//  Copyright © 2019 North. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IpModel.h"

#define CURRENTADDRESS [[HostManagerHelper shareHeler] currentAddress]

#define KChangeDomainWayNotice       @"ChangeDomainWayNotice"
#define KChangeIpWayNotice           @"ChangeIpWayNotice"
#define KCurrentAddressChangeNotice  @"CurrentAddressChangeNotice" //当前ip改变通知
#define KNewAddressNotice            @"NewAddressNotice"      //新增ip通知

typedef NSMutableArray<IpModel *> * (^ReulstBlock)(void);


@interface HostManagerHelper : NSObject


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


