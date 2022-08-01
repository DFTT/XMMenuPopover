//
//  XMMenuItemSystemView.m
//  MMMenuPopover
//
//  Created by gyh on 2021/4/26.
//

#import "XMMenuItemSystemView.h"

@implementation XMMenuItemSystemView

- (void)layoutSubviews {
    [super layoutSubviews];
    self.verticalLineView.frame = CGRectMake(CGRectGetWidth(self.bounds) - (1.0 / UIScreen.mainScreen.scale), 0, (1.0 / UIScreen.mainScreen.scale), CGRectGetHeight(self.bounds));
}

@end
