//
//  NSString+LXYString.m
//  LQCalendarView
//
//  Created by liang lee on 2019/8/26.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "NSString+LXYString.h"

@implementation NSString (LXYString)

+ (NSString *)getAppName{
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    return infoDict[@"CFBundleDisplayName"];
}

+ (NSString *)getAppVersion{
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    return infoDict[@"CFBundleShortVersionString"];
}

- (NSString *)changeNullToString{
    if (([NSString stringWithFormat:@"%@",self].length == 0) || ([[NSString stringWithFormat:@"%@",self] rangeOfString:@"null"].location != NSNotFound)) {
        return @"";
    }
    return self;
}

+ (BOOL)isNullCharacterString:(NSString *)text{
    if (![text isKindOfClass:[NSString class]]) {
        return YES;
    }
    if ((text.length == 0) || ([text rangeOfString:@"null"].location != NSNotFound)) {
        return YES;
    }
    if ([text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0) {//去除收尾的空格之后lengh为0
        return YES;
    }
    return NO;
}

+ (NSString *)changeArrayOrDictionaryToJsonStrWithObj:(id)obj{
    if ([obj isKindOfClass:[NSString class]]) {
        return (NSString *)obj;
    }
    if ([obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSDictionary class]]) {
        NSError *error;
        NSData *data = [NSJSONSerialization dataWithJSONObject:obj options:kNilOptions error:&error];
        NSString *jsonStr = @"";
        if (data) {
            jsonStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        }
        return jsonStr;
    }
    return @"";
}

+ (NSString *)changeToBase64WithImage:(UIImage *)image{
    NSData *imageData = UIImagePNGRepresentation(image);
    NSString *base64Str = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64Str;
}

+ (CGFloat)getHeightWithText:(NSString *)text withTextFont:(UIFont *)font withTextWidth:(CGFloat)width{
    CGRect bounds = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    return ceil(bounds.size.height);
}

- (NSString *)changeChineseCharactersToPinyinWithCapital:(BOOL)capital{
    NSMutableString *pinyin = [self mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin,NULL,kCFStringTransformMandarinLatin,NO);//带音标的拼音
    CFStringTransform((__bridge CFMutableStringRef)pinyin,NULL,kCFStringTransformStripCombiningMarks,NO);//去除音标C
    if (capital) {
        return [pinyin uppercaseString];
    }
    return pinyin;
}

- (NSString *)deleteHeadAndFootWhitespace{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)deleteAllWhitespace{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

+ (NSString *)getTimeStrWithDate:(NSDate *)date withFormatterStr:(NSString *)formatterStr{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:formatterStr];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

- (NSString *)changeTimestampToDateStrWithFormatterStr:(NSString *)formatterStr{
    double timestamp = self.longLongValue;
    if (self.length == 13) {
        timestamp = self.longLongValue/1000;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:formatterStr];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}
@end
