//
//  LXYScrBannerView.m
//  LXYKit
//
//  Created by liang lee on 2019/8/29.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#define ARCColor [UIColor colorWithRed:(arc4random()%256)/255.0f green:(arc4random()%256)/255.0f blue:(arc4random()%256)/255.0f alpha:1]
#define ScrWidth (int)ceil(self.bounds.size.width)
#define ScrHeight (int)ceil(self.bounds.size.height)


#import "LXYScrBannerView.h"
#import <UIImageView+WebCache.h>
typedef enum : NSUInteger {
    LXYScrBannerViewImagesLocation,  //本地图片
    LXYScrBannerViewImagesNetWork,   //网络图片
} LXYScrBannerViewImagesType;

@interface LXYScrBannerView ()<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *imgScrollView;

@property (nonatomic, strong)UIImageView *lastImageView;
@property (nonatomic, strong)UIImageView *currentImageView;
@property (nonatomic, strong)UIImageView *nextImageView;
@property (nonatomic, strong)UIPageControl *pageControl;

@property (nonatomic, assign)NSInteger lastPageIndex;
@property (nonatomic, assign)NSInteger currentPageIndex;
@property (nonatomic, assign)NSInteger nextPageIndex;

@property (nonatomic, assign)NSInteger imagsCount;//图片数组元素个数

@property (nonatomic, assign)LXYScrBannerViewImagesType imagesType;
@property (nonatomic, strong)NSTimer *timer;

@end

@implementation LXYScrBannerView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self initDefaultData];
    }
    return self;
}
- (void)initDefaultData{
    _currentPageColor = [UIColor whiteColor];
    _pageColor = [UIColor lightGrayColor];
    _pageControlLocationType = LXYLocationBottomCenter;
    _autoScr = YES;
    _autoScrduration = 2.0f;
}
#pragma mark ------- 懒加载
- (UIScrollView *)imgScrollView{
    if (!_imgScrollView) {
        _imgScrollView = [[UIScrollView alloc]init];
        _imgScrollView.pagingEnabled = YES;
        _imgScrollView.bounces = NO;
        _imgScrollView.delegate = self;
        _imgScrollView.clipsToBounds = YES;
        _imgScrollView.layer.masksToBounds = YES;
        _imgScrollView.showsHorizontalScrollIndicator = NO;
        _imgScrollView.showsVerticalScrollIndicator = NO;
        _imgScrollView.clipsToBounds = YES;
    }
    return _imgScrollView;
}

- (UIImageView *)lastImageView{
    if (!_lastImageView) {
        _lastImageView = [[UIImageView alloc]init];
        _lastImageView.backgroundColor = [UIColor lightGrayColor];
        _lastImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _lastImageView;
}

- (UIImageView *)currentImageView{
    if (!_currentImageView) {
        _currentImageView = [[UIImageView alloc]init];
        _currentImageView.backgroundColor = [UIColor lightGrayColor];
        _currentImageView.contentMode = UIViewContentModeScaleAspectFill;
        _currentImageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapImageView:)];
        [_currentImageView addGestureRecognizer:tap];
    }
    return _currentImageView;
}

- (UIImageView *)nextImageView{
    if (!_nextImageView) {
        _nextImageView = [[UIImageView alloc]init];
        _nextImageView.backgroundColor = [UIColor lightGrayColor];
        _nextImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _nextImageView;
}

- (UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.currentPageIndicatorTintColor = _currentPageColor;
        _pageControl.pageIndicatorTintColor =_pageColor;
        [self addSubview:_pageControl];
    }
    return _pageControl;
}
#pragma mark ------- configurationUI
- (void)configurationUI{
    
    [self addSubview:self.imgScrollView];
    
    if (_imagsCount == 1) {
        self.imgScrollView.scrollEnabled = NO;
    }
    
    [self.imgScrollView addSubview:self.lastImageView];
    [self.imgScrollView addSubview:self.currentImageView];
    [self.imgScrollView addSubview:self.nextImageView];    
    
    // 将上一张图片设置为数组中最后一张图片
    [self setImageWithImageView:_lastImageView withPageIndex:(_imagsCount-1)];
    // 将当前图片设置为数组中第一张图片
    [self setImageWithImageView:_currentImageView withPageIndex:0];
    // 将下一张图片设置为数组中第二张图片,如果数组只有一张图片，则上、中、下图片全部是数组中的第一张图片
    [self setImageWithImageView:_nextImageView withPageIndex:_imagsCount == 1 ? 0 : 1];
    
    self.imgScrollView.contentSize = CGSizeMake(ScrWidth*3, ScrHeight);
    self.imgScrollView.contentOffset = CGPointMake(ScrWidth, 0);
    
    self.nextPageIndex = 1;
    self.lastPageIndex = _imagsCount - 1;
    
    self.pageControl.numberOfPages = _imagsCount;
    self.pageControl.currentPage = 0;
    [self setPageControlLocationType:self.pageControlLocationType];
    
    [self setSubviewsFrame];
    
}
- (void)setSubviewsFrame{
    self.imgScrollView.frame = CGRectMake(0, 0, ScrWidth, ScrHeight);
    self.lastImageView.frame = CGRectMake(0, 0, ScrWidth, ScrHeight);
    self.currentImageView.frame = CGRectMake(ScrWidth, 0, ScrWidth, ScrHeight);
    self.nextImageView.frame = CGRectMake(ScrWidth*2, 0, ScrWidth, ScrHeight);
}

#pragma mark ------- scrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (ceil(scrollView.contentOffset.x) <= 0) {
        //滑到第一张继续右滑
        _nextImageView.image = _currentImageView.image;
        _currentImageView.image = _lastImageView.image;
        [scrollView setContentOffset:CGPointMake(ScrWidth, 0) animated:NO];
        _lastImageView.image = nil;
        if (_lastPageIndex <= 0) {
            _lastPageIndex = _imagsCount - 1;
            _nextPageIndex = _lastPageIndex - (_imagsCount - 2);
        }else{
            _lastPageIndex--;
            if (_nextPageIndex == 0) {
                _nextPageIndex = _imagsCount - 1;
            }else{
                _nextPageIndex--;
            }
        }
        [self setImageWithImageView:_lastImageView withPageIndex:_lastPageIndex];
    }else if (ceil(scrollView.contentOffset.x) >= 2 * ScrWidth){
        //滑到最后一张继续左滑
        _lastImageView.image = _currentImageView.image;
        _currentImageView.image = _nextImageView.image;
        [scrollView setContentOffset:CGPointMake(ScrWidth, 0) animated:NO];
        _nextImageView.image = nil;
        if (_nextPageIndex >= _imagsCount - 1) {
            _nextPageIndex = 0;
            _lastPageIndex = _nextPageIndex + (_imagsCount - 2);
        }else{
            _nextPageIndex++;
            if (_lastPageIndex == _imagsCount - 1) {
                _lastPageIndex = 0;
            }else{
                _lastPageIndex ++;
            }
        }
        [self setImageWithImageView:_nextImageView withPageIndex:_nextPageIndex];
    }
    
    if (_lastPageIndex + 1 == _imagsCount) {
        self.pageControl.currentPage = 0;
    }else{
        self.pageControl.currentPage = _lastPageIndex + 1;
    }
}

- (void)setImageWithImageView:(UIImageView *)imageView withPageIndex:(NSInteger)pageIndex{
    if (self.imagesType == LXYScrBannerViewImagesLocation) {
        //本地图片加载
        if (self.locationImages.count ==0)return;
        imageView.image = [UIImage imageNamed:self.locationImages[pageIndex]];
    }else{
        //网络加载
        if (_placeholderImage) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:self.imageUrls[pageIndex]] placeholderImage:[UIImage imageNamed:_placeholderImage]];
        }else{
            [imageView sd_setImageWithURL:[NSURL URLWithString:self.imageUrls[pageIndex]] placeholderImage:nil];
        }
        
    }
}

#pragma mark ------- setter
//加载本地图片
- (void)setLocationImages:(NSArray<NSString *> *)locationImages{
    if (locationImages.count == 0)return;
    _locationImages = locationImages.copy;
    self.imagsCount = locationImages.count;
    self.imagesType = LXYScrBannerViewImagesLocation;
    [self configurationUI];
    [self openTimer];
    
}
//加载网络图片
- (void)setImageUrls:(NSMutableArray<NSString *> *)imageUrls{
    if (imageUrls.count == 0) return;
    _imageUrls = imageUrls.mutableCopy;
    self.imagsCount = imageUrls.count;
    self.imagesType = LXYScrBannerViewImagesNetWork;
    [self configurationUI];
    [self openTimer];
}
- (void)setIsPageControlHidden:(BOOL)isPageControlHidden{
    _pageControl.hidden = isPageControlHidden;
}

- (void)setPageControlLocationType:(pageControlLocationType)pageControlLocationType{
    //拉到self的最前方，防止遮挡。
    [self bringSubviewToFront:_pageControl];
    //计算pageControl的size
    CGSize size = [self.pageControl sizeForNumberOfPages:_imagsCount];
    
    switch (pageControlLocationType) {
        case LXYLocationBottomCenter://控件底部中间
            _pageControl.frame = CGRectMake((ScrWidth - size.width)/2, ScrHeight - size.height, size.width, size.height);
            break;
        case LXYLocationBottomLeft://控件底部左侧
            _pageControl.frame = CGRectMake(15, ScrHeight - size.height, size.width, size.height);
            break;
        case LXYLocationBottomRight://控件底部右侧
            _pageControl.frame = CGRectMake(ScrWidth - 15 - size.width, ScrHeight - size.height, size.width, size.height);
            break;
        default:
            break;
    }
}
#pragma mark ------- 自动轮播方法
-(void)setAutoScrduration:(NSInteger)autoScrduration{
    _autoScrduration = autoScrduration;
    if (_autoScrduration < 1.0f) {
        _autoScrduration = 2.0f;
    }
    if (_autoScr) {
        [self openTimer];
    }
}

- (void)setAutoScr:(BOOL)autoScr{
    _autoScr = autoScr;
    if (autoScr) {
        [self openTimer];
    }else{
        [self closeTimer];
    }
}

// 开启定时器
- (void)openTimer {
    // 开启之前一定要先将上一次开启的定时器关闭,否则会跟新的定时器重叠
    [self closeTimer];
    if (_autoScr) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:self.autoScrduration target:self selector:@selector(timerAction) userInfo:self repeats:YES];
        // 当外界滑动其他scrollView时，主线程的RunLoop会切换到UITrackingRunLoopMode这个Mode，执行的也是UITrackingRunLoopMode下的任务（Mode中的item），而timer是添加在NSDefaultRunLoopMode下的，所以timer任务并不会执行，只有当UITrackingRunLoopMode的任务执行完毕，runloop切换到NSDefaultRunLoopMode后，才会继续执行timer事件.
        // 因此，要保证timer事件不中断，就必须把_timer加入到NSRunLoopCommonModes模式下的 RunLoop中。也可以加入到UITrackingRunLoopMode
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

// 关闭定时器
- (void)closeTimer {
    [_timer invalidate];
    _timer = nil;
}

// timer事件
- (void)timerAction{
    // 定时器每次触发都让当前图片为轮播图的第三张ImageView的image
    [_imgScrollView setContentOffset:CGPointMake(ScrWidth*2, 0) animated:YES];
}

// 用户将要拖拽时将定时器关闭
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    // 关闭定时器
    [self closeTimer];
}

// 用户结束拖拽时将定时器开启(在打开自动轮播的前提下)
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (self.autoScr) {
        [self openTimer];
    }
}

#pragma mark ------- 设置图片显示mode
- (void)setImageModeType:(imageViewContentModeType)imageModeType{
    _imageModeType = imageModeType;
    switch (imageModeType) {
        case LXYImageViewContentModeScaleToFill:
            _lastImageView.contentMode = _currentImageView.contentMode = _nextImageView.contentMode = UIViewContentModeScaleToFill;
            break;
        case LXYImageViewContentModeScaleAspectFit:
            _lastImageView.contentMode = _currentImageView.contentMode = _nextImageView.contentMode = UIViewContentModeScaleAspectFit;
            break;
        case LXYImageViewContentModeScaleAspectFill:
            _lastImageView.contentMode = _currentImageView.contentMode = _nextImageView.contentMode = UIViewContentModeScaleAspectFill;
            break;
        default:
            break;
    }
    
}

- (void)setScrCornerRadius:(CGFloat)ScrCornerRadius{
    _imgScrollView.layer.masksToBounds = YES;
    _imgScrollView.layer.cornerRadius = ScrCornerRadius;
}

-(void)didTapImageView:(UITapGestureRecognizer *)tap{
    if (self.didTapImageBlock) {
        self.didTapImageBlock(self.pageControl.currentPage);
        return;
    }
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectedImageView:withPageIndex:)]) {
        [_delegate didSelectedImageView:(UIImageView*)tap.view withPageIndex:self.pageControl.currentPage];
    }
}
@end



