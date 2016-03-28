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
#import <MJRefresh.h>

#define WYKSelectedCategory self.categories[self.categoryTableView.indexPathForSelectedRow.row]
@interface WYKRecommendViewController () <UITableViewDelegate,UITableViewDataSource>


/** 左边的类别tableview **/
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
/** 右边的用户表格 **/
@property (weak, nonatomic) IBOutlet UITableView *userTableView;
/** 左边的类别 **/
@property (nonatomic,strong) NSArray *categories;
/** 请求参数 **/
@property (nonatomic,strong) NSMutableDictionary *parameters;
/** AFHTTPSessionManager  **/
@property (nonatomic,strong) AFHTTPSessionManager *AFmanager;
@end

@implementation WYKRecommendViewController

static NSString * const WYKCategoryID = @"category";
static NSString * const WYKUserID = @"user";

/** afn **/
- (AFHTTPSessionManager *)AFmanager{
    if (!_AFmanager) {
        _AFmanager = [AFHTTPSessionManager manager];
        _AFmanager.requestSerializer.timeoutInterval = 5;
    }
    return _AFmanager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    
    [self setupRefresh];
    
    [self loadCategory];
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

- (void)setupRefresh{
    self.userTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadNewUsers];
        
    }];
    self.userTableView.mj_header.automaticallyChangeAlpha = true;
    self.userTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMoreUsers];
        
    }];
}

- (void)loadCategory{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setObject:@"category" forKey:@"a"];
    [parameters setObject:@"subscribe" forKey:@"c"];
    
    [self.AFmanager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
        
        self.categories = [WYKRecommendCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.categoryTableView reloadData];
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:false scrollPosition:UITableViewScrollPositionTop];
        [self.userTableView.mj_header beginRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];
    
}
#pragma mark ---加载用户数据
- (void)loadNewUsers{
    WYKRecommendCategory *category = WYKSelectedCategory;
    
    category.currentPage = 1;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"subscribe";
    parameters[@"category_id"] = @([WYKSelectedCategory id]);
    parameters[@"page"] = @(category.currentPage);
    self.parameters = parameters;
    
    [self.AFmanager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *users = [NSArray array];
        users = [WYKRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [category.users removeAllObjects];
        [category.users addObjectsFromArray:users];
        category.total = [responseObject[@"total"] integerValue];
        if (self.parameters != parameters) return;
        
        [self.userTableView reloadData];
        [self.userTableView.mj_header endRefreshing];
        
        [self checkFooterState];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.parameters != parameters) return;
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        [self.userTableView.mj_header endRefreshing];
        
    }];
}

- (void)loadMoreUsers{
    WYKRecommendCategory *category = WYKSelectedCategory;
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"subscribe";
    parameters[@"category_id"] = @([WYKSelectedCategory id]);
    parameters[@"page"] = @(++category.currentPage);
    self.parameters = parameters;
    [self.AFmanager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *users = [NSArray array];
        users = [WYKRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [category.users addObjectsFromArray:users];
        if (self.parameters != parameters) return;
        
        [self.userTableView reloadData];
        
        [self checkFooterState];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.parameters != parameters) return;
        [self.userTableView.mj_footer endRefreshing];
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        
    }];
}

- (void)checkFooterState{
    WYKRecommendCategory *rc = WYKSelectedCategory;
    self.userTableView.mj_footer.hidden = (rc.users.count == 0);
    
    if (rc.users.count == rc.total) {
        [self.userTableView.mj_footer endRefreshingWithNoMoreData];
    }else{
        [self.userTableView.mj_footer endRefreshing];
    }
}
#pragma mark ----<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.categoryTableView)  return self.categories.count;
    
    [self checkFooterState];
    
    return [WYKSelectedCategory users].count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.categoryTableView) {//左边表格
        WYKRecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:WYKCategoryID];
        cell.category = self.categories[indexPath.row];
        return cell;
    }else{//右边表格
        WYKRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:WYKUserID];
        cell.user = [WYKSelectedCategory users][indexPath.row];
        return cell;
    }
}

#pragma mark --------<UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.userTableView.mj_footer endRefreshing];
    [self.userTableView.mj_header endRefreshing];
    
    if (tableView == self.categoryTableView) {
        WYKRecommendCategory *c = self.categories[indexPath.row];
        
        if (c.users.count) {
            [self.userTableView reloadData];
        }else{
            [self.userTableView reloadData];
            [self.userTableView.mj_header beginRefreshing];
        }
    }
}

- (void)dealloc{
    [self.AFmanager.operationQueue cancelAllOperations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
