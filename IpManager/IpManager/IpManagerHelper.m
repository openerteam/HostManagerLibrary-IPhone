//
//  IpManagerHelper.m
//  IpManager
//
//  Created by North on 2019/3/12.
//  Copyright © 2019 North. All rights reserved.
//

#import "IpManagerHelper.h"
#import "IpHomeViewController.h"
#import "IpModel.h"


@interface IpManagerHelper ()
{
    
    
    NSMutableArray *ipArray;
    IpModel *currentItem;
}

@end

@implementation IpManagerHelper

+ (instancetype)shareHeler{
    
    static IpManagerHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[IpManagerHelper alloc]init];
        [helper setUp];
    });
    
    return helper;
}

- (void)setUp{
    
    NSArray *array =[self readIpArrayWithPath:[self savePath]];
    
    if(array && array.count > 0){
        
        ipArray = @[].mutableCopy;
        for (NSDictionary *dic in array) {
            IpModel *model = [[ IpModel alloc]initWithDictionary:dic];
            if(model.isSelected) currentItem = model;
            [ipArray addObject:model];
        }
    }
}

- (void)setDefalutAddress:(ReulstBlock)reulstBlock{
    
    if(!ipArray && reulstBlock){
        
        ipArray = reulstBlock();
        
        for (IpModel *model in ipArray) {
            
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

- (IpModel *)currentItem{
    
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

- (void)saveNewItem:(IpModel *)item{
    
    //保存
    [ipArray addObject:item];
    [self saveIpArray];
    [[NSNotificationCenter defaultCenter] postNotificationName:KNewAddressNotice object:item];
    
}

- (void)deleteItem:(IpModel *)item{
    
    if([ipArray containsObject:item]){
        
        [ipArray removeObject:item];
        
    }
    [self saveIpArray];
}

- (void)changeCurrentAddress:(IpModel *)item{
    
    
    for (IpModel *model in ipArray) {
        model.isSelected = NO;
    }
    
    item.isSelected = YES;
    currentItem = item;
    [self saveIpArray];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KCurrentAddressChangeNotice object:item];
}
- (void)saveIpArray{
    
    NSMutableArray *array = @[].mutableCopy;
    
    for (IpModel *item in ipArray) {
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
