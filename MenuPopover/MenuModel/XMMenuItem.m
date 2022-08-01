//
//  XMMenuItem.m
//  MMMenuPopover
//
//  Created by gyh on 2021/4/25.
//

#import "XMMenuItem.h"

@interface XMMenuItem()

//通过标题以及配置计算出宽度
@property(nonatomic, assign) CGFloat width;

@end

@implementation XMMenuItem
{
    NSMutableDictionary<NSString*, NSNumber*> *_widthMap;
}
- (instancetype)initWithTitle:(NSString *)title
                actionHandler:(void (^)(void))handler {
    self = [super init];
    if (self) {
        self.title = title;
        self.handler = handler;
        [self setup];
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
        [self setup];
    }
    return self;
}

- (instancetype)initWithImage:(id)image
                actionHandler:(void (^)(void))handler {
    self = [super init];
    if (self) {
        self.image = image;
        self.handler = handler;
        [self setup];
    }
    return self;
}

- (instancetype)initWithImage:(id)image
                       target:(id)target
                       action:(SEL)action {
    self = [super init];
    if (self) {
        if ([image isKindOfClass:[UIImage class]]) {
            self.image = (UIImage *)image;
        } else if ([image isKindOfClass:[NSString class]]) {
            self.image = [UIImage imageNamed:(NSString *)image];
        } else {
            NSAssert(false, @"image must be of type UIImage or NSString");
        }
        self.action = action;
        self.target = target;
        [self setup];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                        image:(id)image
                actionHandler:(void (^)(void))handler {
    self = [super init];
    if (self) {
        self.title = title;
        if ([image isKindOfClass:[UIImage class]]) {
            self.image = (UIImage *)image;
        } else if ([image isKindOfClass:[NSString class]]) {
            self.image = [UIImage imageNamed:(NSString *)image];
        } else {
            NSAssert(false, @"image must be of type UIImage or NSString");
        }
        self.handler = handler;
        [self setup];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                        image:(id)image
                       target:(id)target
                       action:(SEL)action {
    self = [super init];
    if (self) {
        self.title = title;
        if ([image isKindOfClass:[UIImage class]]) {
            self.image = (UIImage *)image;
        } else if ([image isKindOfClass:[NSString class]]) {
            self.image = [UIImage imageNamed:(NSString *)image];
        } else {
            NSAssert(false, @"image must be of type UIImage or NSString");
        }
        self.action = action;
        self.target = target;
        [self setup];
    }
    return self;
}

- (void)setup {
    _isLast = NO;
    _widthMap = [NSMutableDictionary dictionary];
}


//通过标题以及配置计算出的宽度
- (CGFloat)calculationWidthWithStyle:(XMMenuStyle)style {
    switch (style) {
        case XMMenuStyleSystem: {
            if (self.title == nil || self.title.length == 0) { return 63; }
            if ([_widthMap.allKeys containsObject:self.title]) {
                return [_widthMap objectForKey:self.title].floatValue;
            }
            CGFloat width = [self.title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.config.textFont} context:nil].size.width;
            width = MAX(width + 16, 63);
            [_widthMap setObject:@(width) forKey:self.title];
            return width;
        }
        case XMMenuStyleImageText:    return 50;
        default:
            if (self.title == nil || self.title.length == 0) { return 45; }
            if ([_widthMap.allKeys containsObject:self.title]) {
                return [_widthMap objectForKey:self.title].floatValue;
            }
            CGFloat width = [self.title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.config.textFont} context:nil].size.width;
            width = MAX(width + 20, 45);
            [_widthMap setObject:@(width) forKey:self.title];
            return width;
    }
}

- (CGFloat)heightWithStyle:(XMMenuStyle)style {
    switch (style) {
        case XMMenuStyleSystem:     return 36;
        case XMMenuStyleImageText:  return 50;
        default:                    return 37;
    }
}

@end
