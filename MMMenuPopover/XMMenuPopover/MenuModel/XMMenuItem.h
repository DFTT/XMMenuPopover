//
//  XMMenuItem.h
//  MMMenuPopover
//
//  Created by gyh on 2021/4/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMMenuItem : NSObject

@property(readonly) NSString *title;
@property(readonly) UIImage  *image;
@property(readonly) SEL       action;
@property(readonly) id        target;
@property(readonly) void      (^handler)(void);


//MARK: Target SEL 方式初始化


/// 仅包含标题
/// @param title 标题
/// @param target 事件响应者
/// @param action 事件 SEL
- (instancetype)initWithTitle:(NSString *)title
                       target:(id)target
                       action:(SEL)action NS_DESIGNATED_INITIALIZER;


/// 仅包含图片
/// @param image 图片
/// @param target 事件响应者
/// @param action 事件 SEL
- (instancetype)initWithImage:(UIImage *)image
                       target:(id)target
                       action:(SEL)action NS_DESIGNATED_INITIALIZER;



/// 图文
/// @param title 标题
/// @param image 图片
/// @param target 事件响应者
/// @param action 事件 SEL
- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                       target:(id)target
                       action:(SEL)action NS_DESIGNATED_INITIALIZER;

//MARK: Block 回调方式初始化


/// 仅包含标题
/// @param title 标题
/// @param handler 事件回调
- (instancetype)initWithTitle:(NSString *)title
                actionHandler:(void (^)(void))handler NS_DESIGNATED_INITIALIZER;

/// 仅包含图片
/// @param image 图片
/// @param handler 事件回调
- (instancetype)initWithImage:(UIImage *)image
                actionHandler:(void (^)(void))handler NS_DESIGNATED_INITIALIZER;


/// 图文
/// @param title 标题
/// @param image 图片
/// @param handler 事件回调
- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image
                actionHandler:(void (^)(void))handler NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
