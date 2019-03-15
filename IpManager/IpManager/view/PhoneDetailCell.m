//
//  PhoneDetailCell.m
//  IpManager
//
//  Created by North on 2019/3/13.
//  Copyright © 2019 North. All rights reserved.
//

#import "PhoneDetailCell.h"

@implementation PhoneDetailCell
{
    
    UILabel * nameLabel;
    UILabel * valueLabel;
    UIImageView *lineView;
    

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self) [self setUpView];
    
    return self;
    
}

- (void)setUpView{
    
   
    
    
    nameLabel = [UILabel new];
    nameLabel.text = @"名字";
    nameLabel.font =  [UIFont fontWithName:@"PingFang-SC-Medium" size: 16];
    nameLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [self.contentView addSubview:nameLabel];
    
    valueLabel = [UILabel new];
    valueLabel.text = @"ip";
    valueLabel.font =  [UIFont systemFontOfSize:14];
    valueLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self.contentView addSubview:valueLabel];
    
    
    
    
   
    
    lineView = [[UIImageView alloc]init];
    lineView.backgroundColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:1];
    
    [self.contentView addSubview:lineView];
    
}
- (void)setData:(NSDictionary *)item{
    
    nameLabel.text = item[@"name"];
    [nameLabel sizeToFit];
    valueLabel.text = item[@"value"];
    [valueLabel sizeToFit];
    
    [self setNeedsLayout];
}



- (void)layoutSubviews{
    
   
    
    nameLabel.frame = CGRectMake(15, 0, nameLabel.bounds.size.width, nameLabel.bounds.size.height);
    CGPoint center = nameLabel.center;
    center.y = CGRectGetHeight(self.bounds)/2.0;
    nameLabel.center = center;
    
    valueLabel.frame = CGRectMake(self.bounds.size.width - 15 -valueLabel.bounds.size.width , 0, valueLabel.bounds.size.width, valueLabel.bounds.size.height);
    CGPoint center2 = valueLabel.center;
    center2.y = CGRectGetHeight(self.bounds)/2.0;
    valueLabel.center = center2;
    
    
    lineView.frame = CGRectMake(0, CGRectGetHeight(self.bounds) - 1/[UIScreen mainScreen].scale, CGRectGetWidth(self.bounds) , 1/[UIScreen mainScreen].scale);
    
    
}

@end
