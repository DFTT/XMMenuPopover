//
//  XMMenuItemStyle.m
//  XMMenuPopover
//
//  Created by gyh on 2021/9/24.
//

#import "XMMenuItemConfig.h"

@implementation XMMenuItemConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        self.font = [UIFont systemFontOfSize:14];
        self.color = UIColor.whiteColor;
        self.backgroundColor = UIColor.clearColor;
        self.highlightBackgroundColor = UIColor.clearColor;
        self.lineColor = UIColor.whiteColor;
    }
    return self;
}

+ (instancetype)configWithStyle:(XMMenuStyle)style {
    
    XMMenuItemConfig *config = [[XMMenuItemConfig alloc] init];
    switch (style) {
        case XMMenuStyleDefault:
            config.font = [UIFont systemFontOfSize:14];
            config.color = UIColor.whiteColor;
            config.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.9];
            config.highlightBackgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.9];
            config.lineColor = UIColor.whiteColor;
            break;
        case XMMenuStyleSystem:
            config.font = [UIFont systemFontOfSize:14];
            config.color = UIColor.whiteColor;
            config.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.9];
            config.highlightBackgroundColor = UIColor.darkGrayColor;
            config.lineColor = UIColor.whiteColor;
            break;
        default:
            break;
    }
    
    return config;
}

+ (instancetype)configWithFont:(UIFont *)font
                         color:(UIColor *)color {
    XMMenuItemConfig *config = [[XMMenuItemConfig alloc] init];
    config.font = font;
    config.color = color;
    config.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.9];
    config.highlightBackgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.9];
    config.lineColor = color;
    return config;
}

+ (instancetype)configWithFont:(UIFont *)font
                         color:(UIColor *)color
               backgroundColor:(UIColor *)backgroundColor
      highlightBackgroundColor:(UIColor *)highlightBackgroundColor
                     lineColor:(UIColor *)lineColor {
    XMMenuItemConfig *config = [[XMMenuItemConfig alloc] init];
    config.font = font;
    config.color = color;
    config.backgroundColor = backgroundColor;
    config.highlightBackgroundColor = highlightBackgroundColor;
    config.lineColor = lineColor;
    return config;
}

+ (instancetype)configWithFont:(UIFont *)font
                         color:(UIColor *)color
               backgroundImage:(UIImage *)backgroundImage
      highlightBackgroundImage:(UIImage *)highlightBackgroundImage
                     lineColor:(UIColor *)lineColor {
    XMMenuItemConfig *config = [[XMMenuItemConfig alloc] init];
    config.font = font;
    config.color = color;
    config.backgroundImage = backgroundImage;
    config.highlightBackgroundImage = highlightBackgroundImage;
    config.lineColor = lineColor;
    return config;
}

@end
