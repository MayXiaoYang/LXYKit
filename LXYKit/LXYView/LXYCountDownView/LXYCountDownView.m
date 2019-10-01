//
//  LXYCountDownView.m
//  LXYKit
//
//  Created by liang lee on 2019/9/7.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LXYCountDownView.h"

@interface LXYCountDownView ()

@property (nonatomic, strong)UILabel *dayLabel;
@property (nonatomic, strong)UILabel *hourLabel;
@property (nonatomic, strong)UILabel *minuteLabel;
@property (nonatomic, strong)UILabel *secondLabel;
@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic, strong)UILabel *dayLabelkey;
@property (nonatomic, strong)UILabel *hourLabelKey;
@property (nonatomic, strong)UILabel *minuteLabelKey;
@property (nonatomic, strong)UILabel *secondLabelKey;

@end

@implementation LXYCountDownView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _autoAdaptiveWidth = YES;
        [self configurationUI];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(secondReduce) userInfo:nil repeats:YES];
        [_timer setFireDate:[NSDate distantFuture]];
    }
    return self;
}

-(void)configurationUI{
    
    UILabel *dayLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (self.frame.size.height - 20)/2, 20, 20)];
    dayLabel.backgroundColor = [UIColor blackColor];
    dayLabel.font = [UIFont systemFontOfSize:14];
    dayLabel.textColor = [UIColor whiteColor];
    dayLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:dayLabel];
    self.dayLabel = dayLabel;
    
    UILabel *day = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(dayLabel.frame), (self.frame.size.height - 20)/2, 20, 20)];
    day.font = [UIFont systemFontOfSize:14];
    day.textColor = [UIColor redColor];
    day.textAlignment = NSTextAlignmentCenter;
    day.text = @"天";
    [self addSubview:day];
    self.dayLabelkey = day;
    
    UILabel *hourLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(day.frame), (self.frame.size.height - 20)/2, 20, 20)];
    hourLabel.backgroundColor = [UIColor blackColor];
    hourLabel.font = [UIFont systemFontOfSize:14];
    hourLabel.textColor = [UIColor whiteColor];
    hourLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:hourLabel];
    self.hourLabel = hourLabel;
    
    UILabel *hour = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(hourLabel.frame), (self.frame.size.height - 20)/2, 20, 20)];
    hour.font = [UIFont systemFontOfSize:14];
    hour.textColor = [UIColor redColor];
    hour.textAlignment = NSTextAlignmentCenter;
    hour.text = @"时";
    [self addSubview:hour];
    self.hourLabelKey = hour;
    
    UILabel *minuteLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(hour.frame), (self.frame.size.height - 20)/2, 20, 20)];
    minuteLabel.backgroundColor = [UIColor blackColor];
    minuteLabel.font = [UIFont systemFontOfSize:14];
    minuteLabel.textColor = [UIColor whiteColor];
    minuteLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:minuteLabel];
    self.minuteLabel = minuteLabel;
    
    UILabel *minute = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(minuteLabel.frame), (self.frame.size.height - 20)/2, 20, 20)];
    minute.font = [UIFont systemFontOfSize:14];
    minute.textColor = [UIColor redColor];
    minute.textAlignment = NSTextAlignmentCenter;
    minute.text = @"分";
    [self addSubview:minute];
    self.minuteLabelKey = minute;
    
    UILabel *secondLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(minute.frame), (self.frame.size.height - 20)/2, 20, 20)];
    secondLabel.backgroundColor = [UIColor blackColor];
    secondLabel.font = [UIFont systemFontOfSize:14];
    secondLabel.textColor = [UIColor whiteColor];
    secondLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:secondLabel];
    self.secondLabel = secondLabel;
    
    UILabel *second = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(secondLabel.frame), (self.frame.size.height - 20)/2, 20, 20)];
    second.font = [UIFont systemFontOfSize:14];
    second.textColor = [UIColor redColor];
    second.textAlignment = NSTextAlignmentCenter;
    second.text = @"秒";
    [self addSubview:second];
    self.secondLabelKey = second;
    
}

-(void)secondReduce{
//    if (self.day == 0 && self.hour == 0 && self.minute == 0 && self.second == 0) {
//        self.day = 1;self.hour = 1;self.minute = 1;self.second = 9;
//    }
    if (self.second > 0) {
        self.second--;
    }else{
        self.second = 59;
        if (self.minute>0) {
            self.minute--;
        }else{
            self.minute = 59;
            if (self.hour>0) {
                self.hour--;
            }else{
                self.hour = 23;
                if (self.day > 0) {
                    self.day--;
                }else{
                    self.day = 0;
                }
            }
        }
    }
    
    self.dayLabel.text = (self.day<=9)?[NSString stringWithFormat:@"0%ld",self.day]:[NSString stringWithFormat:@"%ld",self.day];
    self.hourLabel.text = (self.hour<=9)?[NSString stringWithFormat:@"0%ld",self.hour]:[NSString stringWithFormat:@"%ld",self.hour];
    self.minuteLabel.text = (self.minute<=9)?[NSString stringWithFormat:@"0%ld",self.minute]:[NSString stringWithFormat:@"%ld",self.minute];
    self.secondLabel.text = (self.second<=9)?[NSString stringWithFormat:@"0%ld",self.second]:[NSString stringWithFormat:@"%ld",self.second];
    
    if (self.autoAdaptiveWidth) {
        [self autoCountDownViewWidth];
    }
    
    if (self.day == 0 && self.hour == 0 && self.minute == 0 && self.second == 0) {
        [_timer setFireDate:[NSDate distantFuture]];
        if (self.complete) {
            self.complete();
        }
    }
    
}

-(void)setFire{
    [_timer setFireDate:[NSDate distantFuture]];
    if (self.timeChangeBlock) {
        self.timeChangeBlock(self.day);
    }
    [_timer setFireDate:[NSDate distantPast]];
}

-(void)setAutoAdaptiveWidth:(BOOL)autoAdaptiveWidth{
    _autoAdaptiveWidth = autoAdaptiveWidth;
}
-(void)autoCountDownViewWidth{
    if (self.day == 0 && self.hour == 11 &&self.minute == 59 && self.second == 59) {
        self.dayLabel.hidden = YES;
        self.dayLabelkey.hidden = YES;
        self.hourLabel.x = 0;
        self.hourLabelKey.x = CGRectGetMaxX(self.hourLabel.frame);
        self.minuteLabel.x = CGRectGetMaxX(self.hourLabelKey.frame);
        self.minuteLabelKey.x = CGRectGetMaxX(self.minuteLabel.frame);
        self.secondLabel.x = CGRectGetMaxX(self.minuteLabelKey.frame);
        self.secondLabelKey.x = CGRectGetMaxX(self.secondLabel.frame);
        if (self.timeChangeBlock) {
            self.timeChangeBlock(self.day);
        }
    }else{
        if (self.day == 0) {
            return;
        }
        self.dayLabel.hidden = NO;
        self.dayLabelkey.hidden = NO;
        self.dayLabel.x = 0;
        self.dayLabelkey.x = CGRectGetMaxX(self.dayLabel.frame);
        self.hourLabel.x = CGRectGetMaxX(self.dayLabelkey.frame);
        self.hourLabelKey.x = CGRectGetMaxX(self.hourLabel.frame);
        self.minuteLabel.x = CGRectGetMaxX(self.hourLabelKey.frame);
        self.minuteLabelKey.x = CGRectGetMaxX(self.minuteLabel.frame);
        self.secondLabel.x = CGRectGetMaxX(self.minuteLabelKey.frame);
        self.secondLabelKey.x = CGRectGetMaxX(self.secondLabel.frame);
    }
}
@end

