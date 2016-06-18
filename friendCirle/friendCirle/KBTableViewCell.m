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


@interface KBTableViewCell ()

@property (nonatomic, strong) KBFriendCirleView *view;

@end

@implementation KBTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andWithUrl:(NSArray *)imageUrls{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        KBFriendCirleView *view = [[KBFriendCirleView alloc]init];
        self.view = view;
        [self addSubview:view];
        
        
        
        
    }


    return self;


}

- (void)setImageUrls:(NSArray *)imageUrls{

    _imageUrls = imageUrls;
    
    self.view.imageUrls = imageUrls;
    self.viewH = self.view.height;



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
