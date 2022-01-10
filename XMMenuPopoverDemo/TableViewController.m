//
//  TableViewController.m
//  XMMenuPopover
//
//  Created by guoyonghong on 2021/12/3.
//

#import "TableViewController.h"
#import "DemoTableViewCell.h"
#import "XMMenuPopover.h"

@interface TableViewController ()<DemoTableViewCellDelegate>

@property (nonatomic, strong) NSArray<NSDictionary *> *dataList;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[DemoTableViewCell class] forCellReuseIdentifier:@"DemoTableViewCell"];
    [self configDataSource];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DemoTableViewCell" forIndexPath:indexPath];
    cell.style = [self.dataList[indexPath.section][@"type"] integerValue];
    cell.index = indexPath.row;
    cell.delegate = self;
    return  cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _dataList[section][@"desc"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  80;
}

- (void)configDataSource {
    self.dataList = @[@{
        @"type":@(XMMenuStyleDefault),
        @"desc":@"纯文本"
    },@{
        @"type":@(XMMenuStyleImageText),
        @"desc":@"图文"
    },@{
        @"type":@(XMMenuStyleSystem),
        @"desc":@"纯文本 - 仿系统样式"
    },@{
        @"type":@(XMMenuStyleCustom),
        @"desc":@"自定义View"
    },@{
        @"type":@(4),
        @"desc":@"自定义菜单项风格"
    }];
}

- (void)DemoTableViewCellDidClickLeftView:(UIView *)targetView style:(XMMenuStyle)style index:(NSInteger)index {
    if (style == XMMenuStyleCustom) {
        [self showCustomView:targetView withIndex:index];
        return;
    }
    
    XMMenuPopover *menu = [XMMenuPopover sharedMenuPopover];
    menu.style = style;
    
    //MARK: 自定义菜单项风格【字体颜色、字体大小、背景色】
    if (style == 4) {
        menu.style = (XMMenuStyle)(arc4random_uniform(3));
        //样式
        menu.color = UIColor.redColor;
        menu.itemConfig = [self customConfig];
    }
    
    menu.avoidTopMargin += 44; //避开导航条
    XMMenuItem *item1 = [[XMMenuItem alloc] initWithTitle:@"复制" actionHandler:^{
        NSLog(@"88");
    }];
    XMMenuItem *item2 = [[XMMenuItem alloc] initWithTitle:@"添加到收藏夹" target:self action:@selector(clickAction)];
    XMMenuItem *item3 = [[XMMenuItem alloc] initWithTitle:@"发送给好友" target:self action:@selector(clickAction)];
    
    //MARK: - 图文样式俩个字比较好看
    if (style == XMMenuStyleImageText) {
        item2.title = @"删除";
        item3.title = @"选择";
    }
    
    menu.menuItems = @[item1,item2,item3];
    [menu showMenuFromView:targetView rect:targetView.bounds animated:YES];
}

- (void)DemoTableViewCellDidClickCenterView:(UIView *)targetView style:(XMMenuStyle)style index:(NSInteger)index {
    if (style == XMMenuStyleCustom) {
        [self showCustomView:targetView withIndex:index];
        return;
    }
    
    [self DemoTableViewCellDidClickRightView:targetView style:style index:index];
}

- (void)DemoTableViewCellDidClickRightView:(UIView *)targetView style:(XMMenuStyle)style index:(NSInteger)index {
    if (style == XMMenuStyleCustom) {
        [self showCustomView:targetView withIndex:index];
        return;
    }
    XMMenuPopover *menu = [XMMenuPopover sharedMenuPopover];
    menu.style = style;
    
    //MARK: 自定义菜单项风格
    if (style == 4) {
        menu.style = (XMMenuStyle)(arc4random_uniform(3));
        //样式
        menu.color = UIColor.redColor;
        menu.itemConfig = [self customConfig];
    }
    menu.avoidTopMargin += 44;
    XMMenuItem *item1 = [[XMMenuItem alloc] initWithTitle:@"复制" image:[UIImage imageNamed:@"img_menu_item_copy"] actionHandler:^{}];
    XMMenuItem *item2 = [[XMMenuItem alloc] initWithTitle:@"删除" image:[UIImage imageNamed:@"img_menu_item_delete"] actionHandler:^{}];
    XMMenuItem *item3 = [[XMMenuItem alloc] initWithTitle:@"撤回" image:[UIImage imageNamed:@"img_menu_item_revoke"] actionHandler:^{}];
    XMMenuItem *item4 = [[XMMenuItem alloc] initWithTitle:@"收藏" image:[UIImage imageNamed:@"img_menu_item_zmoji_add"] actionHandler:^{}];
    XMMenuItem *item5 = [[XMMenuItem alloc] initWithTitle:@"发送" actionHandler:^{}];
    XMMenuItem *item6 = [[XMMenuItem alloc] initWithTitle:@"分享" actionHandler:^{}];
    XMMenuItem *item7 = [[XMMenuItem alloc] initWithTitle:@"查一查" actionHandler:^{}];
    XMMenuItem *item8 = [[XMMenuItem alloc] initWithTitle:@"翻译" actionHandler:^{}];
    XMMenuItem *item9 = [[XMMenuItem alloc] initWithImage:[UIImage imageNamed:@"img_menu_item_copy"] actionHandler:^{}];
    XMMenuItem *item10 = [[XMMenuItem alloc] initWithTitle:@"复制" image:[UIImage imageNamed:@"img_menu_item_copy"] actionHandler:^{}];
    
    NSMutableArray *menus = [NSMutableArray arrayWithArray:@[item1, item2, item3, item4, item5, item6, item7, item8, item10]];
    
    //MARK: - 只有图文样式才支持纯图片
    if (style == XMMenuStyleImageText) {
        [menus insertObject:item9 atIndex:8];
    }
    
    menu.menuItems = menus;
    [menu showMenuFromView:targetView rect:targetView.bounds];
}


- (void)clickAction {
    NSLog(@"click----");
}

//MARK: - 自定义菜单项样式
- (XMMenuItemConfig *)customConfig {
    XMMenuItemConfig *config = [[XMMenuItemConfig alloc] init];
    config.textFont = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
    config.textColor = UIColor.cyanColor;
    config.textHighlightColor = UIColor.blackColor;
    config.backgroundColor = UIColor.redColor;
    config.highlightBackgroundColor = UIColor.greenColor;
    config.lineColor = UIColor.yellowColor;
    return config;
}

//MARK: 展示自定义View
- (void)showCustomView:(UIView *)targetView withIndex:(NSInteger)index {
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    label.text = [NSString stringWithFormat:@"我是自定义View - %@", @(index)];
    label.font = [UIFont systemFontOfSize:24];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = UIColor.whiteColor;
    [customView addSubview:label];
    
    XMMenuPopover *menu = [XMMenuPopover sharedMenuPopover];
    menu.style = XMMenuStyleCustom;
    menu.avoidTopMargin += 44;
    menu.customView = customView;
    [menu showMenuFromView:targetView rect:targetView.bounds];
}

@end
