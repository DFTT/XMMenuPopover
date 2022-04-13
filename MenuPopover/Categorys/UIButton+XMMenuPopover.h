//
//  UIButton+XMMenuPopover.h
//  MMMenuPopover
//
//  Created by gyh on 2021/4/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, XM_ImagePosition) {
    XM_ImagePositionLeft = 0,              //图片在左，文字在右，默认
    XM_ImagePositionRight = 1,             //图片在右，文字在左
    XM_ImagePositionTop = 2,               //图片在上，文字在下
    XM_ImagePositionBottom = 3,            //图片在下，文字在上
};

@interface UIButton (XMMenuPopover)

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)xm_setImagePosition:(XM_ImagePosition)postion spacing:(CGFloat)spacing;

/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)xm_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
