//
//  KBImageView.h
//  PhotoBrowser
//
//  Created by iMac on 2017/12/8.
//  Copyright © 2017年 kangbing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KBImageView : UIImageView

@property (nonatomic, assign, readonly) BOOL isScaled;

- (void)doubleTapToZommWithScale:(CGFloat)scale;

- (void)clearScale;

- (void)clear;

@end
