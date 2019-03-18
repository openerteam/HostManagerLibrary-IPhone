//
//  AddressModel.h
//  HostManager
//
//  Created by North on 2019/3/18.
//  Copyright © 2019 North. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WHPingTester.h"

typedef void(^PingResult)(BOOL result);
@interface AddressModel : NSObject<WHPingDelegate>
@property(retain ,nonatomic) NSString *name;
@property(retain ,nonatomic) NSString *ip;
@property(retain ,nonatomic) NSString *host;
@property(assign ,nonatomic) BOOL isSelected;



@property(nonatomic, strong) WHPingTester* pingTester;
@property(assign ,nonatomic) BOOL result;
@property(assign ,nonatomic) BOOL didPing;
@property (copy ,nonatomic) PingResult pingBclok;

- (instancetype)initWithName:(NSString *)name ip:(NSString *)ip host:(NSString *)host;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

- (NSDictionary *)transformDictionary;
@end


