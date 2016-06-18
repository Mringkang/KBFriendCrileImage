//
//  KBTableViewCell.m
//  friendCirle
//
//  Created by kangbing on 16/6/18.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import "KBTableViewCell.h"
#import "KBFriendCirleView.h"
#import "UIView+Extension.h"

@implementation KBTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andWithUrl:(NSArray *)imageUrls{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        KBFriendCirleView *view = [[KBFriendCirleView alloc]init];
        
        view.imageUrls = imageUrls;
        
        [self addSubview:view];
        
        self.viewH = view.height;
        
        
        
    }


    return self;


}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
