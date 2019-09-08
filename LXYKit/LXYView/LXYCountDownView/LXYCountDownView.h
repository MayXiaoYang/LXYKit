//
//  LXYCountDownView.h
//  LXYKit
//
//  Created by liang lee on 2019/9/7.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXYCountDownView : UIView

/** 倒计时的天数 */
@property (nonatomic, assign)NSInteger day;
/** 倒计时的小时数 */
@property (nonatomic, assign)NSInteger hour;
/** 倒计时的分钟数 */
@property (nonatomic, assign)NSInteger minute;
/** 倒计时的秒数 */
@property (nonatomic, assign)NSInteger second;

/** 是否随着时间的变化自适应view的宽度 */
@property (nonatomic, assign)BOOL autoAdaptiveWidth;

/** 倒计时结束回调 */
@property (nonatomic, copy)void(^complete)(void);

@property (nonatomic, copy)void(^timeChangeBlock)(NSInteger day);

/** 开启倒计时 */
-(void)setFire;
@end

NS_ASSUME_NONNULL_END
