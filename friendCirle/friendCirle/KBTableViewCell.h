//
//  KBTableViewCell.h
//  friendCirle
//
//  Created by kangbing on 16/6/18.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KBTableViewCell : UITableViewCell


@property (nonatomic, strong) NSArray *imageUrls;


@property (nonatomic, assign) CGFloat viewH;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andWithUrl:(NSArray *)imageUrls;


@end
