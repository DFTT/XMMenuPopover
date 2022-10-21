//
//  XMMenuPopoverOverlayView.m
//  MMMenuPopover
//
//  Created by gyh on 2021/4/27.
//

#import "XMMenuPopoverOverlayView.h"
#import "XMMenuPopover.h"

@interface XMMenuPopoverOverlayView()<UIGestureRecognizerDelegate>

@end

@implementation XMMenuPopoverOverlayView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (XMMenuPopover.sharedMenuPopover.menuInHideAnimation) {
        return  nil;
    }
    if (XMMenuPopover.sharedMenuPopover.tapPointHandler != nil) {
        XMMenuPopover.sharedMenuPopover.tapPointHandler(point);
    }
    [XMMenuPopover.sharedMenuPopover hideMenu];
    return nil;
}

@end
