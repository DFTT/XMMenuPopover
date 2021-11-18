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

@property (nonatomic, strong, readonly) XMMenuItem *item;

@property (nonatomic, strong) UIButton    *actionBtn;
@property (nonatomic, strong) UILabel     *titleLbl;
@property (nonatomic, strong) UIView      *verticalLineView;
@property (nonatomic, strong) UIView      *horizonalLineView;

- (void)createView;

@end

NS_ASSUME_NONNULL_END
