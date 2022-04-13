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
        self.textFont = [UIFont systemFontOfSize:14];
        self.textColor = UIColor.whiteColor;
        self.textHighlightColor = UIColor.whiteColor;
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
            config.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.9];
            config.highlightBackgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.9];
            break;
        case XMMenuStyleSystem:
            config.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.9];
            config.highlightBackgroundColor = UIColor.darkGrayColor;
            break;
        case XMMenuStyleImageText:
            config.textFont = [UIFont systemFontOfSize:12];
            config.backgroundColor = UIColor.clearColor;
            config.highlightBackgroundColor = UIColor.darkGrayColor;
            config.lineColor = UIColor.clearColor;
            break;
        default:
            break;
    }
    
    return config;
}

+ (instancetype)configWithFont:(UIFont *)font
                         color:(UIColor *)color {
    XMMenuItemConfig *config = [[XMMenuItemConfig alloc] init];
    config.textFont = font;
    config.textColor = color;
    config.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.9];
    config.highlightBackgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.9];
    config.lineColor = color;
    return config;
}

+ (instancetype)configWithTextFont:(UIFont *)textFont
                         textColor:(UIColor *)textColor
                   backgroundColor:(UIColor *)backgroundColor
          highlightBackgroundColor:(UIColor *)highlightBackgroundColor
                         lineColor:(UIColor *)lineColor {
    XMMenuItemConfig *config = [[XMMenuItemConfig alloc] init];
    config.textFont = textFont;
    config.textColor = textColor;
    config.backgroundColor = backgroundColor;
    config.highlightBackgroundColor = highlightBackgroundColor;
    config.lineColor = lineColor;
    return config;
}

+ (instancetype)configWithTextFont:(UIFont *)textFont
                         textColor:(UIColor *)textColor
                   backgroundImage:(UIImage *)backgroundImage
          highlightBackgroundImage:(UIImage *)highlightBackgroundImage
                         lineColor:(UIColor *)lineColor {
    XMMenuItemConfig *config = [[XMMenuItemConfig alloc] init];
    config.textFont = textFont;
    config.textColor = textColor;
    config.backgroundImage = backgroundImage;
    config.highlightBackgroundImage = highlightBackgroundImage;
    config.lineColor = lineColor;
    return config;
}

@end
