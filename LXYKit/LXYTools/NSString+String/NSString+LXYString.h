//
//  NSString+LXYString.h
//  LQCalendarView
//
//  Created by liang lee on 2019/8/26.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (LXYString)

/** 获取app名称 */
+ (NSString *)getAppName;

/** 获取app的版本号 */
+ (NSString *)getAppVersion;

/** 去除空值 */
- (NSString *)changeNullToString;

/** 判断是否为空 */
+ (BOOL)isNullCharacterString:(NSString *)text;

/** 字典数组转json字符串 */
+ (NSString *)changeArrayOrDictionaryToJsonStrWithObj:(id)Obj;

/** 图片转base64编码 */
+ (NSString *)changeToBase64WithImage:(UIImage *)image;


/**
 计算一串指定宽度和文字字号的文字的高度

 @param text 计算高度的文字
 @param font 文字字号
 @param width 文字控件的宽度
 @return 文字占得高度
 */
+ (CGFloat)getHeightWithText:(NSString *)text withTextFont:(UIFont *)font withTextWidth:(CGFloat)width;


/**
 汉字转拼音

 @param capital 是否大写
 @return 拼音字符串
 */
- (NSString *)changeChineseCharactersToPinyinWithCapital:(BOOL)capital;

/** 去除首尾的空格 */
- (NSString *)deleteHeadAndFootWhitespace;

/** 去除字符串所有的空格 */
- (NSString *)deleteAllWhitespace;


/**
 日期转化为时间字符串

 @param date 日期
 @param formatterStr 时间格式化格式
 @return 时间字符串
 */
+ (NSString *)getTimeStrWithDate:(NSDate *)date withFormatterStr:(NSString *)formatterStr;

/**
 时间戳转化为时间字符串

 @param formatterStr 时间戳
 @return 时间字符串
 */
- (NSString *)changeTimestampToDateStrWithFormatterStr:(NSString *)formatterStr;

@end

NS_ASSUME_NONNULL_END
