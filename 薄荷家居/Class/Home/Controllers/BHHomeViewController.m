//
//  BHHomeViewController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/6.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHHomeViewController.h"
#import "BHHomeMenuView.h"
#import "BHMenuItem.h"
#import "BHHomeContentView.h"
#import "BHSearchViewController.h"

@interface BHHomeViewController ()<MenuViewDelegate,HomeContentViewDelegate>
@property (nonatomic,strong) BHHomeMenuView *menuView;
@property (nonatomic,copy) NSArray<NSString *> *menuItemTitles;
@property (nonatomic,strong) BHHomeContentView *contentView;
@property (nonatomic,assign) BOOL isClickMenuItem;

@end

@implementation BHHomeViewController

#pragma mark-  懒加载
-(BHHomeMenuView *)menuView{
    if (!_menuView) {
        _menuView = [[BHHomeMenuView alloc] initWithFrame:CGRectMake(0, 0, BHScreenWidth, 36)];
        _menuView.delegate = self;
    }
    return _menuView;
}
-(BHHomeContentView *)contentView{
    if (!_contentView) {
        _contentView = [[BHHomeContentView alloc] initWithFrame:CGRectMake(0, self.menuView.maxY, BHScreenWidth, BHScreenHeiht - 64 - 49 - self.menuView.height)];
        _contentView.scrollDelegate = self;
    }
    return _contentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildViewControllers];
    [self.view addSubview:self.menuView];
    [self.view addSubview:self.contentView];
    self.contentView.childs = self.childViewControllers;
    _menuItemTitles = @[@"精选",@"卧室",@"书房",@"厨房",@"客厅",@"卫浴"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_navigationItem_search_highlighted"] style:UIBarButtonItemStyleDone target:self action:@selector(searchItemAction)];
    [self.contentView addObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset)) options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

-(void)setupChildViewControllers{
    NSArray *childDicts = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"BHHomeChildViewControllers.plist" ofType:nil]];
    for (NSDictionary *info in childDicts) {
        NSString *className = info[@"childViewController"];
        NSString *title = info[@"title"];
        UIViewController *childVC = [[NSClassFromString(className) alloc] init];
        childVC.title = title;
        [self addChildViewController:childVC];
    }
}

-(void)searchItemAction{
    [self.navigationController pushViewController:[[BHSearchViewController alloc] init] animated:YES];
}

#pragma mark-  MenuViewDelegate
-(NSInteger)numberOfColumnsInMenuView:(BHHomeMenuView *)menuView{
    return _menuItemTitles.count;
}
-(BHMenuItem *)menuView:(BHHomeMenuView *)menuView itemForColumnAtIndexPath:(NSIndexPath *)indexPath{
    BHMenuItem *item = [BHMenuItem buttonWithType:UIButtonTypeCustom];
    item.selected = indexPath.item == 0 ? YES : NO;
    [item setTag:indexPath.item];
    [item setTitle:_menuItemTitles[indexPath.item] forState:UIControlStateNormal];
    [item addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventTouchUpInside];
    return item;
}
-(void)selectItem:(BHMenuItem *)sender{
    _isClickMenuItem = YES;
    for (BHMenuItem *item in self.menuView.items) {
        item.selected = [item isEqual:sender] ? YES : NO;
    }
    [self.contentView scrollWithIndexPath:[NSIndexPath indexPathForItem:sender.tag inSection:0]];
}

#pragma mark-  监听方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    CGFloat oldOffsetX          = [change[NSKeyValueChangeOldKey] CGPointValue].x;
    CGFloat newOffsetX          = [change[NSKeyValueChangeNewKey] CGPointValue].x;
    CGFloat deltaX              = newOffsetX - oldOffsetX;
    NSInteger currentPage = deltaX >= 0 ? newOffsetX / BHScreenWidth : newOffsetX / BHScreenWidth + !_isClickMenuItem;
    [self selectMenuItemWithIndex:currentPage];
}
-(void)selectMenuItemWithIndex:(NSInteger)index{
    if(index >= 0 && index < self.menuView.items.count){
        for (BHMenuItem *item in self.menuView.items) {
            item.selected = [item isEqual:self.menuView.items[index]] ? YES : NO;
        }
        [self.menuView scrollLineAnimationWithIndex:index];
    }
}

#pragma mark-  HomeContentViewDelegate
-(void)homeContentViewWillBeginDragging:(BHHomeContentView *)scrollView{
    _isClickMenuItem = NO;
}

-(void)dealloc{
    [self.contentView removeObserver:self forKeyPath:NSStringFromSelector(@selector(contentOffset))];
}

@end
