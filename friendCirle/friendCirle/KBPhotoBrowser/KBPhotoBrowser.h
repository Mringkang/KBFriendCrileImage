//
//  KBPhotoBrowser.h
//  PhotoBrowser
//
//  Created by iMac on 2017/12/8.
//  Copyright © 2017年 kangbing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KBPhotoBrowser;

@protocol KBPhotoBrowserDelegate <NSObject>

- (NSString *)photoBrowser:(KBPhotoBrowser *)browser highImageURLForIndex:(NSInteger)index;

@end


@interface KBPhotoBrowser : UIView

@property (nonatomic, assign) NSInteger currentImageIndex;
@property (nonatomic, assign) NSInteger imageCount;

@property (nonatomic, weak) id<KBPhotoBrowserDelegate> delegate;

- (void)show;

@end
