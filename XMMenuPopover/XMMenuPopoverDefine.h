//
//  XMMenuPopoverDefine.h
//  MMMenuPopover
//
//  Created by gyh on 2021/4/25.
//

#ifndef XMMenuPopoverDefine_h
#define XMMenuPopoverDefine_h

#ifdef __OBJC__

//获取屏幕 宽度、高度
#ifndef XM_ScreenHeight
#define XM_ScreenHeight      [[UIScreen mainScreen] bounds].size.height
#endif

#ifndef XM_ScreenWidth
#define XM_ScreenWidth       [[UIScreen mainScreen] bounds].size.width
#endif

#endif

#endif /* XMMenuPopoverDefine_h */
