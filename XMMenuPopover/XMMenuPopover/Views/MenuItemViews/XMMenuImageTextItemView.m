//
//  XMMenuImageTextItemView.m
//  ShakeU
//
//  Created by guoyonghong on 2021/11/5.
//  Copyright © 2021 com.xiaoxian.ShakeU. All rights reserved.
//

#import "XMMenuImageTextItemView.h"

@interface XMMenuImageTextItemView()

@property (nonatomic, strong) UIImageView *iconView;

@end

@implementation XMMenuImageTextItemView

- (void)createView {
    [super createView];
    
    _iconView = ({
        UIImageView *view = [[UIImageView alloc] init];
        view.image = self.item.image;
        [self addSubview:view];
        view;
    });
    
    [self.actionBtn setTitle:nil forState:UIControlStateNormal];
    [self.titleLbl setHidden:NO];
    [self.verticalLineView setHidden:YES];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.item.image != nil && self.item.title != nil) {
        self.iconView.frame = CGRectMake((self.bounds.size.width - 22) / 2, 6, 22, 22);
        self.titleLbl.frame = CGRectMake(5, 30, self.bounds.size.width - 10, 13);
    }
    if (self.item.image != nil && self.item.title == nil) {
        self.iconView.frame = CGRectMake((self.bounds.size.width - 22) / 2, (self.bounds.size.height - 22) / 2, 22, 22);
    }
    if (self.item.image == nil && self.item.title != nil) {
        self.titleLbl.frame = self.bounds;
    }
}

@end
