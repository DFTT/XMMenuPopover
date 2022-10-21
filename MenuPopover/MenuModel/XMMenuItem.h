//
//  XMMenuItem.h
//  MMMenuPopover
//
//  Created by gyh on 2021/4/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XMMenuItemConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface XMMenuItem : NSObject

//标题
@property(nonatomic, copy)   NSString *title;
//图片  - 默认值：nil
@property(nonatomic, strong) UIImage  *image;

//是否是最后一项 - 用来隐藏竖线
@property (nonatomic, assign) BOOL isLast;

//点击回调事件
@property(nonatomic, copy)   void (^handler)(void);

//事件接受者
@property(nonatomic, weak)   id target;
//点击事件, 如果和`handler`同时设置，则优先响应 `handler`
@property(nonatomic, assign) SEL action;

//样式配置 - 默认值：[XMMenuItemConfig defaultConfig];
@property(nonatomic, strong) XMMenuItemConfig *config;

//MARK: Block 回调方式初始化

/// 仅包含标题 - 其他属性默认
/// @param title 标题
/// @param handler 事件回调
- (instancetype)initWithTitle:(NSString *)title
                actionHandler:(void (^)(void))handler NS_DESIGNATED_INITIALIZER NS_SWIFT_NAME(init(title:_:));

/// 仅包含图片 - 其他属性默认
/// @param image 图片 【UIimage对象 或者 NSString图片名】
/// @param handler 事件回调
- (instancetype)initWithImage:(id)image
                actionHandler:(void (^)(void))handler NS_DESIGNATED_INITIALIZER NS_SWIFT_NAME(init(image:_:));

/// 图文 - 其他属性默认
/// @param title 标题
/// @param image 图片 【UIimage对象 或者 NSString图片名】
/// @param handler 事件回调
- (instancetype)initWithTitle:(NSString *)title
                        image:(id)image
                actionHandler:(void (^)(void))handler NS_DESIGNATED_INITIALIZER NS_SWIFT_NAME(init(title:image:_:));

//MARK: Target SEL 方式初始化

/// 仅包含标题 - 其他属性默认
/// @param title 标题
/// @param target 事件响应者
/// @param action 事件 SEL
- (instancetype)initWithTitle:(NSString *)title
                       target:(id)target
                       action:(SEL)action NS_DESIGNATED_INITIALIZER NS_SWIFT_NAME(init(title:target:action:));

/// 仅包含图片 - 其他属性默认
/// @param image 图片 【UIimage对象 或者 NSString图片名】
/// @param target 事件响应者
/// @param action 事件 SEL
- (instancetype)initWithImage:(id)image
                       target:(id)target
                       action:(SEL)action NS_DESIGNATED_INITIALIZER NS_SWIFT_NAME(init(image:target:action:));

/// 图文 - 其他属性默认
/// @param title 标题
/// @param image 图片 【UIimage对象 或者 NSString图片名】
/// @param target 事件响应者
/// @param action 事件 SEL
- (instancetype)initWithTitle:(NSString *)title
                        image:(id)image
                       target:(id)target
                       action:(SEL)action NS_DESIGNATED_INITIALIZER NS_SWIFT_NAME(init(title:image:target:action:));

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;


//通过标题以及配置计算出的宽度
- (CGFloat)calculationWidthWithStyle:(XMMenuStyle)style;
//通过样式拿高度
- (CGFloat)heightWithStyle:(XMMenuStyle)style;

@end

NS_ASSUME_NONNULL_END
