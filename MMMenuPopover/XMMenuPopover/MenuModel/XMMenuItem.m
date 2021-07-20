//
//  XMMenuItem.m
//  MMMenuPopover
//
//  Created by gyh on 2021/4/25.
//

#import "XMMenuItem.h"

@interface XMMenuItem()

@property(nonatomic, copy)   NSString *title;
@property(nonatomic, strong) UIImage  *image;
@property(nonatomic)         SEL       action;
@property(nonatomic, weak)   id        target;
@property(nonatomic, copy)   void      (^handler)(void);

@end

@implementation XMMenuItem

- (instancetype)initWithTitle:(NSString *)title
                       target:(id)target
                       action:(SEL)action {
    self = [super init];
    if (self) {
        self.title = title;
        self.action = action;
        self.target = target;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                actionHandler:(void (^)(void))handler {
    self = [super init];
    if (self) {
        self.title = title;
        self.handler = handler;
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
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
                actionHandler:(void (^)(void))handler {
    self = [super init];
    if (self) {
        self.image = image;
        self.handler = handler;
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
    }
    return self;
    
}

@end
