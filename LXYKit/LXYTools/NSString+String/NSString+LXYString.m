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
    CGRect bounds = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
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
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
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

- (NSString *)reserveAnyLengthByteBehindNumPointWithSacle:(NSInteger)sacle{
    if ([self rangeOfString:@"."].location != NSNotFound) {
        //包含小数点
        //需要参与运算的两个数
        NSDecimalNumber *num = [NSDecimalNumber decimalNumberWithString:self];
        //        NSDecimalNumber *w = [NSDecimalNumber decimalNumberWithString:@"10000"];
        //运算结果处理：小数精确到后2位，其余位无条件舍弃
        NSDecimalNumberHandler *handler = [NSDecimalNumberHandler
                                           decimalNumberHandlerWithRoundingMode:NSRoundDown//要使用的舍入模式
                                           scale:sacle             //结果保留几位小数
                                           raiseOnExactness:NO //发生精确错误时是否抛出异常，一般为NO
                                           raiseOnOverflow:NO  //发生溢出错误时是否抛出异常，一般为NO
                                           raiseOnUnderflow:NO //发生不足错误时是否抛出异常，一般为NO
                                           raiseOnDivideByZero:YES];//被0除时是否抛出异常，一般为YES
        //将两个数进行除法运算，并对结果加以处理(handler)
        return [NSString stringWithFormat:@"%@",[num decimalNumberByRoundingAccordingToBehavior:handler]];
    }
    return self;
}

+ (BOOL)judgeAStringContainOnlyLettersAndNumbersWith:(NSString *)checkStr{
    NSCharacterSet *disallowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm"] invertedSet];
    NSRange foundRange = [checkStr rangeOfCharacterFromSet:disallowedCharacters];
    if (foundRange.location != NSNotFound) {
        return NO;
    }
    return YES;
}

- (NSString *)convertRMBIntoDollarFormat{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    // 设置格式
    [numberFormatter setPositiveFormat:@"###,##0.00;"];
    NSString *formattedNumberString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:self.doubleValue]];
    return formattedNumberString;
}

+ (NSMutableAttributedString *)addLineInMiddleWithPriceString:(NSString *)priceStr{
    NSMutableAttributedString *newPrice = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",priceStr]];
    [newPrice addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, newPrice.length)];
    return newPrice;
}

- (NSString *)stringConvertToMobileFormat{
    NSMutableString *phoneNum = [[NSMutableString alloc]initWithString:self];
    [phoneNum insertString:@" " atIndex:3];
    [phoneNum insertString:@" " atIndex:8];
    return phoneNum;
}

+(NSString *)replacePhoneNumWithStarWithPhoneNum:(NSString *)phoneNum{
    //转化成NSMutableString
    NSMutableString *newString = [NSMutableString stringWithString:phoneNum];
    //获得要替换成*号的字符串的range
    NSRange range = NSMakeRange(3, 4);
    //将要替换的字符串替换在指定的range处
    [newString replaceCharactersInRange:range withString:@"****"];
    return newString;
}

+(NSString *)replaceBlankCardNumWithStarWith:(NSString *)blankCardNum{
    //转化成NSMutableString
    NSMutableString *newString = [NSMutableString stringWithString:blankCardNum];
    //获得要替换成*号的字符串的range
    NSRange range = NSMakeRange(4, 8);
    //将要替换的字符串替换在指定的range处
    [newString replaceCharactersInRange:range withString:@" **** **** "];
    return newString;
}

////中文格式（几万）可自行添加
+ (NSString *)stringChineseFormat:(double)value{
    if (value / 100000000 >= 1) {
        return [NSString stringWithFormat:@"%.0f",value/100000000];
    }else if (value / 10000 >= 1 && value / 100000000 < 1){
        return [NSString stringWithFormat:@"%.0f万",value / 10000];
    }else{
        return [NSString stringWithFormat:@"%.0f",value];
    }
}

- (BOOL)judgeUrlStrIsRangHttp{
    if ([self rangeOfString:@"http"].location != NSNotFound) {
        return YES;
    }
    return NO;
}

- (BOOL)stringIsContainsEmoji{
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
             
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    
    return returnValue;
}

+ (NSString *)cutOutFontBytesWithString:(NSString *)cutOutString withNum:(NSInteger)num{
    if (cutOutString.length>=num) {
        cutOutString = [cutOutString substringToIndex:num];
    }
    return cutOutString;
}
@end
