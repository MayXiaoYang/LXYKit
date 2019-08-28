//
//  LXYAleartView.m
//  LQCalendarView
//
//  Created by liang lee on 2019/8/26.
//  Copyright © 2019 li xiao yang. All rights reserved.
//


#define MyRatio ([UIScreen mainScreen].bounds.size.width)/375.00
#define AleartColor(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#import "LXYAleartView.h"

@interface LXYAleartView ()

@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *message;
@property (nonatomic, copy)NSArray *btnTitles;
@property (nonatomic, strong)UIView *aleartView;

@end

@implementation LXYAleartView

-(instancetype)initWithTitle:(NSString *)title withMessage:(NSString *)message withBtnTitles:(NSArray *)btnTitles{
    if (self = [super init]) {
        _title = title;
        _message = message;
        _btnTitles = btnTitles;
        [self configurationUI];
    }
    return self;
}

-(void)configurationUI{
    
    CGRect bounds = [UIScreen mainScreen].bounds;
    CGSize size = bounds.size;
    
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.backgroundColor = AleartColor(20, 20, 20, 0.4);
    
    UIView *aleartView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width - 80*MyRatio, 0)];
    aleartView.backgroundColor = [UIColor whiteColor];
    aleartView.layer.masksToBounds = YES;
    aleartView.layer.cornerRadius = 10*MyRatio;
    [self addSubview:aleartView];
    self.aleartView = aleartView;
    
    UILabel *lbl_title = [[UILabel alloc]initWithFrame:CGRectMake(15*MyRatio, 15*MyRatio, aleartView.frame.size.width - 30*MyRatio, 20*MyRatio)];
    lbl_title.text = _title;
    lbl_title.font = [UIFont boldSystemFontOfSize:16];
    lbl_title.textAlignment = NSTextAlignmentCenter;
    lbl_title.textColor = AleartColor(64, 64, 64, 1);
    [aleartView addSubview:lbl_title];
    
    CGFloat height = [self getStringHeightWithText:_message font:[UIFont systemFontOfSize:15] viewWidth:aleartView.frame.size.width - 30*MyRatio];
    UILabel *lbl_message = [[UILabel alloc]initWithFrame:CGRectMake(15*MyRatio, CGRectGetMaxY(lbl_title.frame) + 15*MyRatio, aleartView.frame.size.width - 30*MyRatio, ceil(height))];
    lbl_message.text = _message;
    lbl_message.numberOfLines = 0;
    lbl_message.textAlignment = NSTextAlignmentCenter;
    lbl_message.font = [UIFont systemFontOfSize:15];
    lbl_message.textColor = AleartColor(64, 64, 64, 1);
    [aleartView addSubview:lbl_message];
    
    if (self.btnTitles.count == 1) {
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, aleartView.frame.size.height - 41*MyRatio, aleartView.width, 1*MyRatio)];
        line.backgroundColor = AleartColor(230, 230, 230, 1);
        line.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [aleartView addSubview:line];
        
        UIButton *btn_ok = [UIButton buttonWithType:UIButtonTypeCustom];
        btn_ok.frame = CGRectMake(0, aleartView.frame.size.height - 40*MyRatio, aleartView.frame.size.width, 40*MyRatio);
        btn_ok.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn_ok addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn_ok.tag = 9;
        [btn_ok setTitle:self.btnTitles.firstObject forState:UIControlStateNormal];
        [btn_ok setTitleColor:AleartColor(64, 64, 64, 1) forState:UIControlStateNormal];
        btn_ok.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [aleartView addSubview:btn_ok];
    }else{
        
        if (self.btnTitles.count == 0){
            self.btnTitles = @[@"取消",@"确认"];
        }
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, aleartView.frame.size.height - 41*MyRatio, aleartView.width, 1*MyRatio)];
        line.backgroundColor = AleartColor(230, 230, 230, 1);
        line.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [aleartView addSubview:line];
        
        UIButton *btn_cancle = [UIButton buttonWithType:UIButtonTypeCustom];
        btn_cancle.frame = CGRectMake(0, aleartView.frame.size.height - 40*MyRatio, aleartView.frame.size.width/2 - 0.5*MyRatio, 40*MyRatio);
        btn_cancle.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn_cancle addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn_cancle.tag = 8;
        [btn_cancle setTitle:self.btnTitles.firstObject forState:UIControlStateNormal];
        [btn_cancle setTitleColor:AleartColor(64, 64, 64, 1) forState:UIControlStateNormal];
        btn_cancle.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [aleartView addSubview:btn_cancle];
        
        UIView *line_su = [[UIView alloc]initWithFrame:CGRectMake(aleartView.frame.size.width/2 - 0.5*MyRatio, aleartView.frame.size.height - 40*MyRatio, 1*MyRatio, 40*MyRatio)];
        line_su.backgroundColor = AleartColor(230, 230, 230, 1);
        line_su.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [aleartView addSubview:line_su];
        
        UIButton *btn_ok = [UIButton buttonWithType:UIButtonTypeCustom];
        btn_ok.frame = CGRectMake(aleartView.frame.size.width/2, aleartView.frame.size.height - 40*MyRatio, aleartView.frame.size.width/2, 40*MyRatio);
        btn_ok.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn_ok addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn_ok.tag = 9;
        [btn_ok setTitle:self.btnTitles[1] forState:UIControlStateNormal];
        [btn_ok setTitleColor:AleartColor(64, 64, 64, 1) forState:UIControlStateNormal];
        btn_ok.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [aleartView addSubview:btn_ok];
        
    }
    
    aleartView.height = 109*MyRatio + ceil(height);
    aleartView.center = self.center;
    
}

-(void)lxy_aleartViewShow{
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    [self lxy_appearFormCenterSpringAnimationWithDuration:0.2];
    [window addSubview:self];
}

-(void)btnClick:(UIButton *)sender{
    if (self.complete) {
        [self lxy_disappearFormCenterSpringAnimationWithDuration:0.2];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self removeFromSuperview];
        });
        self.complete(sender.tag);
    }
}

- (CGFloat)getStringHeightWithText:(NSString *)text font:(UIFont *)font viewWidth:(CGFloat)width {
    // 设置文字属性 要和label的一致
    NSDictionary *attrs = @{NSFontAttributeName :font};
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    // 计算文字占据的宽高
    CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;
    
    // 当你是把获得的高度来布局控件的View的高度的时候.size转化为ceilf(size.height)。
    return  ceilf(size.height);
}

@end
