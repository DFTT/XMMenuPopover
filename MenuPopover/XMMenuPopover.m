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
#import "XMMenuImageTextItemView.h"
#import "XMMenuPopoverOverlayView.h"

@interface XMMenuPopover()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) XMMenuView *menuView;
@property (nonatomic, strong) XMMenuPopoverOverlayView *overlayView;
@property (nonatomic, assign) BOOL needAnimate;

@end

@implementation XMMenuPopover

XMMenuPopover *popover;
+ (XMMenuPopover *)sharedMenuPopover {
    if (popover != nil) { return  popover; }
    popover = [[XMMenuPopover alloc] init];
    [popover config];
    return popover;
}

#pragma mark - Default Config
- (void)config {
    self.color = [UIColor.blackColor colorWithAlphaComponent:0.9];
    self.cornerRadius = 5;
    self.padding = 15;
    self.style = XMMenuStyleDefault;
    
    self.avoidTopMargin = 20;
    if (self.avoidTopMargin > 0) {
        if (@available(iOS 11.0, *)) {
            CGFloat safeTop = [UIApplication sharedApplication] .windows.firstObject.safeAreaInsets.top;
            if (safeTop > 0) {
                self.avoidTopMargin = safeTop;
            }
        }
    }
    self.distanceFromTargetView = 2;
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
    
    if (_style == XMMenuStyleCustom) {
        NSAssert(_customView != nil, @"自定义类型的 `customView`不能为空");
    } else {
        NSAssert(_menuItems != nil, @"菜单项`_menuItems`不能为空");
    }
    //确定展示位置
    [self updatePosition:targetView rect:targetRect];
    
    //配置属性
    self.menuView.color = self.color;
    self.menuView.cornerRadius = self.cornerRadius;
    
    [self.menuView setNeedsDisplay];
    
    //更新UI
    [self update];
    
    self.menuInHideAnimation = NO;
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

    CGFloat originY = CGRectGetMinY(targetRectToWindow) - [self height] - self.distanceFromTargetView;
    
    //默认在顶部展示
    self.menuView.arrowDirection = XMMenuViewArrowDown;
    CGRect contentFrame = CGRectMake(originX, originY, [self width], [self height]);
    
    //如果需要避开导航条或者自定义的内容，则需要调整位置
    if (CGRectGetMinY(targetRectToWindow) - [self height] < self.avoidTopMargin) {
        //在底部展示
        contentFrame.origin.y = CGRectGetMaxY(targetRectToWindow) + self.distanceFromTargetView;
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
        self.menuInHideAnimation = YES;
        if (self.needAnimate) {
            [UIView animateWithDuration:0.2 animations:^{
                self.menuView.alpha = 0;
            } completion:^(BOOL finished) {
                [self.menuView removeFromSuperview];
                [self.overlayView removeFromSuperview];
                self.menuInHideAnimation = NO;
                popover = nil;
            }];
        } else {
            [self.menuView removeFromSuperview];
            [self.overlayView removeFromSuperview];
            self.menuInHideAnimation = NO;
            popover = nil;
        }
    }
}

- (void)update {
    //重设大小UI
    self.menuView.bounds = CGRectMake(0, 0, [self width], [self height]);
    switch (_style) {
        case XMMenuStyleSystem:
            [self configItemViewWithClass:XMMenuItemSystemView.class];
            break;
        case XMMenuStyleImageText:
            [self configItemViewWithClass:XMMenuImageTextItemView.class];
            break;
        case XMMenuStyleCustom:
            [self configCustomView];
            break;
        default:
            [self configItemViewWithClass:XMMenuItemBaseView.class];
            break;
    }
}

- (void)configItemViewWithClass:(Class)class {
    //创建ItemView
    NSMutableArray *itemViews = [NSMutableArray array];
    for (XMMenuItem *item in self.menuItems) {
        XMMenuItemBaseView *view = [class viewWithItem:item];
        [itemViews addObject:view];
    }
    self.menuView.menuItemViews = itemViews.mutableCopy;
}

- (void)configCustomView {
    if (self.menuView.arrowDirection == XMMenuViewArrowUp) {
        CGRect frame = self.customView.frame;
        frame.origin.y =  self.menuView.triangleHeight;
        self.customView.frame = frame;
    }
    self.customView.layer.cornerRadius = self.cornerRadius;
    self.customView.layer.masksToBounds = true;
    [self.menuView addSubview:self.customView];
}

#pragma mark Setter/Getter

- (void)setMenuItems:(NSArray<XMMenuItem *> *)menuItems {
    menuItems.lastObject.isLast = YES;
    //兜底的默认配置
    for (XMMenuItem *item in menuItems) {
        if (item.config == nil) {
            item.config = self.itemConfig ?: [XMMenuItemConfig configWithStyle:self.style];
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

- (CGFloat)width {
    switch (_style) {
        case XMMenuStyleImageText:
            if (_menuItems.count >= 5) {
                return [self.menuItems.firstObject calculationWidthWithStyle:_style] * 5;
            }
            return _menuItems.count * [self.menuItems.firstObject calculationWidthWithStyle:_style];
        case XMMenuStyleCustom:
            return _customView.bounds.size.width;
        default:  //纯文本
        {
            CGFloat width = 0;
            for (XMMenuItem *item in self.menuItems) {
                width += [item calculationWidthWithStyle:_style];
            }
            if (width > XM_ScreenWidth - 30) {
                width = XM_ScreenWidth - 30;
            }
            return  width;
        }
    }
}

- (CGFloat)height {
    switch (_style) {
        case XMMenuStyleImageText: {
            double lineCount = ceil(_menuItems.count / 5.0);
            return [self.menuItems.firstObject heightWithStyle:_style] * lineCount + self.menuView.triangleHeight;
        }
        case XMMenuStyleCustom:
            return _customView.bounds.size.height + self.menuView.triangleHeight;
        default: //纯文本
            return [self.menuItems.firstObject heightWithStyle:_style] + self.menuView.triangleHeight;
    }
}

/// 整个菜单在屏幕上的坐标
- (CGRect)menuFrame {
    return self.menuView.frame;
}

- (BOOL)isMenuVisible {
    return self.menuView.superview != nil;
}

@end
