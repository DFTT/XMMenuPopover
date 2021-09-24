//
//  XMMenuItemStyle.m
//  XMMenuPopover
//
//  Created by gyh on 2021/9/24.
//

#import "XMMenuItemConfig.h"

@implementation XMMenuItemConfig

+ (instancetype)defaultConfig {
    XMMenuItemConfig *config = [[XMMenuItemConfig alloc] init];
    config.font = [UIFont systemFontOfSize:14];
    config.color = UIColor.whiteColor;
    config.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.9];
    config.highlightBackgroundColor = UIColor.darkGrayColor;
    config.lineColor = UIColor.whiteColor;
    return config;
}

@end
