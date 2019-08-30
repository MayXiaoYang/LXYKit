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
    }
    return _imgScrollView;
}

- (UIImageView *)lastImageView{
    if (!_lastImageView) {
        _lastImageView = [[UIImageView alloc]init];
        _lastImageView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lastImageView;
}

- (UIImageView *)currentImageView{
    if (!_currentImageView) {
        _currentImageView = [[UIImageView alloc]init];
        _currentImageView.backgroundColor = [UIColor lightGrayColor];
    }
    return _currentImageView;
}

- (UIImageView *)nextImageView{
    if (!_nextImageView) {
        _nextImageView = [[UIImageView alloc]init];
        _nextImageView.backgroundColor = [UIColor lightGrayColor];
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
//    self.pageControlLocationType = self.pageControlLocationType;
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
        self.pageControl.currentPage = _imagsCount - 1;
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
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.imageUrls[pageIndex]] placeholderImage:nil];//此处可设置占位图
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
    
}
//加载网络图片
- (void)setImageUrls:(NSMutableArray<NSString *> *)imageUrls{
    if (imageUrls.count == 0) return;
    _imageUrls = imageUrls.mutableCopy;
    self.imagsCount = imageUrls.count;
    self.imagesType = LXYScrBannerViewImagesNetWork;
    [self configurationUI];
}
- (void)setIsPageControlHidden:(BOOL)isPageControlHidden{
    _pageControl.hidden = isPageControlHidden;
}

- (void)setPageControlLocationType:(pageControlLocationType)pageControlLocationType{
    
    CGSize size = [self.pageControl sizeForNumberOfPages:_imagsCount];
    
    _pageControl.frame = CGRectMake(0, 0, size.width, size.height);

    switch (pageControlLocationType) {
        case LXYLocationBottomCenter:
            _pageControl.center = self.center;
            break;
        case LXYLocationBottomLeft:
            _pageControl.frame = CGRectMake(15, ScrHeight - size.height - 20, size.width, size.height);
            break;
        case LXYLocationBottomRight:
            _pageControl.frame = CGRectMake(ScrWidth - 15 - size.width, ScrHeight - size.height - 20, size.width, size.height);
            break;
        default:
            break;
    }
}
@end


