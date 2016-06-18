//
//  ViewController.m
//  friendCirle
//
//  Created by kangbing on 16/6/17.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"
#import "KBFriendCirleView.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *imageUrls;

@end

@implementation ViewController


- (NSArray *)imageUrls{

    if (_imageUrls == nil) {
        _imageUrls = @[@"http://a.hiphotos.baidu.com/image/pic/item/7dd98d1001e9390191637f187eec54e736d196b7.jpg",
                       @"http://f.hiphotos.baidu.com/image/pic/item/b90e7bec54e736d19a8c7e2e9e504fc2d562697d.jpg",
                       @"http://b.hiphotos.baidu.com/image/pic/item/21a4462309f79052e99eb51809f3d7ca7bcbd517.jpg",
                       @"http://f.hiphotos.baidu.com/image/pic/item/21a4462309f79052cde894370ef3d7ca7acbd5c0.jpg",
                       @"http://pic.818today.com/imgsy/image/2015/1223/6358646689684556034921399.jpg",
                       @"http://e.hiphotos.baidu.com/image/pic/item/55e736d12f2eb9387fe9d2f2d7628535e5dd6f2e.jpg",
                       @"http://g.hiphotos.baidu.com/image/pic/item/ae51f3deb48f8c54a27fa9c83e292df5e1fe7fac.jpg",
                       @"http://pic3.nipic.com/20090715/2106234_121535005_2.jpg",
                       @"http://photocdn.sohu.com/20160414/Img444131072.jpg"
                       ];
    }

    return _imageUrls;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    KBFriendCirleView *fView = [[KBFriendCirleView alloc]init];
    fView.imageUrls = self.imageUrls;
    [self.view addSubview:fView];
    
    
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
