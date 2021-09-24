//
//  XMMenuItemStyle.h
//  XMMenuPopover
//
//  Created by gyh on 2021/9/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMMenuItemConfig : NSObject

//标题字体样式 - 默认值：
@property(nonatomic, strong) UIFont   *font;
//标题字体颜色 - 默认值：`UIColor.whiteColor;`
@property(nonatomic, strong) UIColor  *color;
//背景色 - 默认值：`[UIColor.blackColor colorWithAlphaComponent:0.9];`
@property(nonatomic, strong) UIColor  *backgroundColor;
//高亮背景色 - 默认值：`UIColor.darkGrayColor`
@property(nonatomic, strong) UIColor  *highlightBackgroundColor;

//背景图 - 默认值：nil，与 `backgroundColor` 互斥, 同时设置，只展示`backgroundColor`
@property(nonatomic, strong) UIImage  *backgroundImage;
//高亮背景图 - 默认值：nil， 与 `highlightBackgroundColor` 互斥, 同时设置，只展示`highlightBackgroundColor`
@property(nonatomic, strong) UIImage  *highlightBackgroundImage;

//分割线颜色 - 默认值：`UIColor.whiteColor;`
@property(nonatomic, strong) UIColor  *lineColor;

+ (instancetype)defaultConfig;

@end

NS_ASSUME_NONNULL_END
