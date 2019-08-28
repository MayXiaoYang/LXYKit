//
//  UILabel+LXYExtension.h
//  LXYKit
//
//  Created by liang lee on 2019/8/28.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UILabel (LXYExtension)


/** 设置label的标题、标题颜色、标题字体 */
- (void)setFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont;

/** 设置label的标题、标题颜色、标题字体、行数*/
- (void)setFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont numOfLines:(NSInteger)numOfLines;

/** 设置label的标题、标题颜色、标题字体、Alignment*/
- (void)setFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont textAlignment:(NSTextAlignment)textAlignment;

/** 设置label的标题、标题颜色、标题字体、Alignment、行数*/
- (void)setFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont textAlignment:(NSTextAlignment)textAlignment numOfLines:(NSInteger)numOfLines;



@end

