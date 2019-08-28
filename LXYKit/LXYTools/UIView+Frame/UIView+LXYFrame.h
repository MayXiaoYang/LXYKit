//
//  UIView+LXYFrame.h
//  LQCalendarView
//
//  Created by liang lee on 2019/8/21.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LXYFrame)

@property (nonatomic, assign)CGFloat x;//x
@property (nonatomic, assign)CGFloat y;//y
@property (nonatomic, assign)CGFloat width;//宽度
@property (nonatomic, assign)CGFloat height;//高度
@property (nonatomic, assign)CGFloat centerX;//x轴中心点
@property (nonatomic, assign)CGFloat centerY;//y轴中心点
@property (nonatomic, assign)CGFloat rightX;//右侧的x
@property (nonatomic, assign)CGFloat bottomY;//底部的y


@end

NS_ASSUME_NONNULL_END
