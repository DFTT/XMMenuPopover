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
    
    XMMenuItemConfig *config = [[XMMenuItemConfig alloc] init];
    config.textFont = [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
    config.textColor = UIColor.redColor;
    config.textHighlightColor = UIColor.whiteColor;
    config.backgroundColor = UIColor.yellowColor;
    config.highlightBackgroundColor = UIColor.greenColor;
    config.lineColor = UIColor.purpleColor;
    
    XMMenuPopover *menu = [XMMenuPopover sharedMenuPopover];
    menu.style = XMMenuStyleDefault;
    menu.color = UIColor.yellowColor;
    menu.avoidTopMargin += 44; //避开导航条
    XMMenuItem *item1 = [[XMMenuItem alloc] initWithTitle:@"复制" actionHandler:^{
        NSLog(@"88");
    }];
    item1.config = config;
    
    XMMenuItem *item2 = [[XMMenuItem alloc] initWithTitle:@"添加到收藏夹" target:self action:@selector(clickAction)];
    item2.config = config;
    XMMenuItem *item3 = [[XMMenuItem alloc] initWithTitle:@"发送给好友" target:self action:@selector(clickAction)];
    item3.config = config;
    menu.menuItems = @[item1,item2,item3];
    
    CGRect rect = sender.bounds;
    rect.origin.y += rect.size.height + 3;
    rect.size.width = 80;
    
    [menu showMenuFromView:sender rect:sender.bounds animated:YES];
}

- (void)clickAction {
    NSLog(@"XXOO");
}

- (IBAction)showPopover2:(UIButton *)sender {
    XMMenuPopover *menu = [XMMenuPopover sharedMenuPopover];
    menu.style = XMMenuStyleDefault;
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
    menu.avoidTopMargin += 44; //避开导航条
    XMMenuItem *item1 = [[XMMenuItem alloc] initWithTitle:@"复制" actionHandler:^{
        NSLog(@"1");
    }];
    
    XMMenuItem *item2 = [[XMMenuItem alloc] initWithTitle:@"删除" actionHandler:^{
        NSLog(@"2");
    }];
    
    XMMenuItem *item3 = [[XMMenuItem alloc] initWithTitle:@"搜一搜" actionHandler:^{
        NSLog(@"3");
    }];
    
    XMMenuItem *item4 = [[XMMenuItem alloc] initWithTitle:@"加入收藏" actionHandler:^{
        NSLog(@"4");
    }];
    
    XMMenuItem *item5 = [[XMMenuItem alloc] initWithTitle:@"发送给好友" actionHandler:^{
        
    }];
    
    XMMenuItem *item6 = [[XMMenuItem alloc] initWithTitle:@"分享" actionHandler:^{
        
    }];
    
    XMMenuItem *item7 = [[XMMenuItem alloc] initWithTitle:@"查一查" actionHandler:^{
        
    }];
    
    XMMenuItem *item8 = [[XMMenuItem alloc] initWithTitle:@"翻译" actionHandler:^{
        
    }];
    
    menu.menuItems = @[item1, item2, item3, item4, item5, item6, item7, item8];
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
    XMMenuPopover *menu = [XMMenuPopover sharedMenuPopover];
    menu.style = XMMenuStyleImageText;
    menu.avoidTopMargin += 44;
    XMMenuItem *item1 = [[XMMenuItem alloc] initWithTitle:@"复制" image:[UIImage imageNamed:@"img_menu_item_copy"] actionHandler:^{
        
    }];
    
    XMMenuItem *item2 = [[XMMenuItem alloc] initWithTitle:@"删除" image:[UIImage imageNamed:@"img_menu_item_delete"] actionHandler:^{
        
    }];
    
    XMMenuItem *item3 = [[XMMenuItem alloc] initWithTitle:@"撤回" image:[UIImage imageNamed:@"img_menu_item_revoke"] actionHandler:^{
        
    }];
    
    XMMenuItem *item4 = [[XMMenuItem alloc] initWithTitle:@"收藏" image:[UIImage imageNamed:@"img_menu_item_zmoji_add"] actionHandler:^{
            
        }];
    
    XMMenuItem *item5 = [[XMMenuItem alloc] initWithTitle:@"发送" actionHandler:^{
        
    }];
    
    XMMenuItem *item6 = [[XMMenuItem alloc] initWithTitle:@"分享" actionHandler:^{
        
    }];
    
    XMMenuItem *item7 = [[XMMenuItem alloc] initWithTitle:@"查一查" actionHandler:^{
        
    }];
    
    XMMenuItem *item8 = [[XMMenuItem alloc] initWithTitle:@"翻译" actionHandler:^{
        
    }];
    
    XMMenuItem *item9 = [[XMMenuItem alloc] initWithImage:[UIImage imageNamed:@"img_menu_item_copy"] actionHandler:^{
        
    }];
    
    XMMenuItem *item10 = [[XMMenuItem alloc] initWithTitle:@"复制" image:[UIImage imageNamed:@"img_menu_item_copy"] actionHandler:^{
        
    }];
    
    XMMenuItem *item11 = [[XMMenuItem alloc] initWithTitle:@"搜一搜" actionHandler:^{
        NSLog(@"3");
    }];
    
    XMMenuItem *item12 = [[XMMenuItem alloc] initWithTitle:@"翻译" actionHandler:^{
        
    }];
    
    XMMenuItem *item13 = [[XMMenuItem alloc] initWithImage:[UIImage imageNamed:@"img_menu_item_copy"] actionHandler:^{
        
    }];
    
    XMMenuItem *item14 = [[XMMenuItem alloc] initWithTitle:@"复制" image:[UIImage imageNamed:@"img_menu_item_copy"] actionHandler:^{
        
    }];
    
    menu.menuItems = @[item1, item2, item3, item4, item5, item6, item7, item8, item9, item10]; //, item11, item12, item13, item14
    CGRect rect = sender.frame;
    rect.origin.y += rect.size.height + 3;
    rect.size.width = 150;
    [menu showMenuFromView:sender rect:sender.bounds];
}

- (IBAction)showPopover8:(UIButton *)sender {
    [self showPopover7:sender];
}

@end
