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


typedef enum : NSUInteger {
    XMMenuStyleXM = 0,      //XM自定义   △ Size (10 * 5) 超过五个不展示
    XMMenuStyleSystem = 1,  //系统样式   △ Size(18.5 * 9) 超过五个暂时不支持滚动展示
    XMMenuStyleWechat,      //微信样式   △ Size(12 * 5)
    XMMenuStyleQQ,          //手Q样式    △ Size(19 * 9)
    XMMenuStyleDingTalk,    //钉钉样式   △ Size(22 * 10)
    XMMenuStyleCustom,      //自定义样式  △ Size(10 * 5)
} XMMenuStyle;

@interface XMMenuPopover : NSObject

@property(class, nonatomic, readonly) XMMenuPopover *sharedMenuPopover;

@property(nonatomic,getter=isMenuVisible) BOOL menuVisible;        // default is NO

- (void)showMenuFromView:(UIView *)targetView
                    rect:(CGRect)targetRect;

- (void)showMenuFromView:(UIView *)targetView
                    rect:(CGRect)targetRect
                animated:(BOOL)animated;

- (void)hideMenu;

@property(nonatomic, assign) XMMenuStyle style; //default is XMMenuStyleDefault
@property(nullable, nonatomic,copy) NSArray<XMMenuItem *> *menuItems;

@property(nonatomic,assign) CGFloat cornerRadius; //default is 5
@property(nonatomic,assign) CGFloat padding; //气泡距离屏幕左右的最小间距  default is 15
@property(nonatomic,strong) UIColor *color; //default is black(alpha = 0.9)
@property(nonatomic,strong) UIColor *highLightColor;
@property(nonatomic,strong) UIColor *textColor; //default is white
@property(nonatomic,strong) UIColor *lineColor; //default is white

//自定义View，如果设置了自定义View，其他属性将失效， 自定义View必须设置size
@property(nonatomic, strong) UIView *customView;

@property(nonatomic,readonly) CGRect menuFrame;


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
