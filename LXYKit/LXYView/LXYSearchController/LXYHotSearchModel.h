//
//  LXYHotSearchModel.h
//  LXYKit
//
//  Created by liang lee on 2019/9/9.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXYHotSearchModel : NSObject<NSCoding>

@property (nonatomic, copy)NSString *hotSearchTitle;

@property (nonatomic, assign)NSInteger hotSearchTitleWidth;

@property (nonatomic, assign)BOOL isEditing;

-(void)calHotSearchTitleWidth;

@end

NS_ASSUME_NONNULL_END
