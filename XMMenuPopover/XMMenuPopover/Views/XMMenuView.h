//
//  XMMenuView.h
//  MMMenuPopover
//
//  Created by gyh on 2021/4/25.
//

#import <UIKit/UIKit.h>
#import "XMMenuItemBaseView.h"
#import "XMMenuPopover.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    XMMenuViewArrowUp = 0,
    XMMenuViewArrowDown = 1,
} XMMenuPopoverArrowDirection;

@interface XMMenuView : UIView

@property (nonatomic, weak) XMMenuPopover *popover;
@property (nonatomic, strong) NSArray<XMMenuItemBaseView *> *menuItemViews;

@property(nonatomic,strong) UIColor *color; //default is black(alpha = 0.9)
@property(nonatomic,assign) CGFloat cornerRadius; //default is 5
@property(nonatomic,assign) CGFloat triangleWidth;
@property(nonatomic,assign) CGFloat triangleHeight;
@property(nonatomic,assign) CGFloat triangleCenterX;
@property(nonatomic,assign) XMMenuPopoverArrowDirection arrowDirection;

@end

NS_ASSUME_NONNULL_END
