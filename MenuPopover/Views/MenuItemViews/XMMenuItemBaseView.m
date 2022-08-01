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
    return [[self alloc] initWithItem:item];
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

- (void)config {}

- (void)createView {
    _actionBtn = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:self.item.title forState:UIControlStateNormal];
        button.titleLabel.font = self.item.config.textFont;
        [button setTitleColor:self.item.config.textColor forState:UIControlStateNormal];
        [button setTitleColor:self.item.config.textHighlightColor forState:UIControlStateHighlighted];
        [button setTitleColor:self.item.config.textHighlightColor forState:UIControlStateSelected];
        [button xm_setBackgroundColor:self.item.config.backgroundColor forState:UIControlStateNormal];
        [button xm_setBackgroundColor:self.item.config.highlightBackgroundColor forState:UIControlStateHighlighted];
        [button xm_setBackgroundColor:self.item.config.highlightBackgroundColor forState:UIControlStateSelected];
        [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        button;
    });
    
    _titleLbl = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = self.item.title;
        label.font = self.item.config.textFont;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = UIColor.whiteColor;
        [self addSubview:label];
        [label setHidden:YES];
        label;
    });
    
    _verticalLineView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = self.item.config.lineColor;
        [self addSubview:view];
        [view setHidden:self.item.isLast];
        view;
    });
}

- (void)onClick {
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
    
    if ([self.superview.superview.superview isKindOfClass:[XMMenuView class]]) {
        [((XMMenuView *)self.superview.superview.superview).popover hideMenu];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _actionBtn.frame = self.bounds;
    _verticalLineView.frame = CGRectMake(CGRectGetWidth(self.bounds) - (1.0 / UIScreen.mainScreen.scale), (CGRectGetHeight(self.bounds) - 12) / 2, (1.0 / UIScreen.mainScreen.scale), 12);
}

@end
