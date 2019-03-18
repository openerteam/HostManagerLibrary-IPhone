//
//  HostManagerHelper.h
//  HostManager
//
//  Created by North on 2019/3/18.
//  Copyright © 2019 North. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AddressModel.h"

#define CURRENTADDRESS [[HostManagerHelper shareHeler] currentAddress]

#define KChangeDomainWayNotice       @"ChangeDomainWayNotice"
#define KChangeIpWayNotice           @"ChangeIpWayNotice"
#define KCurrentAddressChangeNotice  @"CurrentAddressChangeNotice" //当前ip改变通知
#define KNewAddressNotice            @"NewAddressNotice"      //新增ip通知

typedef NSMutableArray<AddressModel *> * (^ReulstBlock)(void);


@interface HostManagerHelper : NSObject


+ (instancetype)shareHeler;

- (void)setDefalutAddress:(ReulstBlock)reulstBlock;

- (NSString *)currentAddress;

- (AddressModel *)currentItem;

- (NSArray *)readSaveIpArray;

- (NSString *)savePath;

- (void)saveNewItem:(AddressModel *)item;

- (void)deleteItem:(AddressModel *)item;

- (void)changeCurrentAddress:(AddressModel *)item;

- (void)showManagerController;

@end


