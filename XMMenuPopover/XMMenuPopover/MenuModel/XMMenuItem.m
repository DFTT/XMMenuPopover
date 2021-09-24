//
//  XMMenuItem.m
//  MMMenuPopover
//
//  Created by gyh on 2021/4/25.
//

#import "XMMenuItem.h"

@interface XMMenuItem()

@end

@implementation XMMenuItem

- (instancetype)initWithTitle:(NSString *)title
                actionHandler:(void (^)(void))handler {
    self = [super init];
    if (self) {
        self.title = title;
        self.handler = handler;
        self.config = [XMMenuItemConfig defaultConfig];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                       target:(id)target
                       action:(SEL)action {
    self = [super init];
    if (self) {
        self.title = title;
        self.action = action;
        self.target = target;
        self.config = [XMMenuItemConfig defaultConfig];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
                actionHandler:(void (^)(void))handler {
    self = [super init];
    if (self) {
        self.image = image;
        self.handler = handler;
        self.config = [XMMenuItemConfig defaultConfig];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
                       target:(id)target
                       action:(SEL)action {
    self = [super init];
    if (self) {
        self.image = image;
        self.action = action;
        self.target = target;
        self.config = [XMMenuItemConfig defaultConfig];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                actionHandler:(void (^)(void))handler {
    self = [super init];
    if (self) {
        self.title = title;
        self.image = image;
        self.handler = handler;
        self.config = [XMMenuItemConfig defaultConfig];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                       target:(id)target
                       action:(SEL)action {
    self = [super init];
    if (self) {
        self.title = title;
        self.image = image;
        self.action = action;
        self.target = target;
        self.config = [XMMenuItemConfig defaultConfig];
    }
    return self;
}

@end
