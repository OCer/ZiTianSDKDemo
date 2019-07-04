//
//  BaseTableViewCell.m
//  ZiTianSDKDemo
//
//  Created by Cer on 2019/7/4.
//  Copyright © 2019 Cer. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
    }
    
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView Identifier:(NSString *)identifier
{
    id cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[[self class] alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    return cell;
}

@end
