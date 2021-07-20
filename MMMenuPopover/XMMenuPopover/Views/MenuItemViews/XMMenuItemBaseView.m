//
//  XMMenuItemBaseView.m
//  MMMenuPopover
//
//  Created by gyh on 2021/4/25.
//

#import "XMMenuItemBaseView.h"
#import "UIButton+XMMenuPopover.h"
#import "XMMenuView.h"

@interface XMMenuItemBaseView()

@property (nonatomic, strong) XMMenuItem *item;

@end

@implementation XMMenuItemBaseView

+ (instancetype)viewWithItem:(XMMenuItem *)item {
    return [[XMMenuItemBaseView alloc] initWithItem:item];
}

- (instancetype)initWithItem:(XMMenuItem *)item {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.item = item;
        [self config];
        [self createView];
    }
    return self;
}

- (void)config {
    
}

- (void)createView {
    _actionBtn = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:_item.title forState:UIControlStateNormal];
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
        [button addTarget:self action:@selector(didClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        button;
    });
    _verticalLineView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = self.textColor;
        [self addSubview:view];
        view;
    });
}

- (void)didClick {
    if (self.item.handler) {
        self.item.handler();
    } else {
        if ([self.item.target respondsToSelector:self.item.action]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self.item.target performSelector: self.item.action];
#pragma clang diagnostic pop
        }
    }
    if ([self.superview.superview isKindOfClass:[XMMenuView class]]) {
        [((XMMenuView *)self.superview.superview).popover hideMenu];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _actionBtn.frame = self.bounds;
    _verticalLineView.frame = CGRectMake(CGRectGetWidth(self.bounds) - 0.5, (CGRectGetHeight(self.bounds) - 12) / 2, 0.5, 12);
    [_actionBtn setTitleColor:self.textColor forState:UIControlStateNormal];
    [_actionBtn xm_setBackgroundColor:self.color forState:UIControlStateNormal];
    [_actionBtn xm_setBackgroundColor:self.highLightColor forState:UIControlStateHighlighted];
    [_actionBtn xm_setBackgroundColor:self.highLightColor forState:UIControlStateSelected];
    
    _verticalLineView.backgroundColor = self.lineColor;
}

@end
