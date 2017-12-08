//
//  KBImageView.m
//  PhotoBrowser
//
//  Created by iMac on 2017/12/8.
//  Copyright © 2017年 kangbing. All rights reserved.
//

#import "KBImageView.h"

@interface KBImageView()<UIGestureRecognizerDelegate>
/** 缩放比 */
@property (nonatomic, assign) CGFloat totalScale;

@property (nonatomic, strong) UIScrollView *zoomScroolView;

@property (nonatomic, strong) UIImageView *zoomImageView;


@property (nonatomic, strong) UIScrollView *longScrollView;

@property (nonatomic, strong) UIImageView *longImageView;

@end

@implementation KBImageView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFit;
        _totalScale = 1.0;
        
        // 捏合手势缩放图片
        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(zoomImage:)];
        pinch.delegate = self;
        [self addGestureRecognizer:pinch];
        
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize imageSize = self.image.size;
    
    
    NSLog(@"%@",NSStringFromCGSize(imageSize));
    // 如果是长图
    if (self.bounds.size.width * (imageSize.height / imageSize.width) > self.bounds.size.height) {
        if (!_longScrollView) {
            UIScrollView *longScrollView = [[UIScrollView alloc] init];
            longScrollView.backgroundColor = [UIColor blackColor];
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.image = self.image;
            _longImageView = imageView;
            [longScrollView addSubview:imageView];
            _longScrollView = longScrollView;
            [self addSubview:longScrollView];

        }
        _longScrollView.frame = self.bounds;
        // 图片根据当前屏幕的宽度, 等比计算图片的高度
        CGFloat imageViewH = self.bounds.size.width * (imageSize.height / imageSize.width);
        // 长图的宽, 高
        _longImageView.bounds = CGRectMake(0, 0, _longScrollView.frame.size.width, imageViewH);
        _longImageView.center = CGPointMake(_longScrollView.frame.size.width * 0.5, _longImageView.frame.size.height * 0.5);
        _longScrollView.contentSize = CGSizeMake(0, _longImageView.bounds.size.height);
        
    } else {
        if (_longScrollView) [_longScrollView removeFromSuperview];
    }
    
}

#pragma mark 如果已经放大了
- (BOOL)isScaled{
    
    return  1.0 != _totalScale;
}

#pragma mark 捏合
- (void)zoomImage:(UIPinchGestureRecognizer *)recognizer
{
    [self prepareForImageViewScaling];
    CGFloat scale = recognizer.scale;
    CGFloat temp = _totalScale + (scale - 1);
    [self setTotalScale:temp];
    recognizer.scale = 1.0;
}

- (void)setTotalScale:(CGFloat)totalScale
{
    if ((_totalScale < 0.5 && totalScale < _totalScale) || (_totalScale > 2.0 && totalScale > _totalScale)) return; // 最大缩放 2倍,最小0.5倍
    
    [self zoomWithScale:totalScale];
}

- (void)prepareForImageViewScaling
{
    if (!_zoomScroolView) {
        _zoomScroolView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _zoomScroolView.backgroundColor = [UIColor blackColor];
        _zoomScroolView.contentSize = self.bounds.size;
        
        UIImageView *zoomImageView = [[UIImageView alloc] initWithImage:self.image];
        CGSize imageSize = zoomImageView.image.size;
        CGFloat imageViewH = self.bounds.size.height;
        if (imageSize.width > 0) {
            imageViewH = self.bounds.size.width * (imageSize.height / imageSize.width);
        }
        zoomImageView.bounds = CGRectMake(0, 0, self.bounds.size.width, imageViewH);
        zoomImageView.center = _zoomScroolView.center;
        zoomImageView.contentMode = UIViewContentModeScaleAspectFit;
        _zoomImageView = zoomImageView;
        [_zoomScroolView addSubview:zoomImageView];
        [self addSubview:_zoomScroolView];
    }
}

#pragma mark  双击
- (void)doubleTapToZommWithScale:(CGFloat)scale
{
    [self prepareForImageViewScaling];
    [UIView animateWithDuration:0.5 animations:^{
        [self zoomWithScale:scale];
    } completion:^(BOOL finished) {
        if (scale == 1) {
            [self clear];
        }
    }];
}

- (void)clearScale
{
    [self clear];
    _totalScale = 1.0;
}

- (void)clear{
    
    [_zoomScroolView removeFromSuperview];
    _zoomScroolView = nil;
    _zoomImageView = nil;
    
}

#pragma mark  放大
- (void)zoomWithScale:(CGFloat)scale
{
    _totalScale = scale;
    
    _zoomImageView.transform = CGAffineTransformMakeScale(scale, scale);
    
    if (scale > 1) {
        CGFloat contentW = _zoomImageView.frame.size.width;
        CGFloat contentH = MAX(_zoomImageView.frame.size.height, self.frame.size.height);
        
        _zoomImageView.center = CGPointMake(contentW * 0.5, contentH * 0.5);
        _zoomScroolView.contentSize = CGSizeMake(contentW, contentH);
        
        
        CGPoint offset = _zoomScroolView.contentOffset;
        offset.x = (contentW - _zoomScroolView.frame.size.width) * 0.5;
        //        offset.y = (contentH - _zoomImageView.frame.size.height) * 0.5;
        _zoomScroolView.contentOffset = offset;
        
    } else {
        _zoomScroolView.contentSize = _zoomScroolView.frame.size;
        _zoomScroolView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _zoomImageView.center = _zoomScroolView.center;
    }
}


@end
