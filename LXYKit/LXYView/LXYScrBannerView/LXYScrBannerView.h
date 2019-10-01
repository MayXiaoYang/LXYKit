//
//  LXYScrBannerView.h
//  LXYKit
//
//  Created by liang lee on 2019/8/29.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,pageControlLocationType){
    LXYLocationBottomCenter = 0,  //控件底部中间
    LXYLocationBottomLeft,        //控件底部左侧
    LXYLocationBottomRight,       //控件底部右侧
};

typedef NS_ENUM(NSInteger,imageViewContentModeType){
    LXYImageViewContentModeScaleToFill = 0,    // 默认,充满父控件
    LXYImageViewContentModeScaleAspectFit,     // 按图片比例显示,少于父控件的部分会留有空白
    LXYImageViewContentModeScaleAspectFill,    // 按图片比例显示,超出父控件的部分会被剪掉
};
@protocol LXYScrBannerViewDelegate;
@interface LXYScrBannerView : UIView

/** 本地图片数组 */
@property (nonatomic, copy)NSArray <NSString *>*locationImages;

/** 网络图片url数组 */
@property (nonatomic, strong)NSMutableArray <NSString *>*imageUrls;

/** pageControl当前小圆点的颜色 默认白色*/
@property (nonatomic, strong)UIColor *currentPageColor;

/** 其他小圆点的颜色 默认轻灰色*/
@property (nonatomic, strong)UIColor *pageColor;

/** 是否显示pageControl 默认显示*/
@property (nonatomic, assign)BOOL isPageControlHidden;

/** pageControl的位置 默认底部中间*/
@property (nonatomic, assign)pageControlLocationType pageControlLocationType;

/** 设置placeholderImage 默认无占位图*/
@property (nonatomic, copy)NSString *placeholderImage;

/** 是否自动轮播 default is YES */
@property (nonatomic, assign)BOOL autoScr;

/** 轮播间隔时间 */
@property (nonatomic, assign)NSInteger autoScrduration;

@property (nonatomic, assign)imageViewContentModeType imageModeType;

/** 设置圆角 */
@property (nonatomic, assign)CGFloat ScrCornerRadius;

/** 设置点击图片的回调 默认block回调，如果block，代理都存在，默认 */
@property (nonatomic, copy)void(^didTapImageBlock)(NSInteger pageIndex);

/*
 图片自动滑动回调
 */
@property (nonatomic, copy) void(^didScrResult)(NSInteger pageIndex);

@property (nonatomic, weak)id <LXYScrBannerViewDelegate> delegate;


@end

@protocol LXYScrBannerViewDelegate <NSObject>

-(void)didSelectedImageView:(UIImageView *)imageView withPageIndex:(NSInteger)pageIndex;

@end


