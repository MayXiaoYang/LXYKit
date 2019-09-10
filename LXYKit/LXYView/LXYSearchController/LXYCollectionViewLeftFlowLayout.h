//
//  LXYCollectionViewLeftFlowLayout.h
//  LXYKit
//
//  Created by liang lee on 2019/9/9.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LXYCollectionViewLeftFlowLayout : UICollectionViewFlowLayout

@end

/**
 *  Just a convenience protocol to keep things consistent.
 *  Someone could find it confusing for a delegate object to conform to UICollectionViewDelegateFlowLayout
 *  while using UICollectionViewLeftAlignedLayout.
 */
@protocol LXYCollectionViewLeftDelegateFlowLayout <UICollectionViewDelegateFlowLayout>

@end
