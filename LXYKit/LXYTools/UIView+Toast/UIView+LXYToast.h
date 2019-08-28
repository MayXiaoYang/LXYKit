//
//  UIView+LXYToast.h
//  LQCalendarView
//
//  Created by liang lee on 2019/8/21.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIView (LXYToast)

/** 显示菊花loading */
- (void)lxy_showToast;
/** 显示上菊花下提示语 */
- (void)lxy_showToastWithString:(NSString *)text;

/** 在中间显示提示语 */
- (void)lxy_showTextToastWithString:(NSString *)text;
/** 中间显示提示语之后2s回调事件 */
- (void)lxy_showTextToastWithString:(NSString *)text completion:(void (^)(void))block;
/** 在底部显示提示语 */
- (void)lxy_showBottomTextToastWithString:(NSString *)text;
/** 在底部显示提示语之后2s回调事件 */
- (void)lxy_showBottomTextToastWithString:(NSString *)text completion:(void (^)(void))block;

/** 显示错误提示 */
- (void)lxy_showErrorToast:(id)info;
/** 显示错误之后并回调 */
- (void)lxy_showErrorToast:(id)info completion:(void (^)(void))block;

/** 隐藏Toast */
- (void)lxy_hideToat;


@end

