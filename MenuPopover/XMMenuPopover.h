//
//  XMMenuPopover.h
//  MMMenuPopover
//
//  Created by gyh on 2021/4/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XMMenuItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface XMMenuPopover : NSObject

@property(class, nonatomic, readonly) XMMenuPopover *sharedMenuPopover;

@property(nonatomic,getter=isMenuVisible) BOOL menuVisible;        // 默认值： NO

///菜单样式，默认值： XMMenuStyleDefault
@property(nonatomic,assign) XMMenuStyle style;
@property(nullable,nonatomic,copy) NSArray<XMMenuItem *> *menuItems;

/// 菜单项配置，可在此处设置一个总配置，你也可以单独为每个菜单项单独配置, 可以设置字体颜色、字体大小、背景色、选中背景色等
@property(nonatomic, strong) XMMenuItemConfig *itemConfig;

/// 气泡圆角，默认值： 5
@property(nonatomic,assign) CGFloat cornerRadius;
/// 气泡距离屏幕左右的最小间距，默认值： 15
@property(nonatomic,assign) CGFloat padding;
/// 颜色，默认值： black(alpha = 0.9) 【整个气泡的颜色，包括三角】
@property(nonatomic,strong) UIColor *color;

//!!!!: 自定义View，如果设置了自定义View，其他属性无效， 自定义View必须设置size
@property(nonatomic,strong) UIView *customView;

/// 顶部避开距离，默认值： (状态栏高度)   eg: 比如要避开导航条之类
@property(nonatomic,assign) CGFloat avoidTopMargin;


/// 气泡与目标view之间的间距， 默认值：2
@property(nonatomic,assign) CGFloat distanceFromTargetView;

@property(nonatomic,readonly) CGRect menuFrame;

/// 回调事件点击的点
@property(nonatomic,copy) void (^tapPointHandler)(CGPoint);

//消失动画正在进行中 - 防止点击事件重复调用
@property (nonatomic,assign) BOOL menuInHideAnimation;

/// 展示菜单项控件
- (void)showMenuFromView:(UIView *)targetView
                    rect:(CGRect)targetRect NS_SWIFT_NAME(show(from:rect:));
/// 展示菜单项控件
- (void)showMenuFromView:(UIView *)targetView
                    rect:(CGRect)targetRect
                animated:(BOOL)animated NS_SWIFT_NAME(show(from:rect:animated:));
/// 隐藏菜单项控件
- (void)hideMenu;

/// 气泡展示总宽度
- (CGFloat)width;
/// 气泡展示总高度
- (CGFloat)height;

@end

NS_ASSUME_NONNULL_END
