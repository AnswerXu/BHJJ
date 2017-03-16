//
//  BHSearchViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/14.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHSearchViewController.h"
#import "BHSearchBar.h"
#import "BHDisplayKeywordTableView.h"

@interface BHSearchViewController ()<BHSearchBarDelegate>
@property (nonatomic,strong) BHSearchBar *searchBar;
@property (nonatomic,strong) BHDisplayKeywordTableView *tableView;
@end

@implementation BHSearchViewController

-(BHSearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = [[BHSearchBar alloc] initWithFrame:CGRectMake(0, 0, BHScreenWidth, 30)];
        _searchBar.delegate = self;
        [_searchBar becomeFirstResponder];
    }
    return _searchBar;
}

-(BHDisplayKeywordTableView *)tableView{
    if (!_tableView) {
        _tableView = [[BHDisplayKeywordTableView alloc] initWithFrame:CGRectMake(0, 0, BHScreenWidth, BHScreenHeiht - 64) style:UITableViewStylePlain];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationItem setHidesBackButton:YES];
    self.navigationItem.titleView = self.searchBar;
    [self.view addSubview:self.tableView];
}

#pragma mark-  BHSearchDelegate
-(void)searchBarCancelButtonClicked:(BHSearchBar *)searchBar{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
