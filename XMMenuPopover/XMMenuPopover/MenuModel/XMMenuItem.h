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
                actionHandler:(void (^)(void))handler NS_DESIGNATED_INITIALIZER;

/// 仅包含图片 - 其他属性默认
/// @param image 图片
/// @param handler 事件回调
- (instancetype)initWithImage:(UIImage *)image
                actionHandler:(void (^)(void))handler NS_DESIGNATED_INITIALIZER;

/// 图文 - 其他属性默认
/// @param title 标题
/// @param image 图片
/// @param handler 事件回调
- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                actionHandler:(void (^)(void))handler NS_DESIGNATED_INITIALIZER;

//MARK: Target SEL 方式初始化

/// 仅包含标题 - 其他属性默认
/// @param title 标题
/// @param target 事件响应者
/// @param action 事件 SEL
- (instancetype)initWithTitle:(NSString *)title
                       target:(id)target
                       action:(SEL)action NS_DESIGNATED_INITIALIZER;

/// 仅包含图片 - 其他属性默认
/// @param image 标题
/// @param target 事件响应者
/// @param action 事件 SEL
- (instancetype)initWithImage:(UIImage *)image
                       target:(id)target
                       action:(SEL)action NS_DESIGNATED_INITIALIZER;

/// 图文 - 其他属性默认
/// @param title 标题
/// @param image 标题
/// @param target 事件响应者
/// @param action 事件 SEL
- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                       target:(id)target
                       action:(SEL)action NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
