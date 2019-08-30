//
//  LXYScrBannerView.h
//  LXYKit
//
//  Created by liang lee on 2019/8/29.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,pageControlLocationType){
    LXYLocationBottomCenter = 0,
    LXYLocationBottomLeft,
    LXYLocationBottomRight,
};

@interface LXYScrBannerView : UIView

/** 本地图片数组 */
@property (nonatomic, copy)NSArray <NSString *>*locationImages;

/** 网络图片url数组 */
@property (nonatomic, strong)NSMutableArray <NSString *>*imageUrls;

/** pageControl当前小圆点的颜色 */
@property (nonatomic, strong)UIColor *currentPageColor;

/** 其他小圆点的颜色 */
@property (nonatomic, strong)UIColor *pageColor;

/** 是否显示pageControl */
@property (nonatomic, assign)BOOL isPageControlHidden;

/** pageControl的位置 */
@property (nonatomic, assign)pageControlLocationType pageControlLocationType;





@end


