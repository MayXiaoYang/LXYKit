//
//  LXYSearchCollectionReusableView.m
//  LXYKit
//
//  Created by liang lee on 2019/9/10.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LXYSearchCollectionReusableView.h"

@implementation LXYSearchCollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configurationUI];
    }
    return self;
}

-(void)configurationUI{
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, [UIScreen mainScreen].bounds.size.width - 30, 20)];
    [self addSubview:title];
    self.headTitle = title;
    
    UIButton *btn_clear = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_clear.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 45, 2, 30, 30);
    btn_clear.backgroundColor = [UIColor orangeColor];
    [btn_clear addTarget:self action:@selector(clearClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_clear];
    self.clearBtn = btn_clear;
}
-(void)clearClick:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectedClearBtnOnView:withBtn:)]) {
        [_delegate didSelectedClearBtnOnView:self withBtn:sender];
    }
}
@end
