//
//  ViewController.m
//  LXYKit
//
//  Created by liang lee on 2019/8/27.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "ViewController.h"
#import "LQCalenderView.h"
#import "LXYAleartView.h"
#import "LXYScrBannerView.h"
#import "SPCarouselView.h"

@interface ViewController ()
@property (nonatomic, assign)NSInteger num;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self configurationCalendarView];
    
//    [self configurationEasyBlockBtn];
    
    NSLog(@"dateStr---->>%@",[NSString getTimeStrWithDate:[NSDate date] withFormatterStr:@"yyyy-MM-dd HH:mm:ss"]);
    NSLog(@"------>>>%@",[@"1566901562833" changeTimestampToDateStrWithFormatterStr:@"yyyy-MM-dd HH:mm:ss"]);
    
    UILabel *label = [UILabel new];
    [label setFrame:CGRectMake(100, 300, SCREEN_WIDTH - 200, 60) text:@"天下无贼" textColor:[UIColor redColor] textFont:[UIFont systemFontOfSize:16]];
//    [self.view addSubview:label];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, label.bottomY + 20, SCREEN_WIDTH - 200, 60) title:@"哈哈哈哈" titleFont:[UIFont systemFontOfSize:16] titleColor:[UIColor orangeColor] contentHorAlignment:0 target:self action:@selector(hahaha)];
//    [self.view addSubview:btn];
    
    UITextField *textField = [UITextField new];
    [textField setFrame:CGRectMake(100, btn.bottomY + 20, SCREEN_WIDTH - 200, 60) textFont:FontThin(19) placeholderText:@"我是placeholder" placeholderTextColor:[UIColor blueColor] placeholderTextFont:FontThin(13) tintColor:[UIColor redColor] textEntry:NO];
//    [self.view addSubview:textField];
    
    LXYScrBannerView *bannerView = [[LXYScrBannerView alloc]initWithFrame:CGRectMake(40, navgationBarH + 100, SCREEN_WIDTH - 80, 160)];
//    bannerView.locationImages = @[[UIImage imageNamed:@"last.jpeg"],[UIImage imageNamed:@"current.jpeg"],[UIImage imageNamed:@"next.jpeg"],[UIImage imageNamed:@"last.jpeg"],[UIImage imageNamed:@"current.jpeg"],[UIImage imageNamed:@"next.jpeg"]];
    [self.view addSubview:bannerView];
    
//    SPCarouselView *banner = [[SPCarouselView alloc]initWithFrame:CGRectMake(40, navgationBarH + 100, SCREEN_WIDTH - 80, 160)];
//    banner.localImages = @[@"last.jpeg",@"current.jpeg",@"next.jpeg"];
//    [self.view addSubview:banner];
    
    
}
-(void)hahaha{
    NSLog(@"hahaha");
}
- (void)configurationEasyBlockBtn{
    UIButton *btn_1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_1.frame = CGRectMake(100, 300, SCREEN_WIDTH - 200, 60);
    [btn_1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn_1.backgroundColor = [UIColor orangeColor];
    [btn_1 setTitle:@"占位按钮" forState:UIControlStateNormal];
    [self.view addSubview:btn_1];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, btn_1.bottomY + 60, SCREEN_WIDTH - 200, 60);
    [btn addEVent:UIControlEventTouchUpInside ignoreDuration:1 handleBlock:^(id instance) {
        [self btnClick:nil];
    }];
    [btn setTitle:@"弹出LXYAleartView" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    
    NSLog(@"adasd---->>>\n%f----\n%f",btn_1.y,btn.y);
}
- (void)configurationCalendarView{
    LQCalenderView *calendarView = [[LQCalenderView alloc]initWithFrame:CGRectMake(10*WidthRatio, navgationBarH + 80*WidthRatio, SCREEN_WIDTH - 20*WidthRatio, 50*WidthRatio *8)];
    calendarView.currentMonthTitleColor =[UIColor colorWithHexString:@"2c2c2c"];//当前月字体颜色
    calendarView.lastMonthTitleColor =[UIColor colorWithHexString:@"8a8a8a"];//上个月字体颜色
    calendarView.nextMonthTitleColor =[UIColor colorWithHexString:@"8a8a8a"];//下个月字体颜色
    calendarView.isHaveAnimation = YES;//切换月份是否有动画
    calendarView.isCanScroll = YES;//是否可以手动滑动
    calendarView.isShowLastAndNextBtn = NO;//是否展示上下月按钮
    calendarView.isShowLastAndNextDate = YES;//是否展示上下月数据
    calendarView.todayTitleColor =[UIColor redColor];//当天字体颜色
    calendarView.selectBackColor =[UIColor greenColor];//选中的日期的底色
    [calendarView dealData];//配置数据
    [self.view addSubview:calendarView];
}

-(void)btnClick:(UIButton *)sender{
    //    self.num++;
    //    if (self.num == 1) {
    //        [self.view lxy_showToast];
    //        [self hideToast];
    //    }else if (self.num == 2){
    //        [self.view lxy_showToastWithString:[NSString stringWithFormat:@"第%ld次点击安徽的卡号的健康带回家卡回到家卡的很卡号SD卡滑动卡顿哈克斯加导航爱看的贺卡和打开的号角",self.num]];
    //        [self hideToast];
    //    }else if (self.num == 3){
    //        [self.view lxy_showTextToastWithString:[NSString stringWithFormat:@"第%ld次点击",self.num]];
    //        [self hideToast];
    //    }else if (self.num == 4){
    //        [self.view lxy_showTextToastWithString:[NSString stringWithFormat:@"第%ld次点击",self.num] completion:^{
    //            [self hideToast];
    //        }];
    //    }else if (self.num == 5){
    //        [self.view lxy_showBottomTextToastWithString:@"我是底部Toast我是底部Toast我是底部Toast我是底部Toast我是底部Toast我是底部Toast我是底部Toast"];
    //        [self hideToast];
    //    }else if (self.num == 6){
    //        self.num = 0;
    //    }
    LXYAleartView *aleartView = [[LXYAleartView alloc]initWithTitle:@"人生三桌饭" withMessage:@"满月一桌不会吃\n结婚一桌没空吃\n死了一桌吃不上" withBtnTitles:@[@"扯淡",@"安排"]];
    aleartView.complete = ^(NSInteger btnIndex) {
        NSLog(@"btnIndex----->>>%ld",btnIndex);
    };
    [aleartView lxy_aleartViewShow];
}

-(void)hideToast{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view lxy_hideToat];
    });
}

@end
