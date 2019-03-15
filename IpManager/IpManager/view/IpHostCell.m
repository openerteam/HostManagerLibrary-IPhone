//
//  IpHostCell.m
//  IpManager
//
//  Created by North on 2019/3/12.
//  Copyright © 2019 North. All rights reserved.
//

#import "IpHostCell.h"

@implementation IpHostCell
{
    UIImageView * statusView;
    UILabel * nameLabel;
    UILabel * ipLabel;
    UIImageView *checkView;
    UIImageView *lineView;
    
    
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) [self setUpView];
    
    return self;
    
}

- (void)setUpView{
    
    statusView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ip_禁用"]];
    [self.contentView addSubview:statusView];
    
    
    nameLabel = [UILabel new];
    nameLabel.text = @"名字";
    nameLabel.font =  [UIFont fontWithName:@"PingFang-SC-Medium" size: 16];
    nameLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [self.contentView addSubview:nameLabel];
    
    ipLabel = [UILabel new];
    ipLabel.text = @"ip";
    ipLabel.font =  [UIFont systemFontOfSize:14];
    ipLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self.contentView addSubview:ipLabel];
    
    
    
    
    checkView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ip_选中"]];
    [self.contentView addSubview:checkView];
    
    lineView = [[UIImageView alloc]init];
    lineView.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
    
    [self.contentView addSubview:lineView];
    
}
- (void)setIpData:(IpModel *)item{
    
    nameLabel.text = item.name;
    if(item.host.length>0)
    ipLabel.text =[NSString stringWithFormat:@"%@:%@",item.ip,item.host];
    else ipLabel.text  = item.ip;
    
    statusView.image = [UIImage imageNamed:item.result?@"ip_可用":@"ip_禁用"];
    
     checkView.hidden = !item.isSelected;
    
    item.pingBclok = ^(BOOL result) {
        
        self->statusView.image = [UIImage imageNamed:result?@"ip_可用":@"ip_禁用"];
    };
    
    
    
}
- (void)layoutSubviews{
    
    statusView.frame = CGRectMake(15, 25, statusView.image.size.width, statusView.image.size.height);
    
    nameLabel.frame = CGRectMake(30, 0, [UIScreen mainScreen].bounds.size.width  - 30 - 100, nameLabel.font.lineHeight);
    CGPoint center = nameLabel.center;
    center.y = statusView.center.y;
    nameLabel.center = center;
    
    ipLabel.frame = CGRectMake(15, CGRectGetMaxY(nameLabel.frame)+5, [UIScreen mainScreen].bounds.size.width  - 30 - 100, ipLabel.font.lineHeight);
    
    checkView.frame = CGRectMake(CGRectGetWidth(self.bounds) - 15 -checkView.image.size.width, (CGRectGetHeight(self.bounds) - checkView.image.size.height)/2.0, checkView.image.size.width, checkView.image.size.height);
    
    lineView.frame = CGRectMake(15, CGRectGetHeight(self.bounds) - 1/[UIScreen mainScreen].scale, CGRectGetWidth(self.bounds) - 15, 1/[UIScreen mainScreen].scale);
    
    
}




@end
