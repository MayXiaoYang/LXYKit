//
//  UIButton+LXYExtension.h
//  LXYKit
//
//  Created by liang lee on 2019/8/28.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton (LXYExtension)

/** 设置frame、常态image、点击事件 */
-(void)setFrame:(CGRect)frame image:(UIImage *)image target:(id)target action:(SEL)action;

/** 设置frame、title、titleFont、titleColor、点击事件 */
-(void)setFrame:(CGRect)frame title:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;

/** 设置frame、title、titleFont、titleColor、horAlignment、点击事件 */
-(void)setFrame:(CGRect)frame title:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor contentHorAlignment:(UIControlContentHorizontalAlignment)horAlignment target:(id)target action:(SEL)action;

/** 设置frame、normalImage、selectedImage、点击事件 */
-(void)setFrame:(CGRect)frame normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage target:(id)target action:(SEL)action;

/**
 设置button的属性

 @param frame 设置button的位置和大小
 @param normalTitle 常态标题
 @param selectedTitle 选中状态标题
 @param titleColor 常态标题颜色
 @param selectedTitleColor 选中状态标题颜色
 @param titleFont 标题字体大小
 @param normalImage 常态图片
 @param selectedImage 选中状态图片
 @param horAlignment 对齐方式
 @param target 绑定的事件
 @param action 事件
 */
-(void)setFrame:(CGRect)frame normalTitle:(NSString *)normalTitle selectedTitle:(NSString *)selectedTitle titleColor:(UIColor *)titleColor selectedTitleColor:(UIColor *)selectedTitleColor titleFont:(UIFont *)titleFont normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage contentHorAlignment:(UIControlContentHorizontalAlignment)horAlignment target:(id)target action:(SEL)action;

@end

