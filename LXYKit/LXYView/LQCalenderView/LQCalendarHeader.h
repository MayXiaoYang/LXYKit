//
//  LQCalendarHeader.h
//  LQCalendarView
//
//  Created by liang lee on 2019/8/21.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#ifndef LQCalendarHeader_h
#define LQCalendarHeader_h


/** 屏幕的宽高 */
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//适配屏幕宽高比
#define WidthRatio SCREEN_WIDTH/375.00
#define HeightRatio SCREEN_HEIGHT/667.00

/*设置字体的粗细和大小**/
#define FontThin(size) [UIFont systemFontOfSize:size]
#define FontRough(size) [UIFont boldSystemFontOfSize:size]

/*设置RGB颜色**/
#define ColorWithRGB(Red,Green,Blue) [UIColor colorWithRed:Red/255.0 green:Green/255.0 blue:Blue/255.0 alpha:1.0f]

/** 导航栏高度 */
#define navgationBarH ([[UIApplication sharedApplication] statusBarFrame].size.height + 44.0f)

/** tabbar高度 */
#define tabbarH ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83.0f:49.0f)

/** tabbar底部安全区域高度 */
#define safeSeraH ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34.0f:0.0f)

/** 弱引用 */
#define WeakSelf(type) __weak __typeof__(type) weakSelf = type;

#endif /* LQCalendarHeader_h */

