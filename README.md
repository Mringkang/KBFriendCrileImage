# KBFriendCrileImage
朋友圈九宫格图片demo


![示例 Gif](https://ws1.sinaimg.cn/large/9e1008a3ly1fe15j0ia5ag20ac0ijx6p.gif)


####导入头文件, 一句话实现9宫格, 4张图片显示2行2列, 3张以下显示一行,  
KBFriendCirleView *fView = [[KBFriendCirleView alloc]init];  

fView.imageUrls = self.imageUrls;  

[self.view addSubview:fView];
