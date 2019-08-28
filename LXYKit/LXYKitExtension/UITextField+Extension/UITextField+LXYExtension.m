//
//  UITextField+LXYExtension.m
//  LXYKit
//
//  Created by liang lee on 2019/8/28.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "UITextField+LXYExtension.h"

@implementation UITextField (LXYExtension)

- (void)setFrame:(CGRect)frame textFont:(UIFont *)textFont placeholderText:(NSString *)placeholderText placeholderTextColor:(UIColor *)placeholderTextColor placeholderTextFont:(UIFont *)placeholderTextFont{
    [self setFrame:frame textFont:textFont placeholderText:placeholderText placeholderTextColor:placeholderTextColor placeholderTextFont:placeholderTextFont tintColor:nil textEntry:NO];
}

- (void)setFrame:(CGRect)frame textFont:(UIFont *)textFont placeholderText:(NSString *)placeholderText placeholderTextColor:(UIColor *)placeholderTextColor placeholderTextFont:(UIFont *)placeholderTextFont textEntry:(BOOL)textEntry{
    [self setFrame:frame textFont:textFont placeholderText:placeholderText placeholderTextColor:placeholderTextColor placeholderTextFont:placeholderTextFont tintColor:nil textEntry:textEntry];
}

- (void)setFrame:(CGRect)frame textFont:(UIFont *)textFont placeholderText:(NSString *)placeholderText placeholderTextColor:(UIColor *)placeholderTextColor placeholderTextFont:(UIFont *)placeholderTextFont tintColor:(UIColor *)tintColor{
    [self setFrame:frame textFont:textFont placeholderText:placeholderText placeholderTextColor:placeholderTextColor placeholderTextFont:placeholderTextFont tintColor:tintColor textEntry:NO];
}

- (void)setFrame:(CGRect)frame textFont:(UIFont *)textFont placeholderText:(NSString *)placeholderText placeholderTextColor:(UIColor *)placeholderTextColor placeholderTextFont:(UIFont *)placeholderTextFont tintColor:(UIColor *)tintColor textEntry:(BOOL)textEntry{
    self.frame = frame;
    if (textFont) {
        self.font = textFont;
    }
    if (placeholderText) {
        self.placeholder = placeholderText;
    }
    if (placeholderTextFont) {
        [self setValue:placeholderTextFont forKeyPath:@"_placeholderLabel.font"];
    }
    if (placeholderTextColor) {
        [self setValue:placeholderTextColor forKeyPath:@"_placeholderLabel.textColor"];
    }
    if (tintColor) {
        self.tintColor = tintColor;
    }
    self.secureTextEntry = textEntry;
}

@end
