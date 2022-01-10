//
//  DemoTableViewCell.m
//  XMMenuPopover
//
//  Created by guoyonghong on 2021/12/20.
//

#import "DemoTableViewCell.h"

@interface DemoTableViewCell()

@property (strong, nonatomic) UIButton *leftContentView;
@property (strong, nonatomic) UIButton *rightContentView;
@property (strong, nonatomic) UIButton *centerContentView;


@end

@implementation DemoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self config];
        [self createView];
    }
    return self;
}

- (void)config {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)createView {
    _leftContentView = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"我是收到的消息" forState:UIControlStateNormal];
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [button setBackgroundColor:UIColor.orangeColor];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.layer.cornerRadius = 8;
        [self.contentView addSubview:button];
        
        button.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil attribute:NSLayoutAttributeNotAnAttribute 
                                    multiplier:1.0
                                      constant:120].active = YES;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil attribute:NSLayoutAttributeNotAnAttribute 
                                    multiplier:1.0
                                      constant:40].active = YES;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.contentView
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0
                                      constant:0].active = YES;

        [button.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:20].active = YES;
        [button addTarget:self action:@selector(leftContentViewClick:) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    _rightContentView = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"我是发送的消息" forState:UIControlStateNormal];
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [button setBackgroundColor:UIColor.orangeColor];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.layer.cornerRadius = 8;
        [self.contentView addSubview:button];
        button.translatesAutoresizingMaskIntoConstraints = NO;
        
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:120].active = YES;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:40].active = YES;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.contentView
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0 constant:0].active = YES;

        [button.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:-20].active = YES;
        [button addTarget:self action:@selector(rightContentViewClick:) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    _centerContentView = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"我是系统消息" forState:UIControlStateNormal];
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [button setBackgroundColor:UIColor.orangeColor];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.layer.cornerRadius = 8;
        [self.contentView addSubview:button];
        button.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:140].active = YES;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:40].active = YES;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.contentView
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0
                                      constant:0].active = YES;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeCenterX
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.contentView
                                     attribute:NSLayoutAttributeCenterX
                                    multiplier:1.0
                                      constant:0].active = YES;
        [button addTarget:self action:@selector(centerContentViewClick:) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
}

- (void)leftContentViewClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(DemoTableViewCellDidClickLeftView:style:index:)]) {
        [self.delegate DemoTableViewCellDidClickLeftView:sender style:self.style index:self.index];
    }
}

- (void)rightContentViewClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(DemoTableViewCellDidClickRightView:style:index:)]) {
        [self.delegate DemoTableViewCellDidClickRightView:sender style:self.style index:self.index];
    }
}

- (void)centerContentViewClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(DemoTableViewCellDidClickCenterView:style:index:)]) {
        [self.delegate DemoTableViewCellDidClickCenterView:sender style:self.style index:self.index];
    }
}

- (void)setIndex:(NSUInteger)index {
    [_leftContentView setHidden:index % 2 != 0 || index > 2];
    [_rightContentView setHidden:index % 2 != 1  || index > 2];
    [_centerContentView setHidden:index < 3];
}

@end
