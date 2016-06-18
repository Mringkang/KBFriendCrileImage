//
//  TableViewController.m
//  friendCirle
//
//  Created by kangbing on 16/6/18.
//  Copyright © 2016年 kangbing. All rights reserved.
//

#import "TableViewController.h"
#import "KBTableViewCell.h"

@interface TableViewController ()

@property (nonatomic, strong) NSArray *imageUrls;


@end

@implementation TableViewController
- (NSArray *)imageUrls{
    
    if (_imageUrls == nil) {
        _imageUrls = @[
                       @"http://f.hiphotos.baidu.com/image/pic/item/b90e7bec54e736d19a8c7e2e9e504fc2d562697d.jpg",
                       @"http://b.hiphotos.baidu.com/image/pic/item/21a4462309f79052e99eb51809f3d7ca7bcbd517.jpg",
                       @"http://f.hiphotos.baidu.com/image/pic/item/21a4462309f79052cde894370ef3d7ca7acbd5c0.jpg",
                       @"http://pic.818today.com/imgsy/image/2015/1223/6358646689684556034921399.jpg",
                       @"http://e.hiphotos.baidu.com/image/pic/item/55e736d12f2eb9387fe9d2f2d7628535e5dd6f2e.jpg",
                       @"http://g.hiphotos.baidu.com/image/pic/item/ae51f3deb48f8c54a27fa9c83e292df5e1fe7fac.jpg",
                       @"http://pic3.nipic.com/20090715/2106234_121535005_2.jpg",
            
                       ];
    }
    
    return _imageUrls;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
    
        cell = [[KBTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell" andWithUrl:self.imageUrls];
    }
    // 赋值
    cell.imageUrls = self.imageUrls;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 400;;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
