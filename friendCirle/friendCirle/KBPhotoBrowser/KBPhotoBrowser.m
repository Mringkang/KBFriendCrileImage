//
//  KBPhotoBrowser.m
//  PhotoBrowser
//
//  Created by iMac on 2017/12/8.
//  Copyright © 2017年 kangbing. All rights reserved.
//

//  1 创建scrollView
//  2 在scrollView 上面放imageView

// browser中图片间的margin
#define BrowserImageMargin 10

#import "KBPhotoBrowser.h"
#import "KBImageView.h"

@interface KBPhotoBrowser()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation KBPhotoBrowser

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor darkGrayColor];
    }
    return self;
}

// 总量已拿到
- (void)didMoveToSuperview{
    
    [self setupScrollView];
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGRect rect = self.bounds;
    rect.size.width += BrowserImageMargin * 2;
    
    _scrollView.bounds = rect;
    _scrollView.center = self.center;
    
    CGFloat y = 0;
    CGFloat w = _scrollView.frame.size.width - BrowserImageMargin * 2;
    CGFloat h = _scrollView.frame.size.height;
    
    
    
    [_scrollView.subviews enumerateObjectsUsingBlock:^(KBImageView *obj, NSUInteger idx, BOOL *stop) {
        CGFloat x = BrowserImageMargin + idx * (BrowserImageMargin * 2 + w);
        obj.frame = CGRectMake(x, y, w, h);
    }];
    
    _scrollView.contentSize = CGSizeMake(_scrollView.subviews.count * _scrollView.frame.size.width, 0);
    _scrollView.contentOffset = CGPointMake(self.currentImageIndex * _scrollView.frame.size.width, 0);
    
    
   
}

- (void)show{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    [window addSubview:self];
}

- (void)setupScrollView{
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    [self addSubview:_scrollView];
    
    for (int i = 0; i < self.imageCount; i++) {
        KBImageView *imageView = [[KBImageView alloc] init];
        imageView.tag = i;
        
        // 单击图片
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoClick:)];
        
        // 双击放大图片
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDoubleTaped:)];
        doubleTap.numberOfTapsRequired = 2;
        
        [singleTap requireGestureRecognizerToFail:doubleTap];
        
        [imageView addGestureRecognizer:singleTap];
        [imageView addGestureRecognizer:doubleTap];
        [_scrollView addSubview:imageView];
    }
    
    [self setupImageOfImageViewForIndex:self.currentImageIndex];
}

// 加载图片
- (void)setupImageOfImageViewForIndex:(NSInteger)index{
    KBImageView *imageView = _scrollView.subviews[index];
    self.currentImageIndex = index;
    if ([self.delegate respondsToSelector:@selector(photoBrowser:andWithCurentImageView:highImageURLForIndex:)]) {
        [self.delegate photoBrowser:self andWithCurentImageView:imageView highImageURLForIndex:index];
    }
    
}

- (void)photoClick:(UITapGestureRecognizer *)recognizer
{
    _scrollView.hidden = YES;
//    _willDisappear = YES;
    
//    KBImageView *currentImageView = (KBImageView *)recognizer.view;
//    NSInteger currentIndex = currentImageView.tag;
    

    [UIView animateWithDuration:0.05 animations:^{
        self.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)imageViewDoubleTaped:(UITapGestureRecognizer *)recognizer{
    
    KBImageView *imageView = (KBImageView *)recognizer.view;
    CGFloat scale;
    // 已经放大了, 就缩小
    if (imageView.isScaled) {
        scale = 1.0;
    } else {
        scale = 2.0;
    }
    
    KBImageView *view = (KBImageView *)recognizer.view;
    [view doubleTapToZommWithScale:scale];
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int index = (scrollView.contentOffset.x + _scrollView.bounds.size.width * 0.5) / _scrollView.bounds.size.width;
    
    // 有过缩放的图片在拖动一定距离后清除缩放
    CGFloat margin = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = scrollView.contentOffset.x;
//    NSLog(@"下标%d ---- %f------当前移动距离%f",index,x,x - index * self.bounds.size.width);
    
    if ((x - index * self.bounds.size.width) > margin || (x - index * self.bounds.size.width) < - margin) {
        
        KBImageView *imageView = _scrollView.subviews[index];
        if (imageView.isScaled) {
            [UIView animateWithDuration:0.5 animations:^{
                imageView.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                // 已经放大了, 就清除缩放
                [imageView clearScale];
            }];
        }
        
    }
    
    [self setupImageOfImageViewForIndex:index];
}

- (void)dealloc{

    NSLog(@"---");
}


@end
