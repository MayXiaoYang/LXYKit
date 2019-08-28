//
//  UIButton+LXYExtension.m
//  LXYKit
//
//  Created by liang lee on 2019/8/28.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "UIButton+LXYExtension.h"

@implementation UIButton (LXYExtension)

-(void)setFrame:(CGRect)frame image:(UIImage *)image target:(id)target action:(SEL)action{
    [self setFrame:frame normalTitle:nil selectedTitle:nil titleColor:nil selectedTitleColor:nil titleFont:nil normalImage:image selectedImage:nil contentHorAlignment:0 target:target action:action];
}

-(void)setFrame:(CGRect)frame title:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action{
    [self setFrame:frame normalTitle:title selectedTitle:nil titleColor:titleColor selectedTitleColor:nil titleFont:titleFont normalImage:nil selectedImage:nil contentHorAlignment:0 target:target action:action];
}

-(void)setFrame:(CGRect)frame title:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor contentHorAlignment:(UIControlContentHorizontalAlignment)horAlignment target:(id)target action:(SEL)action{
    [self setFrame:frame normalTitle:title selectedTitle:nil titleColor:titleColor selectedTitleColor:nil titleFont:titleFont normalImage:nil selectedImage:nil contentHorAlignment:horAlignment target:target action:action];
}

-(void)setFrame:(CGRect)frame normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage target:(id)target action:(SEL)action{
    [self setFrame:frame normalTitle:nil selectedTitle:nil titleColor:nil selectedTitleColor:nil titleFont:nil normalImage:normalImage selectedImage:selectedImage contentHorAlignment:0 target:target action:action];
}

-(void)setFrame:(CGRect)frame normalTitle:(NSString *)normalTitle selectedTitle:(NSString *)selectedTitle titleColor:(UIColor *)titleColor selectedTitleColor:(UIColor *)selectedTitleColor titleFont:(UIFont *)titleFont normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage contentHorAlignment:(UIControlContentHorizontalAlignment)horAlignment target:(id)target action:(SEL)action{
    self.frame = frame;
    if (normalTitle) {
        [self setTitle:normalTitle forState:UIControlStateNormal];
    }
    if (selectedTitle) {
        [self setTitle:selectedTitle forState:UIControlStateSelected];
    }
    if (titleColor) {
        [self setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (selectedTitleColor) {
        [self setTitleColor:selectedTitleColor forState:UIControlStateSelected];
    }
    if (titleFont) {
        self.titleLabel.font = titleFont;
    }
    if (normalImage) {
        [self setImage:normalImage forState:UIControlStateNormal];
    }
    if (selectedImage) {
        [self setImage:selectedImage forState:UIControlStateSelected];
    }
    if (horAlignment) {
        self.contentHorizontalAlignment = horAlignment;
    }
    if (target && action) {
        [self addTarget:selectedTitle action:action forControlEvents:UIControlEventTouchUpInside];
    }
}

@end
