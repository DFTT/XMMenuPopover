//
//  XMMenuItemStyle.h
//  XMMenuPopover
//
//  Created by gyh on 2021/9/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    ///XM自定义   △ Size (10 * 5) 最多支持五个菜单项
    XMMenuStyleDefault  = 0,
    ///仿系统样式   △ Size(18.5 * 9) 最多支持五个菜单项
    XMMenuStyleSystem   = 1,
    ///仿微信样式   △ Size(12 * 5)
    XMMenuStyleWechat   = 2,
    ///仿手Q样式    △ Size(19 * 9)
    XMMenuStyleQQ       = 3,
    ///仿钉钉样式   △ Size(22 * 10)
    XMMenuStyleDingTalk = 4,
    ///自定义样式  △ Size(10 * 5)
    XMMenuStyleCustom   = 5,
} XMMenuStyle;

@interface XMMenuItemConfig : NSObject

//标题字体样式 - 默认值：`[UIFont systemFontOfSize:14]`
@property(nonatomic, strong) UIFont   *font;
//标题字体颜色 - 默认值：`UIColor.whiteColor;`
@property(nonatomic, strong) UIColor  *color;
//背景色 - 默认值：`UIColor.clearColor;`
@property(nonatomic, strong) UIColor  *backgroundColor;
//高亮背景色 - 默认值：`UIColor.clearColor;`
@property(nonatomic, strong) UIColor  *highlightBackgroundColor;

//背景图 - 默认值：nil，与 `backgroundColor` 互斥, 同时设置，只展示`backgroundColor`
@property(nonatomic, strong) UIImage  *backgroundImage;
//高亮背景图 - 默认值：nil， 与 `highlightBackgroundColor` 互斥, 同时设置，只展示`highlightBackgroundColor`
@property(nonatomic, strong) UIImage  *highlightBackgroundImage;

//分割线颜色 - 默认值：`UIColor.whiteColor;`
@property(nonatomic, strong) UIColor  *lineColor;

//获取不同样式下的配置
+ (instancetype)configWithStyle:(XMMenuStyle)style;


//自定义配置 - 1
+ (instancetype)configWithFont:(UIFont *)font
                         color:(UIColor *)color;

//自定义配置 - 2
+ (instancetype)configWithFont:(UIFont *)font
                         color:(UIColor *)color
               backgroundColor:(UIColor *)backgroundColor
      highlightBackgroundColor:(UIColor *)highlightBackgroundColor
                     lineColor:(UIColor *)lineColor;

//自定义配置 - 3
+ (instancetype)configWithFont:(UIFont *)font
                         color:(UIColor *)color
               backgroundImage:(UIImage *)backgroundImage
      highlightBackgroundImage:(UIImage *)highlightBackgroundImage
                     lineColor:(UIColor *)lineColor;
 
@end

NS_ASSUME_NONNULL_END
