//
//  UIView+LXYFrame.m
//  LQCalendarView
//
//  Created by liang lee on 2019/8/21.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "UIView+LXYFrame.h"

@implementation UIView (LXYFrame)


-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
-(CGFloat)x{
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
-(CGFloat)y{
    return self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(CGFloat)width{
    return self.frame.size.width;
}

-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
-(CGFloat)height{
    return self.frame.size.height;
}

-(void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
-(CGFloat)centerX{
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
-(CGFloat)centerY{
    return self.center.y;
}
- (void)setRightX:(CGFloat)rightX{
    CGRect frame = self.frame;
    frame.origin.x = rightX - self.frame.size.width;
    self.frame = frame;
}
- (CGFloat)rightX{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setBottomY:(CGFloat)bottomY{
    CGRect frame = self.frame;
    frame.origin.y = bottomY - self.frame.size.height;
    self.frame = frame;
}
- (CGFloat)bottomY{
    return self.frame.origin.y + self.frame.size.height;
}

@end

