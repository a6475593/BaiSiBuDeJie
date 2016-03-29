//
//  WYKRecommendTagsTableViewController.m
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/29.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import "WYKRecommendTagsTableViewController.h"
#import <SVProgressHUD.h>
#import <AFNetworking.h>
#import "WYKRecommendTag.h"
#import <MJExtension.h>
#import "WYKTagsCell.h"

@interface WYKRecommendTagsTableViewController ()

@property (nonatomic,strong) AFHTTPSessionManager *AFmanager;
@property (nonatomic,strong) NSArray *tags;


@end

@implementation WYKRecommendTagsTableViewController
static NSString *const WYKTagsID = @"tags";


-(AFHTTPSessionManager *)AFmanager{
    if (_AFmanager == nil) {
        _AFmanager = [AFHTTPSessionManager manager];
        _AFmanager.requestSerializer.timeoutInterval = 5;
    }
    return _AFmanager;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self loadTags];
}
- (void)setupTableView{
    
    self.navigationItem.title = @"推荐";
      [self.tableView setRowHeight:80];
    [self.tableView setBackgroundColor:WYKGlobalColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WYKTagsCell class]) bundle:nil] forCellReuseIdentifier:WYKTagsID];
    
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
}

- (void)loadTags{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:@"tag_recommend" forKey:@"a"];
    [parameters setObject:@"sub" forKey:@"c"];
    [parameters setObject:@"topic" forKey:@"c"];
    
    [self.AFmanager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        WYKLog(@"%@",responseObject);
        [SVProgressHUD dismiss];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
        self.tags = [WYKRecommendTag mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tags.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WYKTagsCell *cell = [tableView dequeueReusableCellWithIdentifier:WYKTagsID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.recommendTags = self.tags[indexPath.row];
    return cell;
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
