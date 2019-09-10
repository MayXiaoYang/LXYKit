//
//  LXYHotSearchModel.m
//  LXYKit
//
//  Created by liang lee on 2019/9/9.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LXYHotSearchModel.h"

@implementation LXYHotSearchModel

//归档
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.hotSearchTitle forKey:@"hotSearchTitle"];
    [aCoder encodeBool:self.isEditing forKey:@"isEditing"];
    [aCoder encodeInteger:self.hotSearchTitleWidth forKey:@"hotSearchTitleWidth"];
}
//解档
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.hotSearchTitle = [aDecoder decodeObjectForKey:@"hotSearchTitle"];
        self.isEditing = [aDecoder decodeBoolForKey:@"isEditing"];
        self.hotSearchTitleWidth = [aDecoder decodeIntegerForKey:@"hotSearchTitleWidth"];
    }
    return self;
}

-(void)calHotSearchTitleWidth{
    CGFloat height = [NSString getWidthWithText:self.hotSearchTitle withTextFont:[UIFont systemFontOfSize:15.0f] withTextHeight:15];
    self.hotSearchTitleWidth = ceil(height);
}

@end
