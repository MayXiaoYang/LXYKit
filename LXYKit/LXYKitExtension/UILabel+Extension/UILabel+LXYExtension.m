//
//  UILabel+LXYExtension.m
//  LXYKit
//
//  Created by liang lee on 2019/8/28.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "UILabel+LXYExtension.h"

@implementation UILabel (LXYExtension)

- (void)setFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont{
    [self setFrame:frame text:text textColor:textColor textFont:textFont textAlignment:0 numOfLines:1];
}

- (void)setFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont numOfLines:(NSInteger)numOfLines{
    [self setFrame:frame text:text textColor:textColor textFont:textFont textAlignment:0 numOfLines:numOfLines];
}

- (void)setFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont textAlignment:(NSTextAlignment)textAlignment{
    [self setFrame:frame text:text textColor:textColor textFont:textFont textAlignment:0 numOfLines:1];
}

- (void)setFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textFont:(UIFont *)textFont textAlignment:(NSTextAlignment)textAlignment numOfLines:(NSInteger)numOfLines{
    self.frame = frame;
    self.numberOfLines = numOfLines;
    if (text.length != 0) {
        self.text = text;
    }
    if (textColor != nil) {
        self.textColor = textColor;
    }
    if (textFont != nil) {
        self.font = textFont;
    }
    if (textAlignment != 0) {
        self.textAlignment = textAlignment;
    }
}

@end
