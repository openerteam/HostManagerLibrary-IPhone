# 网络地址管理
--------------------

### 安装方式
1.cocoapods:
````
pod 'HostMananger'
````
2.导入

--------------------
### 使用说明

设置默认地址列表

````
[[HostManagerHelper shareHeler] setDefalutAddress:^NSMutableArray<AddressModel *> *{
        
        NSMutableArray *array = @[].mutableCopy;
        {
            AddressModel *model = [[AddressModel alloc] initWithName:@"百度" ip:@"www.baidu.com" host:nil];
            model.isSelected = YES;// 默认地址，只能设置一个
            [array addObject:model];
            
        }
        return array;
        
    }];
    
````

获取默认置地址  
1.直接使用宏定义

````
CURRENTADDRESS
````
2.获取
````
[[HostManagerHelper shareHeler] currentAddress];
````
