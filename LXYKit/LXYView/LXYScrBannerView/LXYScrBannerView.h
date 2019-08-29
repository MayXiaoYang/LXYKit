//
//  LXYScrBannerView.h
//  LXYKit
//
//  Created by liang lee on 2019/8/29.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LXYScrBannerView : UIView

/** 本地图片数组 */
@property (nonatomic, copy)NSArray <NSString *>*locationImages;

/** 网络图片url数组 */
@property (nonatomic, strong)NSMutableArray <NSString *>*imageUrls;

@end


