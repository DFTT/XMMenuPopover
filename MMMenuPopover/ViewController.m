//
//  ViewController.m
//  MMMenuPopover
//
//  Created by gyh on 2021/4/23.
//

#import "ViewController.h"
#import "XMMenuPopover.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)showPopover:(UIButton *)sender {
    XMMenuPopover *menu = [XMMenuPopover sharedMenuPopover];
    menu.style = XMMenuStyleXM;
    XMMenuItem *item1 = [[XMMenuItem alloc] initWithTitle:@"复制" actionHandler:^{
        NSLog(@"88");
    }];
    
    menu.menuItems = @[item1];
    
    CGRect rect = sender.bounds;
    rect.origin.y += rect.size.height + 3;
    rect.size.width = 80;
    
    [menu showMenuFromView:sender rect:sender.bounds animated:YES];
}

- (IBAction)showPopover2:(UIButton *)sender {
    XMMenuPopover *menu = [XMMenuPopover sharedMenuPopover];
    menu.style = XMMenuStyleXM;
    XMMenuItem *item1 = [[XMMenuItem alloc] initWithTitle:@"复制" actionHandler:^{
        NSLog(@"5");
    }];
    
    XMMenuItem *item2 = [[XMMenuItem alloc] initWithTitle:@"删除" actionHandler:^{
        NSLog(@"6");
    }];
    menu.menuItems = @[item1, item2];
    CGRect rect = sender.frame;
    rect.origin.y += rect.size.height + 3;
    rect.size.width = 180;
    
    [menu showMenuFromView:sender rect:sender.bounds];
}

- (IBAction)showPopover3:(UIButton *)sender {
    XMMenuPopover *menu = [XMMenuPopover sharedMenuPopover];
    menu.style = XMMenuStyleSystem;
    XMMenuItem *item1 = [[XMMenuItem alloc] initWithTitle:@"复制" actionHandler:^{
        NSLog(@"1");
    }];
    
    XMMenuItem *item2 = [[XMMenuItem alloc] initWithTitle:@"删除" actionHandler:^{
        NSLog(@"2");
    }];
    
    XMMenuItem *item3 = [[XMMenuItem alloc] initWithTitle:@"删除" actionHandler:^{
        NSLog(@"3");
    }];
    
    XMMenuItem *item4 = [[XMMenuItem alloc] initWithTitle:@"删除1" actionHandler:^{
        NSLog(@"4");
    }];
    
    XMMenuItem *item5 = [[XMMenuItem alloc] initWithTitle:@"删除2" actionHandler:^{
        
    }];
    
    XMMenuItem *item6 = [[XMMenuItem alloc] initWithTitle:@"删除2" actionHandler:^{
        
    }];
    
    menu.menuItems = @[item1, item2, item3, item4, item5, item6];
    CGRect rect = sender.frame;
    rect.origin.y += rect.size.height + 3;
    rect.size.width = 150;
    [menu showMenuFromView:sender rect:sender.bounds];
}

- (IBAction)showPopover4:(UIButton *)sender {
    [self showPopover3:sender];
}

- (IBAction)showPopover5:(UIButton *)sender {
    [self showPopover3:sender];
}

- (IBAction)showPopover6:(UIButton *)sender {
    [self showPopover2:sender];
}

- (IBAction)showPopover7:(UIButton *)sender {
    [self showPopover3:sender];
}

- (IBAction)showPopover8:(UIButton *)sender {
    [self showPopover3:sender];
}

@end
