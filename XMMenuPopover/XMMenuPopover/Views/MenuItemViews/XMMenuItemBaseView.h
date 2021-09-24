//
//  XMMenuItemBaseView.h
//  MMMenuPopover
//
//  Created by gyh on 2021/4/25.
//

#import <UIKit/UIKit.h>
#import "XMMenuItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface XMMenuItemBaseView : UIView

+ (instancetype)viewWithItem:(XMMenuItem *)item;

- (instancetype)initWithItem:(XMMenuItem *)item;

@property(nonatomic,strong) UIColor *color; //default is black(alpha = 0.9)
@property(nonatomic,strong) UIColor *highLightColor; //default is black(alpha = 1.0)
@property(nonatomic,strong) UIColor *textColor; //default is white

@property(nonatomic,strong) UIColor *lineColor; //default is white

@property (nonatomic, strong, readonly) XMMenuItem *item;

@property (nonatomic, strong) UIButton    *actionBtn;
@property (nonatomic, strong) UIView      *verticalLineView;
@property (nonatomic, strong) UIView      *horizonalLineView;


@end

NS_ASSUME_NONNULL_END
