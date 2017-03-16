//
//  BHSearchBar.h
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/14.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BHSearchBar;
@protocol BHSearchBarDelegate <NSObject>

@required
- (void)searchBarCancelButtonClicked:(BHSearchBar *)searchBar;
@optional
- (void)searchBarTextDidChange:(UITextField *)textField;
- (BOOL)searchBarTextFieldShouldReturn:(UITextField *)textField;
@end

@interface BHSearchBar : UIView
@property (nonatomic,weak) id<BHSearchBarDelegate> delegate;
-(void)becomeFirstResponder;
-(void)resignFirstResponder;
@end
