//
//  SearchTableViewController.m
//  TableViewAndSearchViewDemo
//
//  Created by lx on 2017/11/28.
//  Copyright © 2017年 pingan. All rights reserved.
//

#import "SearchTableViewController.h"

@interface SearchTableViewController ()<UISearchResultsUpdating,UISearchControllerDelegate,UISearchBarDelegate>

@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchController.searchBar.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    
    
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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    }
    
    return cell;
}

#pragma mark --  UISearchControllerDelegate

- (void)willPresentSearchController:(UISearchController *)searchController{
    
}
- (void)didPresentSearchController:(UISearchController *)searchController{
    
}
- (void)willDismissSearchController:(UISearchController *)searchController{
    
}
- (void)didDismissSearchController:(UISearchController *)searchController{
    
}

- (void)presentSearchController:(UISearchController *)searchController{
    
}

#pragma mark -- UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    
}

#pragma mark -- UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    
}

#pragma mark -- lazy load

- (UISearchController *)searchController {
    if (!_searchController) {
        _searchController = [[UISearchController alloc]initWithSearchResultsController:self];
        [_searchController.searchBar setBackgroundImage:[UIImage new] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        
        UITextField *searchField;
        if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
            searchField = [self.searchController.searchBar.subviews objectAtIndex:1];
        }else{
            searchField = [((UIView *)[self.searchController.searchBar.subviews objectAtIndex:0]).subviews lastObject];
        }
        searchField.backgroundColor = [UIColor lightGrayColor];
        
        _searchController.searchBar.placeholder = @"输入姓名、车牌号";
        _searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
        _searchController.hidesNavigationBarDuringPresentation = NO;
        _searchController.searchBar.enablesReturnKeyAutomatically = YES;
        
        _searchController.searchResultsUpdater = self;
        _searchController.delegate = self;
        _searchController.dimsBackgroundDuringPresentation = NO;
        [_searchController.searchBar sizeToFit];
        [_searchController.searchBar setTintColor:[UIColor lightGrayColor]];
        _searchController.searchBar.backgroundColor = [UIColor whiteColor];
        [_searchController.searchBar setValue:@"取消" forKey: @"_cancelButtonText"];
    }
    return _searchController;
}


@end
