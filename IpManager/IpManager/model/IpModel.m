//
//  IpModel.m
//  IpManager
//
//  Created by North on 2019/3/13.
//  Copyright © 2019 North. All rights reserved.
//

#import "IpModel.h"

@implementation IpModel

- (instancetype)initWithName:(NSString *)name ip:(NSString *)ip host:(NSString *)host{
    
    self = [super init];
    
    if(self){
        
        self.name = name;
        self.ip = ip;
        self.host = host;
        
        if(self.ip.length >0){
            
            
            self.pingTester = [[WHPingTester alloc] initWithHostName:self.ip];
            self.pingTester.delegate = self;
            [self.pingTester startPing];
            
        }
    }
    
    return self;
    
}
- (instancetype)initWithDictionary:(NSDictionary *)dic{
    
    self = [super init];
    
    if(self && dic.allKeys.count >0){
        
        if([dic valueForKey:@"name"] && ![[dic valueForKey:@"name"] isEqual:[NSNull null]]) self.name =[dic valueForKey:@"name"];
        else self.name = @"";
        
        if([dic valueForKey:@"ip"] && ![[dic valueForKey:@"ip"] isEqual:[NSNull null]]) self.ip =[dic valueForKey:@"ip"];
        else self.ip = @"";
        
        if([dic valueForKey:@"host"] && ![[dic valueForKey:@"host"] isEqual:[NSNull null]]) self.host =[dic valueForKey:@"host"];
        else self.host = @"";
        
        if([dic valueForKey:@"isSelected"] && ![[dic valueForKey:@"isSelected"] isEqual:[NSNull null]]) self.isSelected =[[dic valueForKey:@"isSelected"] boolValue];
        else self.isSelected = NO;
        
        if(self.ip.length >0){
            
            
            self.pingTester = [[WHPingTester alloc] initWithHostName:self.ip];
            self.pingTester.delegate = self;
            [self.pingTester startPing];
            
        }
  
    }
    
    return self;
    
}

- (NSDictionary *)transformDictionary{
    
    NSMutableDictionary *dic = @{}.mutableCopy;
    [dic setValue:self.name forKey:@"name"];
    [dic setValue:self.ip forKey:@"ip"];
    if(self.host) [dic setValue:self.host forKey:@"host"];
    [dic setValue:@(self.isSelected) forKey:@"isSelected"];
    
    return dic;
}


- (void)didPingSucccessWithTime:(float)time withError:(NSError *)error{
    self.didPing = YES;
    self.result = error?NO:YES;
    if(self.pingBclok)self.pingBclok(self.result);
    
}


@end
