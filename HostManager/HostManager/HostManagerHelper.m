//
//  HostManagerHelper.m
//  HostManager
//
//  Created by North on 2019/3/18.
//  Copyright © 2019 North. All rights reserved.
//

#import "HostManagerHelper.h"
#import "IpHomeViewController.h"

@interface HostManagerHelper ()
{
    
    
    NSMutableArray *ipArray;
    AddressModel *currentItem;
}
@end

@implementation HostManagerHelper

+ (instancetype)shareHeler{
    
    static HostManagerHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[HostManagerHelper alloc]init];
        [helper setUp];
    });
    
    return helper;
}

- (void)setUp{
    
    NSArray *array =[self readIpArrayWithPath:[self savePath]];
    
    if(array && array.count > 0){
        
        ipArray = @[].mutableCopy;
        for (NSDictionary *dic in array) {
            AddressModel *model = [[AddressModel alloc]initWithDictionary:dic];
            if(model.isSelected) currentItem = model;
            [ipArray addObject:model];
        }
    }
}

- (void)setDefalutAddress:(ReulstBlock)reulstBlock{
    
    if(!ipArray && reulstBlock){
        
        ipArray = reulstBlock();
        
        for (AddressModel *model in ipArray) {
            
            if(model.isSelected) currentItem = model;
            break;
        }
    }
}

- (NSString *)currentAddress{
    
    if(currentItem) {
        
        if(currentItem.host.length>0) return [NSString stringWithFormat:@"http://%@:%@",currentItem.ip,currentItem.host];
        else return [NSString stringWithFormat:@"http://%@",currentItem.ip];
    }
    
    return nil;
}

- (AddressModel *)currentItem{
    
    return currentItem;
}

- (NSArray *)readSaveIpArray{
    
    return ipArray;
    
}

- (NSString *)savePath{
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:@"SaveIpArray.plist"];
    return filePath;
}


- (NSArray *)readIpArrayWithPath:(NSString *)path{
    
    return [[NSMutableArray alloc] initWithContentsOfFile:path];
}

- (void)saveNewItem:(AddressModel *)item{
    
    //保存
    [ipArray addObject:item];
    [self saveIpArray];
    [[NSNotificationCenter defaultCenter] postNotificationName:KNewAddressNotice object:item];
    
}

- (void)deleteItem:(AddressModel *)item{
    
    if([ipArray containsObject:item]){
        
        [ipArray removeObject:item];
        
    }
    [self saveIpArray];
}

- (void)changeCurrentAddress:(AddressModel *)item{
    
    
    for (AddressModel *model in ipArray) {
        model.isSelected = NO;
    }
    
    item.isSelected = YES;
    currentItem = item;
    [self saveIpArray];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KCurrentAddressChangeNotice object:item];
}
- (void)saveIpArray{
    
    NSMutableArray *array = @[].mutableCopy;
    
    for (AddressModel *item in ipArray) {
        [array addObject:[item transformDictionary]];
    }
    [array writeToFile:[self savePath] atomically:YES];
    
}
- (void)showManagerController{
    
    
    IpHomeViewController *controller = [[IpHomeViewController alloc]init];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:controller];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navController animated:YES completion:nil];
    
}

@end
