# KBFriendCrileImage
朋友圈九宫格图片demo


![示例gif](http://i1.buimg.com/eb8a814079e28d58.gif)


####导入头文件, 一句话实现9宫格, 4张图片显示2行2列, 3张以下显示一行,  
KBFriendCirleView *fView = [[KBFriendCirleView alloc]init];  

fView.imageUrls = self.imageUrls;  

[self.view addSubview:fView];
