//
//  XMMenuView.m
//  MMMenuPopover
//
//  Created by gyh on 2021/4/25.
//

#import "XMMenuView.h"
#import "XMMenuItemSystemView.h"

@interface XMMenuView()

@property (nonatomic, strong) UIView *containerView;

@end

@implementation XMMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        self.arrowDirection = XMMenuViewArrowDown;
        _containerView = [[UIView alloc] init];
        [self addSubview:_containerView];
    }
    return self;
}

- (void)setMenuItemViews:(NSArray<XMMenuItemBaseView *> *)menuItemViews {
    _menuItemViews = menuItemViews;
    //删除旧数据
    for (UIView *view in self.containerView.subviews) {
        [view removeFromSuperview];
    }
    
    //布局新UI
    _containerView.frame = CGRectMake(0, self.topMargin, self.bounds.size.width, self.popover.height - self.popover.triangleHeight);
    _containerView.layer.cornerRadius = self.cornerRadius;
    _containerView.layer.masksToBounds = YES;
    
    switch (self.popover.style) {
        case XMMenuStyleDefault:
        case XMMenuStyleSystem:
            [self layoutXMStyle];
            break;
        case XMMenuStyleWechat:
            [self layoutWechatStyle];
            break;
        case XMMenuStyleQQ:
            [self layoutQQStyle];
            break;
        case XMMenuStyleDingTalk:
            [self layoutDingTalkStyle];
            break;
        default:
            break;
    }
}

- (void)layoutXMStyle {
    for (NSInteger i = 0; i < _menuItemViews.count; i++) {
        XMMenuItemBaseView *view = _menuItemViews[i];
        view.color = self.popover.color;
        view.highLightColor = self.popover.highLightColor;
        view.textColor = self.popover.textColor;
        view.lineColor = self.popover.lineColor;
        if (i == _menuItemViews.count - 1) {
            view.lineColor = UIColor.clearColor;
        }
        [self.containerView addSubview:view];
        view.frame = CGRectMake(roundf(self.iPadding + [self iWidth] * i), 0, [self iWidth], [self iHeight]);
    }
}

- (void)layoutWechatStyle {
    
}

- (void)layoutQQStyle {
    
}

- (void)layoutDingTalkStyle {
    
}

- (CGFloat)topMargin {
    return self.arrowDirection == 0 ? [self.popover triangleHeight] : 0;
}

/// 菜单项宽度
- (CGFloat)iWidth {
    switch (self.popover.style) {
        case XMMenuStyleSystem:
            return 63;
        case XMMenuStyleWechat:
            return 56;
        case XMMenuStyleDingTalk:
            return 52;
        case XMMenuStyleQQ:
            return 69;
        case XMMenuStyleDefault:
            return 45;
        default:
            return 0;
    }
}

/// 菜单项高度
- (CGFloat)iHeight {
    switch (self.popover.style) {
        case XMMenuStyleSystem:
            return 36;
        case XMMenuStyleWechat:
            return 73;
        case XMMenuStyleDingTalk:
            return 66;
        case XMMenuStyleQQ:
            return 44;
        case XMMenuStyleDefault:
            return 37;
        default:
            return 0;
    }
}

/// 菜单项左右边Padding
- (CGFloat)iPadding {
    switch (self.popover.style) {
        case XMMenuStyleWechat:
            return 13;
        case XMMenuStyleDingTalk:
            return 10;
        case XMMenuStyleDefault:
            return 5;
        default:
            return 0;
    }
}

//- (CGFloat)widthWithPadding:(CGFloat)padding {
//    CGFloat totalWidth = 0;
//    for (XMMenuItem *item in _menuItems) {
//        CGFloat width = [item.title boundingRectWithSize:CGSizeMake(XM_ScreenWidth - padding * 2 - 30, 30) options:0 attributes:@{
//            NSFontAttributeName:[UIFont systemFontOfSize:14]
//        } context:nil].size.width;
//
//        if (width > (XM_ScreenWidth - 30.0) / 2.0) {
//            width = (XM_ScreenWidth - 30) / 2.0;
//        }
//        width += padding * 2;
//        totalWidth += width;
//    }
//    return totalWidth;
//}


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    CGFloat strokeWidth = 1;
    CGContextSetLineJoin(context, kCGLineJoinRound); //
    CGContextSetLineWidth(context, strokeWidth); // 设置画笔宽度
    CGContextSetStrokeColorWithColor(context, self.color.CGColor); // 设置画笔颜色
    CGContextSetFillColorWithColor(context, self.color.CGColor); // 设置填充颜色

    CGFloat radius = self.cornerRadius;
    CGFloat offset = strokeWidth;
    CGFloat triangleW = self.triangleWidth;
    CGFloat triangleH = self.triangleheight;
    CGFloat triangleCenterX = self.triangleCenterX;
    XMMenuPopoverArrowDirection dirction = self.arrowDirection;
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(
        context,
        radius + offset,
        dirction == 0 ? triangleH + offset : height - triangleH - offset
    );
    
    CGContextAddLineToPoint(
        context,
        round(triangleCenterX - triangleW / 2.0f) - offset,
        dirction == 0 ? triangleH + offset : height - triangleH - offset
    );
    
    CGContextAddLineToPoint(
        context,
        triangleCenterX,
        dirction == 0 ? 0 : height - offset
    );
    
    CGContextAddLineToPoint(
        context,
        round(triangleCenterX + triangleW / 2.0f) + offset,
        dirction == 0 ? triangleH + offset : height - triangleH - offset
    );
    
    CGContextAddArcToPoint(
        context,
        width - offset,
        dirction == 0 ? triangleH + offset : height - triangleH - offset,
        width - offset,
        height / 2,
        radius - strokeWidth
    );
    CGContextAddArcToPoint(
        context,
        width - offset,
        dirction == 0 ? height - offset : offset,
        width - radius - offset,
        dirction == 0 ? height - offset : offset,
        radius - strokeWidth
    );
    CGContextAddArcToPoint(
        context,
        offset,
        dirction == 0 ? height - offset : offset,
        offset,
        dirction == 0 ? height - radius : radius + offset,
        radius - strokeWidth
    );
    CGContextAddArcToPoint(
        context,
        offset,
        dirction == 0 ? triangleH + offset : height - triangleH - offset,
        radius + offset,
        dirction == 0 ? triangleH + offset : height - triangleH - offset,
        radius - strokeWidth
    );
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
