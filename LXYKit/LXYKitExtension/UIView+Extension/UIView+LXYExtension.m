//
//  UIView+LXYExtension.m
//  LXYKit
//
//  Created by liang lee on 2019/8/28.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "UIView+LXYExtension.h"

@implementation UIView (LXYExtension)

- (void)setFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor{
    self.frame = frame;
    if (backgroundColor) {
        self.backgroundColor = backgroundColor;
    }
}

@end
