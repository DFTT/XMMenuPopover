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

///default is XMMenuStyleDefault
@property(nonatomic,assign) XMMenuStyle style;
@property(nullable,nonatomic,copy) NSArray<XMMenuItem *> *menuItems;

//圆角，默认值： 5
@property(nonatomic,assign) CGFloat cornerRadius;
///气泡距离屏幕左右的最小间距，默认值： 15
@property(nonatomic,assign) CGFloat padding;
///颜色，默认值： black(alpha = 0.9) 【包括三角的颜色】
@property(nonatomic,strong) UIColor *color;

//!!!!: 自定义View，如果设置了自定义View，其他属性无效， 自定义View必须设置size
@property(nonatomic,strong) UIView *customView;

@property(nonatomic,readonly) CGRect menuFrame;
///是否避开导航条，默认值： YES
@property(nonatomic,assign) BOOL avoidNavigationBar;

///展示菜单项控件
- (void)showMenuFromView:(UIView *)targetView
                    rect:(CGRect)targetRect;
///展示菜单项控件
- (void)showMenuFromView:(UIView *)targetView
                    rect:(CGRect)targetRect
                animated:(BOOL)animated;
///隐藏菜单项控件
- (void)hideMenu;


- (CGFloat)width;
- (CGFloat)height;
- (CGFloat)triangleWidth;
- (CGFloat)triangleHeight;

@end

UIKIT_EXTERN NSNotificationName const XMMenuPopoverWillShowMenuNotification;
UIKIT_EXTERN NSNotificationName const XMMenuPopoverDidShowMenuNotification;
UIKIT_EXTERN NSNotificationName const XMMenuPopoverWillHideMenuNotification;
UIKIT_EXTERN NSNotificationName const XMMenuPopoverDidHideMenuNotification;
UIKIT_EXTERN NSNotificationName const XMMenuPopoverMenuFrameDidChangeNotification;



NS_ASSUME_NONNULL_END
