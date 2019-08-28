//
//  UIView+LXYAnimation.m
//  LQCalendarView
//
//  Created by liang lee on 2019/8/26.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "UIView+LXYAnimation.h"

@implementation UIView (LXYAnimation)

-(void)lxy_appearFormCenterWithDuration:(CGFloat)duration{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *values = [NSMutableArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)], nil];
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    
    [self.layer addAnimation:animation forKey:@"lxy_appear"];
}

-(void)lxy_appearFormCenterSpringAnimationWithDuration:(CGFloat)duration{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *values = [NSMutableArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)], nil];
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    
    [self.layer addAnimation:animation forKey:@"lxy_animation_appear"];
}
-(void)lxy_disappearFormCenterWithDuration:(CGFloat)duration{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *values = [NSMutableArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.7, 0.7, 1.0)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.4, 0.4, 1.0)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)], nil];
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    
    [self.layer addAnimation:animation forKey:@"lxy_disappear"];
}

-(void)lxy_disappearFormCenterSpringAnimationWithDuration:(CGFloat)duration{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
     NSMutableArray *values = [NSMutableArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)], nil];
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
    
    [self.layer addAnimation:animation forKey:@"lxy_animation_disappear"];
}
@end
