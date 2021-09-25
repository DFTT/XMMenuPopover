//
//  XMMenuPopover.m
//  MMMenuPopover
//
//  Created by gyh on 2021/4/23.
//

#import "XMMenuPopover.h"
#import "XMMenuView.h"
#import "XMMenuPopoverDefine.h"
#import "XMMenuItemSystemView.h"
#import "XMMenuPopoverOverlayView.h"

@interface XMMenuPopover()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) XMMenuView *menuView;
@property (nonatomic, strong) XMMenuPopoverOverlayView *overlayView;
@property (nonatomic, assign) BOOL needAnimate;

@end

@implementation XMMenuPopover

static XMMenuPopover *popover;
+ (XMMenuPopover *)sharedMenuPopover {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        popover = [[XMMenuPopover alloc] init];
        [popover config];
    });
    return popover;
}

#pragma mark - Default Config
- (void)config {
    self.color = [UIColor.blackColor colorWithAlphaComponent:0.9];
    self.textColor = UIColor.whiteColor;
    self.lineColor = UIColor.whiteColor;
    self.cornerRadius = 5;
    self.padding = 15;
    self.style = XMMenuStyleDefault;
    self.avoidNavigationBar = YES;
}

- (void)showMenuFromView:(UIView *)targetView
                    rect:(CGRect)targetRect {
    [self showMenuFromView:targetView rect:targetRect animated:YES];
}

- (void)showMenuFromView:(UIView *)targetView
                    rect:(CGRect)targetRect
                animated:(BOOL)animated {
    //整个进程内只展示一个
    if (self.menuView.superview) {
        [self.menuView removeFromSuperview];
    }
    self.needAnimate = animated;
    
    NSAssert(_menuItems != nil, @"菜单项`_menuItems`不能为空");
    if (_style == XMMenuStyleCustom) {
        NSAssert(_customView != nil, @"自定义类型的 `customView`不能为空");
    }
    //确定展示位置
    [self updatePosition:targetView rect:targetRect];
    
    //配置属性
    self.menuView.color = self.color;
    self.menuView.cornerRadius = self.cornerRadius;
    self.menuView.triangleWidth = [self triangleWidth];
    self.menuView.triangleheight = [self triangleHeight];
    
    [self.menuView setNeedsDisplay];
    
    //更新UI
    [self update];
}

- (void)updatePosition:(UIView *)targetView rect:(CGRect)targetRect {
    UIWindow *effectWindow = UIApplication.sharedApplication.windows[0];
    //转换坐标
    CGRect targetRectToWindow = [targetView.superview convertRect:targetView.frame toView:effectWindow];
    //判断位置
    CGFloat originX = CGRectGetMinX(targetRectToWindow) + (CGRectGetMaxX(targetRect) - [self width]) / 2;
    self.menuView.triangleCenterX = [self width] / 2;
    if (originX + [self width] > XM_ScreenWidth - self.padding) {
        originX = XM_ScreenWidth - [self width] - self.padding;
        self.menuView.triangleCenterX = [self width] - (originX + [self width] - CGRectGetMaxX(targetRectToWindow) + CGRectGetMidX(targetRect));
    }
    if (originX < self.padding) {
        originX = self.padding;
        self.menuView.triangleCenterX = CGRectGetMinX(targetRectToWindow) - originX + CGRectGetMidX(targetRect);
    }

    CGFloat originY = CGRectGetMinY(targetRectToWindow) - [self height] - 1;
    
    //默认在顶部展示
    self.menuView.arrowDirection = XMMenuViewArrowDown;
    CGRect contentFrame = CGRectMake(originX, originY, [self width], [self height]);
    
    //顶部稍微留点距离
    CGFloat topMargin = 20;
    //如果需要避开导航条，则需要调整位置
    if (self.avoidNavigationBar) {
        topMargin = 64.0;
        if (@available(iOS 11.0, *)) {
            CGFloat safeBottom = [UIApplication sharedApplication] .windows.firstObject.safeAreaInsets.bottom;
            if (safeBottom > 0) {
                topMargin = 88.0;
            }
        }
    }
    
    if (CGRectGetMinY(targetRectToWindow) - [self height] < topMargin) {
        //在底部展示
        contentFrame.origin.y = CGRectGetMaxY(targetRectToWindow) + 1;
        self.menuView.arrowDirection = XMMenuViewArrowUp;
    }
    
    self.menuView.frame = contentFrame;
    self.overlayView.frame = effectWindow.bounds;
    self.overlayView.menuView = self.menuView;
    [effectWindow addSubview:self.overlayView];
    if (self.needAnimate) {
        self.menuView.alpha = 0;
        [effectWindow addSubview:self.menuView];
        [UIView animateWithDuration:0.3 animations:^{
            self.menuView.alpha = 1;
        }];
    } else {
        [effectWindow addSubview:self.menuView];
    }
}

- (void)hideMenu {
    if (self.menuView.superview) {
        if (self.needAnimate) {
            [UIView animateWithDuration:0.2 animations:^{
                self.menuView.alpha = 0;
            } completion:^(BOOL finished) {
                [self.menuView removeFromSuperview];
                [self.overlayView removeFromSuperview];
            }];
        } else {
            [self.menuView removeFromSuperview];
            [self.overlayView removeFromSuperview];
        }
    }
}

- (void)update {
    //重设大小UI
    self.menuView.bounds = CGRectMake(0, 0, [self width], [self height]);
    switch (_style) {
        case XMMenuStyleSystem:
            [self configSystemItems];
            break;
        case XMMenuStyleWechat:
            break;
        case XMMenuStyleDingTalk:
            break;
        case XMMenuStyleQQ:
            break;
        case XMMenuStyleCustom:
            break;
        default:
            [self configXMItems];
            break;
    }
    
    
}

- (void)configSystemItems {
    //创建ItemView
    NSMutableArray *itemViews = [NSMutableArray array];
    for (XMMenuItem *item in self.menuItems) {
        XMMenuItemSystemView *view = [XMMenuItemSystemView viewWithItem:item];
        [itemViews addObject:view];
    }
    self.menuView.menuItemViews = itemViews.mutableCopy;
}

- (void)configXMItems {
    //创建ItemView
    NSMutableArray *itemViews = [NSMutableArray array];
    for (XMMenuItem *item in self.menuItems) {
        XMMenuItemBaseView *view = [XMMenuItemBaseView viewWithItem:item];
        [itemViews addObject:view];
    }
    self.menuView.menuItemViews = itemViews.mutableCopy;
}

#pragma mark Setter/Getter

- (void)setMenuItems:(NSArray<XMMenuItem *> *)menuItems {
    menuItems.lastObject.isLast = YES;
    //兜底的默认配置
    for (XMMenuItem *item in menuItems) {
        if (item.config == nil) {
            item.config = [XMMenuItemConfig configWithStyle:self.style];
        }
    }
    _menuItems = menuItems;
}

- (XMMenuView *)menuView {
    if (!_menuView) {
        _menuView = [[XMMenuView alloc] init];
        _menuView.popover = self;
    }
    return _menuView;
}

- (XMMenuPopoverOverlayView *)overlayView {
    if (!_overlayView) {
        _overlayView = [[XMMenuPopoverOverlayView alloc] init];
    }
    return _overlayView;
}

- (CGFloat)height {
    switch (_style) {
        case XMMenuStyleWechat:
        case XMMenuStyleQQ: {
            double lineCount = ceil(_menuItems.count / 5.0);
            return [self.menuItems.firstObject heightWithStyle:_style] * lineCount + [self triangleHeight];
        }
        case XMMenuStyleDingTalk: {
            double lineCount = ceil(_menuItems.count / 6.0);
            return [self.menuItems.firstObject heightWithStyle:_style] * lineCount + [self triangleHeight];
        }
        case XMMenuStyleCustom:
            return _customView.bounds.size.height;
        default: //XMStyle 、 System
            return [self.menuItems.firstObject heightWithStyle:_style] + [self triangleHeight];
    }
}

- (CGFloat)width {
    switch (_style) {
        case XMMenuStyleDefault:
        case XMMenuStyleSystem:
        {
            CGFloat width = 2 * self.menuView.iPadding;
            for (XMMenuItem *item in self.menuItems) {
                width += [item calculationWidthWithStyle:_style];
            }
            if (width > XM_ScreenWidth - 30) {
                width = XM_ScreenWidth - 30;
            }
            return  width;
        }
        case XMMenuStyleDingTalk:
            if (_menuItems.count >= 6) {
                return self.menuView.iPadding * 2 + [self.menuItems.firstObject calculationWidthWithStyle:_style] * 6;
            }
            return self.menuView.iPadding * 2 + _menuItems.count * [self.menuItems.firstObject calculationWidthWithStyle:_style];
        case XMMenuStyleCustom:
            return _customView.bounds.size.width;
        default:  //微信、QQ
            if (_menuItems.count >= 5) {
                return self.menuView.iPadding * 2 + [self.menuItems.firstObject calculationWidthWithStyle:_style] * 5;
            }
            return self.menuView.iPadding * 2 + _menuItems.count * [self.menuItems.firstObject calculationWidthWithStyle:_style];
    }
}

/// 三角箭头宽度
- (CGFloat)triangleWidth {
    switch (_style) {
        case XMMenuStyleSystem:     return 18.5;
        case XMMenuStyleWechat:     return 12;
        case XMMenuStyleDingTalk:   return 22;
        case XMMenuStyleQQ:         return 19;
        case XMMenuStyleCustom:     return 10;
        default:                    return 10;
    }
}

/// 三角箭头高度
- (CGFloat)triangleHeight {
    switch (_style) {
        case XMMenuStyleSystem:     return 10;
        case XMMenuStyleWechat:     return 5;
        case XMMenuStyleDingTalk:   return 10;
        case XMMenuStyleQQ:         return 9;
        case XMMenuStyleCustom:     return 5;
        default:                    return 5;
    }
}

/// 气泡圆角
- (CGFloat)cornerRadius {
    switch (_style) {
        case XMMenuStyleWechat:     return 5;
        case XMMenuStyleDingTalk:   return 15;
        case XMMenuStyleQQ:         return 8;
        default:                    return _cornerRadius;
    }
    return _cornerRadius;
}

- (UIColor *)highLightColor {
    if (_highLightColor != nil) { return _highLightColor; }
    switch (_style) {
        case XMMenuStyleWechat:     return UIColor.redColor;
        case XMMenuStyleDingTalk:   return UIColor.yellowColor;
        case XMMenuStyleQQ:         return UIColor.lightGrayColor;
        case XMMenuStyleSystem:     return UIColor.darkGrayColor;
        default:                    return _color;
    }
}

/// 整个菜单在屏幕上的坐标
- (CGRect)menuFrame {
    return self.menuView.frame;
}

@end
