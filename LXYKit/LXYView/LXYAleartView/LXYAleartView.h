//
//  LXYAleartView.h
//  LQCalendarView
//
//  Created by liang lee on 2019/8/26.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface LXYAleartView : UIView

/**
 初始化aleartView

 @param title aleart标题
 @param message aleart提示信息
 @param btnTitles 按钮文字
 @return aleartView对象
 */
-(instancetype)initWithTitle:(NSString *)title withMessage:(NSString *)message withBtnTitles:(NSArray *)btnTitles;//withComplete:(void (^)(NSInteger btnIndex))complete

@property (nonatomic, copy)void(^complete)(NSInteger btnIndex);

/** 展示aleartView */
-(void)lxy_aleartViewShow;

@end

NS_ASSUME_NONNULL_END
