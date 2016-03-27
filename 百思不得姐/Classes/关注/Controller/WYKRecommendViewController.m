//
//  WYKRecommendViewController.m
//  百思不得姐
//
//  Created by 王玉琨 on 16/3/27.
//  Copyright © 2016年 王玉琨. All rights reserved.
//

#import "WYKRecommendViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>
#import "WYKRecommendCategoryCell.h"
#import <MJExtension.h>
#import "WYKRecommendCategory.h"
#import "WYKRecommendUserCell.h"
#import "WYKRecommendUser.h"

@interface WYKRecommendViewController () <UITableViewDelegate,UITableViewDataSource>


/** 左边的类别tableview **/
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
/** 右边的用户表格 **/
@property (weak, nonatomic) IBOutlet UITableView *userTableView;
/** 左边的类别 **/
@property (nonatomic,strong) NSArray *categories;
/** 右边的用户们 **/
@property (nonatomic,strong) NSArray *users;

/** AFHTTPSessionManager  **/
@property (nonatomic,strong) AFHTTPSessionManager *AFmanager;
@end

@implementation WYKRecommendViewController

static NSString * const WYKCategoryID = @"category";
static NSString * const WYKUserID = @"user";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    
    
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:@"category" forKey:@"a"];
    [parameters setObject:@"subscribe" forKey:@"c"];
    
    self.AFmanager = [AFHTTPSessionManager manager];
    self.AFmanager.requestSerializer.timeoutInterval = 5;
    [self.AFmanager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
        
        self.categories = [WYKRecommendCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.categoryTableView reloadData];
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:false scrollPosition:UITableViewScrollPositionTop];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];
    
}
- (void)setupTableView{
    self.navigationItem.title = @"推荐关注";
    self.view.backgroundColor = WYKGlobalColor;
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([WYKRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:WYKCategoryID];
    [self.userTableView registerNib:[UINib nibWithNibName:NSStringFromClass([WYKRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:WYKUserID];
    [self setAutomaticallyAdjustsScrollViewInsets:false];
    [self.categoryTableView setContentInset:UIEdgeInsetsMake(64, 0, 0, 0)];
    [self.userTableView setContentInset:self.categoryTableView.contentInset];
    [self.userTableView setRowHeight:80];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.categoryTableView) {
        return self.categories.count;
    }else if (tableView == self.userTableView){
        return self.users.count;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.categoryTableView) {//左边表格
        WYKRecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:WYKCategoryID];
        cell.category = self.categories[indexPath.row];
        return cell;
    }else{//右边表格
        WYKRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:WYKUserID];
        cell.user = self.users[indexPath.row];
        return cell;
    }
    
}

#pragma mark --------<UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WYKRecommendCategory *c = self.categories[indexPath.row];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"subscribe";
    parameters[@"category_id"] = @(c.id);
    
    
    [self.AFmanager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        WYKLog(@"%@",responseObject);
        
        self.users = [WYKRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.userTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}


















/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
