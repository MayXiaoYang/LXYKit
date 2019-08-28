//
//  UIView+LXYAnimation.h
//  LQCalendarView
//
//  Created by liang lee on 2019/8/26.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LXYAnimation)

/** 弹出动画 */
-(void)lxy_appearFormCenterWithDuration:(CGFloat)duration;
-(void)lxy_appearFormCenterSpringAnimationWithDuration:(CGFloat)duration;

/** 消失动画 */
-(void)lxy_disappearFormCenterWithDuration:(CGFloat)duration;
-(void)lxy_disappearFormCenterSpringAnimationWithDuration:(CGFloat)duration;

@end

NS_ASSUME_NONNULL_END
