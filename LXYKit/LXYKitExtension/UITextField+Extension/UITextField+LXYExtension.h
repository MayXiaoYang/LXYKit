//
//  UITextField+LXYExtension.h
//  LXYKit
//
//  Created by liang lee on 2019/8/28.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UITextField (LXYExtension)

/** 设置frame、textFont、placeholderText、placeholderTextColor、placeholderTextFont */
- (void)setFrame:(CGRect)frame textFont:(UIFont *)textFont placeholderText:(NSString *)placeholderText placeholderTextColor:(UIColor *)placeholderTextColor placeholderTextFont:(UIFont *)placeholderTextFont;

/** 设置frame、textFont、placeholderText、placeholderTextColor、placeholderTextFont、textEntry */
- (void)setFrame:(CGRect)frame textFont:(UIFont *)textFont placeholderText:(NSString *)placeholderText placeholderTextColor:(UIColor *)placeholderTextColor placeholderTextFont:(UIFont *)placeholderTextFont textEntry:(BOOL)textEntry;

/** 设置frame、textFont、placeholderText、placeholderTextColor、placeholderTextFont、tintColor */
- (void)setFrame:(CGRect)frame textFont:(UIFont *)textFont placeholderText:(NSString *)placeholderText placeholderTextColor:(UIColor *)placeholderTextColor placeholderTextFont:(UIFont *)placeholderTextFont tintColor:(UIColor *)tintColor;

/** 设置frame、textFont、placeholderText、placeholderTextColor、placeholderTextFont、tintColor、textEntry */
- (void)setFrame:(CGRect)frame textFont:(UIFont *)textFont placeholderText:(NSString *)placeholderText placeholderTextColor:(UIColor *)placeholderTextColor placeholderTextFont:(UIFont *)placeholderTextFont tintColor:(UIColor *)tintColor textEntry:(BOOL)textEntry;

@end

