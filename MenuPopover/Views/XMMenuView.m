//
//  XMMenuView.m
//  MMMenuPopover
//
//  Created by gyh on 2021/4/25.
//

#import "XMMenuView.h"
#import "XMMenuItemSystemView.h"
#import "XMMenuImageTextItemView.h"
@interface XMMenuView()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIScrollView *contentScrollView;

@end

@implementation XMMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        self.arrowDirection = XMMenuViewArrowDown;
        _containerView = [[UIView alloc] init];
        _contentScrollView = [[UIScrollView alloc] init];
        _contentScrollView.showsVerticalScrollIndicator = NO;
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView.bounces = NO;
        [self addSubview:_contentScrollView];
        [_contentScrollView addSubview:_containerView];
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
    _contentScrollView.frame = CGRectMake(0, self.topMargin, self.bounds.size.width, self.popover.height - self.triangleHeight);
    _contentScrollView.contentSize = CGSizeMake([self totalWidth], self.popover.height - self.triangleHeight);
    _contentScrollView.layer.cornerRadius = self.cornerRadius;
    _contentScrollView.layer.masksToBounds = YES;
    [_contentScrollView setContentOffset:CGPointMake(0, 0)];
    _containerView.frame = CGRectMake(0, 0, [self totalWidth], self.popover.height - self.triangleHeight);
    
    switch (self.popover.style) {
        case XMMenuStyleDefault:
        case XMMenuStyleSystem:
            [self layoutDefaultStyle]; break;
        case XMMenuStyleImageText:
            [self layoutImageTextStyle]; break;
        default: break;
    }
}

/// 单行可滚动
- (void)layoutDefaultStyle {
    XMMenuItemBaseView *lastView = nil;
    for (NSInteger i = 0; i < _menuItemViews.count; i++) {
        XMMenuItemBaseView *view = _menuItemViews[i];
        [self.containerView addSubview:view];
        CGFloat itemWidth = [view.item calculationWidthWithStyle:self.popover.style];
        CGFloat originX = lastView ? CGRectGetMaxX(lastView.frame) : 0;
        view.frame = CGRectMake(originX, 0, itemWidth, [view.item heightWithStyle:self.popover.style]);
        lastView = view;
    }
}

/// 超过5个换行展示
- (void)layoutImageTextStyle {
    for (NSInteger i = 0; i < _menuItemViews.count; i++) {
        XMMenuItemBaseView *view = _menuItemViews[i];
        [self.containerView addSubview:view];
        CGFloat itemWidth = [view.item calculationWidthWithStyle:self.popover.style];
        CGFloat itemHeight = [view.item heightWithStyle:self.popover.style];
        CGFloat originX = itemWidth * (i % 5);
        CGFloat originY = itemWidth * floor(i / 5.0);
        view.frame = CGRectMake(originX, originY, itemWidth, itemHeight);
    }
}

- (CGFloat)topMargin {
    return self.arrowDirection == 0 ? self.triangleHeight : 0;
}

///总宽度  - 可滚动宽度
- (CGFloat)totalWidth {
    switch (self.popover.style) {
        case XMMenuStyleDefault:
        case XMMenuStyleSystem:
        {
            CGFloat width = 0;
            for (XMMenuItemBaseView *view in self.menuItemViews) {
                width += [view.item calculationWidthWithStyle:self.popover.style];
            }
            return  width;
        }
        default:return self.popover.width;
    }
}

/// 三角箭头宽度
- (CGFloat)triangleWidth {
    switch (self.popover.style) {
        case XMMenuStyleImageText: return 10;
        default:                   return 10;
    }
}

/// 三角箭头高度
- (CGFloat)triangleHeight {
    switch (self.popover.style) {
        case XMMenuStyleImageText: return 5;
        default:                   return 5;
    }
}

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
    CGFloat triangleW = self.triangleWidth;
    CGFloat triangleH = self.triangleHeight;
    CGFloat triangleCenterX = self.triangleCenterX;
    XMMenuPopoverArrowDirection dirction = self.arrowDirection;
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(
        context,
        radius + strokeWidth,
        dirction == 0 ? triangleH + strokeWidth : height - triangleH - strokeWidth
    );
    
    CGContextAddLineToPoint(
        context,
        round(triangleCenterX - triangleW / 2.0f) - strokeWidth,
        dirction == 0 ? triangleH + strokeWidth : height - triangleH - strokeWidth
    );
    
    CGContextAddLineToPoint(
        context,
        triangleCenterX,
        dirction == 0 ? 0 : height - strokeWidth
    );
    
    CGContextAddLineToPoint(
        context,
        round(triangleCenterX + triangleW / 2.0f) + strokeWidth,
        dirction == 0 ? triangleH + strokeWidth : height - triangleH - strokeWidth
    );
    
    CGContextAddArcToPoint(
        context,
        width - strokeWidth,
        dirction == 0 ? triangleH + strokeWidth : height - triangleH - strokeWidth,
        width - strokeWidth,
        height / 2,
        radius - strokeWidth
    );
    CGContextAddArcToPoint(
        context,
        width - strokeWidth,
        dirction == 0 ? height - strokeWidth : strokeWidth,
        width - radius - strokeWidth,
        dirction == 0 ? height - strokeWidth : strokeWidth,
        radius - strokeWidth
    );
    CGContextAddArcToPoint(
        context,
        strokeWidth,
        dirction == 0 ? height - strokeWidth : strokeWidth,
        strokeWidth,
        dirction == 0 ? height - radius : radius + strokeWidth,
        radius - strokeWidth
    );
    CGContextAddArcToPoint(
        context,
        strokeWidth,
        dirction == 0 ? triangleH + strokeWidth : height - triangleH - strokeWidth,
        radius + strokeWidth,
        dirction == 0 ? triangleH + strokeWidth : height - triangleH - strokeWidth,
        radius - strokeWidth
    );
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
