//
//  UIImage+LXYSearchBar.h
//  LXYKit
//
//  Created by liang lee on 2019/9/9.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LXYSearchBar)

/** 返回一个传入颜色值的iamge对象 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
