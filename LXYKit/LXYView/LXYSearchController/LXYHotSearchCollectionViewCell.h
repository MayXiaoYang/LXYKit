//
//  LXYHotSearchCollectionViewCell.h
//  LXYKit
//
//  Created by liang lee on 2019/9/9.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXYHotSearchModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol LXYHotSearchCollectionViewCellDelegate;
@interface LXYHotSearchCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)LXYHotSearchModel *model;

@property (nonatomic, strong)UILabel *hotSearchTitle;

@property (nonatomic, strong)UIButton *deleteBtn;

@property (nonatomic, weak)id<LXYHotSearchCollectionViewCellDelegate>delegate;

@end

@protocol LXYHotSearchCollectionViewCellDelegate <NSObject>

-(void)didLongPressTitleWithLabel:(UILabel *)label withCell:(LXYHotSearchCollectionViewCell *)cell;

-(void)didTapDeleteBtnWithCell:(LXYHotSearchCollectionViewCell *)cell withBtn:(UIButton *)sender;

@end


NS_ASSUME_NONNULL_END
