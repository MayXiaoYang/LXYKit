//
//  LXYSearchCollectionReusableView.h
//  LXYKit
//
//  Created by liang lee on 2019/9/10.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LXYSearchCollectionReusableViewDelegate;
@interface LXYSearchCollectionReusableView : UICollectionReusableView

@property (nonatomic, strong)UILabel *headTitle;
@property (nonatomic, strong)UIButton *clearBtn;
@property (nonatomic, weak)id<LXYSearchCollectionReusableViewDelegate>delegate;

@end

@protocol LXYSearchCollectionReusableViewDelegate <NSObject>
-(void)didSelectedClearBtnOnView:(LXYSearchCollectionReusableView *)headView withBtn:(UIButton *)sender;
@end

