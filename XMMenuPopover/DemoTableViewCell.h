//
//  DemoTableViewCell.h
//  XMMenuPopover
//
//  Created by guoyonghong on 2021/12/20.
//

#import <UIKit/UIKit.h>
#import "XMMenuPopover.h"

NS_ASSUME_NONNULL_BEGIN

@class DemoTableViewCell;
@protocol DemoTableViewCellDelegate <NSObject>

- (void)DemoTableViewCellDidClickLeftView:(UIView *)targetView style:(XMMenuStyle)style index:(NSInteger)index;
- (void)DemoTableViewCellDidClickCenterView:(UIView *)targetView style:(XMMenuStyle)style index:(NSInteger)index;
- (void)DemoTableViewCellDidClickRightView:(UIView *)targetView style:(XMMenuStyle)style index:(NSInteger)index;

@end

@interface DemoTableViewCell : UITableViewCell

@property (nonatomic, assign) XMMenuStyle style;
@property (nonatomic, assign) NSUInteger index;  //仅仅是为了展示按钮的测试代码
@property (nonatomic, weak) id<DemoTableViewCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
