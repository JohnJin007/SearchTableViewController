//
//  ViewController.m
//  TableViewAndSearchViewDemo
//
//  Created by lx on 2017/11/28.
//  Copyright © 2017年 pingan. All rights reserved.
//

#import "ViewController.h"
#import "SearchTableViewController.h"
#import "UIImage+Color.m"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) SearchTableViewController *searchTableViewController;

@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.myTableView];
    
    _searchTableViewController = [[SearchTableViewController alloc]initWithStyle:UITableViewStylePlain];
    
    if (@available(iOS 11, *)) {
        self.navigationItem.title = @"客户管理";
        self.navigationItem.searchController = _searchTableViewController.searchController;
    }else{
        self.edgesForExtendedLayout = UIRectEdgeNone;
        [self setStatusBarBackgroundColor:[UIColor whiteColor]];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
        [self.navigationController.navigationBar setBackgroundColor:[UIColor whiteColor]];
       
        self.navigationItem.titleView =  _searchTableViewController.searchController.searchBar;
    }
}

//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 71;
    }
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        redView.backgroundColor = [UIColor redColor];
        return redView;
    }
    return nil;
}


#pragma mark -- lazy load

-(UITableView *)myTableView
{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 183 + 71) style:UITableViewStylePlain];
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    }
    return _myTableView;
}

@end
