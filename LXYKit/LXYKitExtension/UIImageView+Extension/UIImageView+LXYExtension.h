//
//  UIImageView+LXYExtension.h
//  LXYKit
//
//  Created by liang lee on 2019/8/28.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImageView (LXYExtension)

/** 设置imageView的frame 以及 image */
- (void)setFrame:(CGRect)frame image:(UIImage *)image;

/** 设置imageView的frame、image以及backgroundColor */
- (void)setFrame:(CGRect)frame image:(UIImage *)image backgroundColor:(UIColor *)backgroundColor;

@end

