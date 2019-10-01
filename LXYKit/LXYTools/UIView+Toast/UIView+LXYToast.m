//
//  UIView+LXYToast.m
//  LQCalendarView
//
//  Created by liang lee on 2019/8/21.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#define kHudDuration 2

#import "UIView+LXYToast.h"


@implementation UIView (LXYToast)

- (void )lxy_hideToat{
    [MBProgressHUD hideHUDForView:[[[UIApplication sharedApplication] delegate] window] animated:NO];
    [MBProgressHUD hideHUDForView:self animated:NO];
}

- (MBProgressHUD *)showHudMode:(MBProgressHUDMode)mode{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (hud == nil) {
        [self lxy_hideToat];
        hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    }
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.color = [UIColor blackColor];
    hud.label.numberOfLines = 0;
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = mode;
    hud.userInteractionEnabled = YES;
    return hud;
}
- (MBProgressHUD *)showBottomHudMode:(MBProgressHUDMode)mode{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (hud == nil) {
        [self lxy_hideToat];
        hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    }
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.color = [UIColor blackColor];
    hud.label.numberOfLines = 0;
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = mode;
    hud.offset = CGPointMake(0, MBProgressMaxOffset);
    hud.userInteractionEnabled = YES;
    return hud;
}
- (void)lxy_showToast{
    [self lxy_showTextToastWithString:nil];
}
- (void)lxy_showTextToastWithString:(NSString *)text{
    MBProgressHUD *lastHud = [MBProgressHUD HUDForView:self];
    if (lastHud && ([text isEqualToString:lastHud.label.text] || (text.length == 0 && lastHud.label.text.length == 0))) {
        return;
    }
    MBProgressHUD *hud = [self showHudMode:MBProgressHUDModeIndeterminate];
    hud.label.text = text;
}

- (void)lxy_showToastWithString:(NSString *)text{
    [self lxy_showTextToastWithString:text completion:nil];
}

- (void)lxy_showTextToastWithString:(NSString *)text completion:(void (^)(void))block{
    MBProgressHUD *hud = [self showHudMode:MBProgressHUDModeText];
    hud.label.text = text;
    CGFloat duration = text.length > 10 ? kHudDuration * 2 : kHudDuration;
    [hud hideAnimated:YES afterDelay:duration];
    [self performSelector:@selector(lxy_hideHUD:) withObject:block afterDelay:duration];
}
- (void)lxy_showBottomTextToastWithString:(NSString *)text{
    [self lxy_showBottomTextToastWithString:text completion:nil];
}
- (void)lxy_showBottomTextToastWithString:(NSString *)text completion:(void (^)(void))block{
    MBProgressHUD *hud = [self showBottomHudMode:MBProgressHUDModeText];
    hud.label.text = text;
    CGFloat duration = text.length > 10 ? kHudDuration * 2 : kHudDuration;
    hud.offset = CGPointMake(0, SCREEN_HEIGHT/2 - navgationBarH/2 - tabbarH/2);
    [hud hideAnimated:YES afterDelay:duration];
    [self performSelector:@selector(lxy_hideHUD:) withObject:block afterDelay:duration];
}

- (void)lxy_showErrorToast:(id)info completion:(void (^)(void))block{
    MBProgressHUD *hud = [self showHudMode:MBProgressHUDModeCustomView];
    UIImage *image = [UIImage imageNamed:@"hudError"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    hud.customView = imageView;
    
    NSString *text = @"";
    if ([info isKindOfClass:[NSError class]]) {
        NSError *error = (NSError *)info;
        text = error.userInfo[NSLocalizedDescriptionKey];
    }else if ([info isKindOfClass:[NSString class]]){
        text = info;
    }
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:kHudDuration];
    [self performSelector:@selector(lxy_hideHUD:) withObject:block afterDelay:kHudDuration];
}

- (void)lxy_showErrorToast:(id)info{
    [self lxy_showErrorToast:info completion:nil];
}


-(void)lxy_hideHUD:(void (^)(void))block{
    if (block) block();
}
@end
