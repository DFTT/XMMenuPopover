//
//  XMMenuItemStyle.h
//  XMMenuPopover
//
//  Created by gyh on 2021/9/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, XMMenuStyle) {
    /// 纯文本
    XMMenuStyleDefault  = 0,
    /// 纯文本 - 仿系统样式
    XMMenuStyleSystem  = 1,
    /// 图文
    XMMenuStyleImageText  = 2,
    ///自定义样式  △ Size(10 * 5)
    XMMenuStyleCustom   = 3
};

@interface XMMenuItemConfig : NSObject

//标题字体样式 - 默认值：`[UIFont systemFontOfSize:14]`
@property(nonatomic, strong) UIFont   *textFont;
//标题字体颜色 - 默认值：`UIColor.whiteColor;`
@property(nonatomic, strong) UIColor  *textColor;
//标题字体高亮颜色 - 默认值：`UIColor.whiteColor;`
@property(nonatomic, strong) UIColor  *textHighlightColor;
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

//获取不同样式下的默认配置
+ (instancetype)configWithStyle:(XMMenuStyle)style;


//自定义配置 - 1
+ (instancetype)configWithFont:(UIFont *)font
                         color:(UIColor *)color;

//自定义配置 - 2
+ (instancetype)configWithTextFont:(UIFont *)textFont
                         textColor:(UIColor *)textColor
                   backgroundColor:(UIColor *)backgroundColor
          highlightBackgroundColor:(UIColor *)highlightBackgroundColor
                         lineColor:(UIColor *)lineColor;

//自定义配置 - 3
+ (instancetype)configWithTextFont:(UIFont *)textFont
                         textColor:(UIColor *)textColor
                   backgroundImage:(UIImage *)backgroundImage
          highlightBackgroundImage:(UIImage *)highlightBackgroundImage
                         lineColor:(UIColor *)lineColor;
 
@end

NS_ASSUME_NONNULL_END
