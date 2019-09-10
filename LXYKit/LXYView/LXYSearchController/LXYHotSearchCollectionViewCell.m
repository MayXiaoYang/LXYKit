//
//  LXYHotSearchCollectionViewCell.m
//  LXYKit
//
//  Created by liang lee on 2019/9/9.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LXYHotSearchCollectionViewCell.h"

@implementation LXYHotSearchCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configurationUI];
    }
    return self;
}

-(void)configurationUI{
    
    self.clipsToBounds = YES;
    
    UILabel *hotSearchTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.frame.size.width, self.frame.size.height)];
    hotSearchTitle.text = @"";
    hotSearchTitle.font = [UIFont systemFontOfSize:15.0f];
    hotSearchTitle.textAlignment = NSTextAlignmentCenter;
    hotSearchTitle.userInteractionEnabled = YES;
    [self addSubview:hotSearchTitle];
    self.hotSearchTitle = hotSearchTitle;
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(editPress:)];
    [hotSearchTitle addGestureRecognizer:longPress];
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteBtn setTitle:@"X" forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:deleteBtn];
    self.deleteBtn = deleteBtn;
    
}
-(void)setModel:(LXYHotSearchModel *)model{
    _model = model;
    self.hotSearchTitle.text = model.hotSearchTitle;
    self.hotSearchTitle.width = model.hotSearchTitleWidth;
    self.deleteBtn.frame = CGRectMake(CGRectGetMaxX(self.hotSearchTitle.frame)+5, 5, 20, 20);
}

-(void)editPress:(UILongPressGestureRecognizer *)longPress{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        UILabel *label = (UILabel *)longPress.view;
        if (_delegate && [_delegate respondsToSelector:@selector(didLongPressTitleWithLabel:withCell:)]) {
            [_delegate didLongPressTitleWithLabel:label withCell:self];
        }
    }
}
-(void)deleteBtnClick:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(didTapDeleteBtnWithCell:withBtn:)]) {
        [_delegate didTapDeleteBtnWithCell:self withBtn:sender];
    }
}
@end
