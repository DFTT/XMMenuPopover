## XMMenuPopover


### Introduction

一个仿系统(`UIMenuController`)的自定义选择菜单项，实现了纯文本、图文、自定义View等展示样式，你也可以很方便的扩展实现自己的样式【例如微信、钉钉、QQ等聊天界面长按的样式】


### Installation

#### 一、Cocoapods
	
*  在Podfile文件中添加
	
	```
	target 'YouProject' do
	  pod 'XMMenuPopover'
	end
	```
* 命令行执行

	*  `pod repo update master`
	*  `pod install`

#### 二、复制`XMMenuPopover `文件夹至您的项目中即可

### Example

#### 1. 自定义纯文本样式 `XMMenuStyleDefault`

<img src="./images/XMMenuPopover1.gif" width=40% />

#### 2. 仿系统纯文本样式 `XMMenuStyleSystem`

<img src="./images/XMMenuPopover3.gif" width=40% />

#### 3. 图文样式 `XMMenuStyleImageText`

<img src="./images/XMMenuPopover2.gif" width=40% />

#### 4. 自定义View样式 `XMMenuStyleCustom`

<img src="./images/XMMenuPopover4.gif" width=40% />

#### 5. 自定义菜单项风格

<img src="./images/XMMenuPopover5.gif" width=40% />

***PS: 更多样式请查看demo***

### Usage

#### 代码
```OC
XMMenuPopover *menu = [XMMenuPopover sharedMenuPopover];
menu.style = XMMenuStyleSystem;
XMMenuItem *item1 = [[XMMenuItem alloc] initWithTitle:@"复制" actionHandler:^{
    NSLog(@"88");
}];
XMMenuItem *item2 = [[XMMenuItem alloc] initWithTitle:@"添加到收藏夹" target:self action:@selector(clickAction)];
XMMenuItem *item3 = [[XMMenuItem alloc] initWithTitle:@"发送给好友" target:self action:@selector(clickAction)];
menu.menuItems = @[item1,item2,item3];
[menu showMenuFromView:targetView rect:targetView.bounds animated:YES];
```
#### 展示效果

![展示效果](./images/example.png)




### Contribution

You are welcome to fork and submit pull requests.



### License

XMMenuPopover is open-sourced software licensed under the MIT license.

