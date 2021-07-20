//
//  XMMenuItemSystemView.m
//  MMMenuPopover
//
//  Created by gyh on 2021/4/26.
//

#import "XMMenuItemSystemView.h"

@implementation XMMenuItemSystemView

+ (instancetype)viewWithItem:(XMMenuItem *)item {
    return [[XMMenuItemSystemView alloc] initWithItem:item];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.verticalLineView.frame = CGRectMake(CGRectGetWidth(self.bounds) - 0.5, 0, 0.5, CGRectGetHeight(self.bounds));
}

@end
