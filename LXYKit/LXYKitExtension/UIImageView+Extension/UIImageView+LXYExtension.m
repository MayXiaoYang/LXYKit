//
//  UIImageView+LXYExtension.m
//  LXYKit
//
//  Created by liang lee on 2019/8/28.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "UIImageView+LXYExtension.h"

@implementation UIImageView (LXYExtension)

- (void)setFrame:(CGRect)frame image:(UIImage *)image{
    [self setFrame:frame image:image backgroundColor:nil];
}


- (void)setFrame:(CGRect)frame image:(UIImage *)image backgroundColor:(UIColor *)backgroundColor{
    self.frame = frame;
    if (image) {
        self.image = image;
    }
    if (self.backgroundColor) {
        self.backgroundColor = backgroundColor;
    }
}

@end
