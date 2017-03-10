//
//  BHTabBarController.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/6.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHTabBarController.h"
#import "BHNavigationViewController.h"

@interface BHTabBarController ()

@end

@implementation BHTabBarController

+(void)initialize{
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    [item setTitleTextAttributes:[[NSMutableDictionary alloc] initWithDictionary:@{NSForegroundColorAttributeName : BHFontColor_selected}] forState:UIControlStateSelected];
    [item setTitleTextAttributes:[[NSMutableDictionary alloc] initWithDictionary:@{NSForegroundColorAttributeName : BHFontColor_normal}] forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBar setBackgroundImage:[[UIImage imageNamed:@"pfb_tabbar_background"] stretchableImageWithLeftCapWidth:0.5 topCapHeight:5]];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"BHChildViewController.plist" ofType:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    for (NSInteger i=0; i< [dict[@"BHChildViewControllers"] count]; i++) {
        NSDictionary *childInfo = dict[@"BHChildViewControllers"][i];
        NSString *childName = childInfo[@"childViewController"];
        NSString *itemTitle = childInfo[@"itemTitle"];
        NSString *itemImage = childInfo[@"itemImage"];
        [self setupChildViewController:[[NSClassFromString(childName) alloc] init] itemTitle:itemTitle itemImageName:itemImage index:i];
    }
}


-(void)setupChildViewController:(UIViewController *)childViewController itemTitle:(NSString *)itemTitle itemImageName:(NSString *)imageName index:(NSInteger)index{
    BHNavigationViewController *navi = [[BHNavigationViewController alloc] initWithRootViewController:childViewController];
    navi.tabBarItem.title = itemTitle;
    navi.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navi.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childViewController.title = itemTitle;
    childViewController.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:navi];
}

@end
