//
//  BHSearchBar.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/14.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHSearchBar.h"
#import "BHSearchTextField.h"

@interface BHSearchBar()<UITextFieldDelegate>
@property (nonatomic,strong) BHSearchTextField *textField;
@property (nonatomic,strong) UIView *leftV;
@property (nonatomic,strong) UIButton *cancelBtn;
@end

@implementation BHSearchBar

#pragma mark-  重写系统方法
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

#pragma mark-  设置UI
-(void)setupUI{
    [self addSubview:self.cancelBtn];
    [self addSubview:self.textField];
}


-(BHSearchTextField *)textField{
    if (!_textField) {
        _textField = [[BHSearchTextField alloc] initWithFrame:CGRectMake(0, self.height*0.5-15, CGRectGetMinX(self.cancelBtn.frame)-5, 30)];
        _textField.delegate = self;
        [_textField addTarget:self action:@selector(searchBarTextDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _textField;
}

-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = CGRectMake(self.width - 60, 0, 40, self.height);
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

#pragma mark-  事件监听
-(void)cancelAction{
    if ([self.delegate respondsToSelector:@selector(searchBarCancelButtonClicked:)]) {
        [self.textField resignFirstResponder];
        [self.delegate searchBarCancelButtonClicked:self];
    }
}

-(void)searchBarTextDidChange:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(searchBarTextDidChange:)]) {
        [self.delegate searchBarTextDidChange:textField];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(searchBarTextFieldShouldReturn:)]) {
        return [self.delegate searchBarTextFieldShouldReturn:textField];
    }
    return NO;
}

#pragma mark-  暴露方法
-(void)becomeFirstResponder{
    [self.textField becomeFirstResponder];
}
-(void)resignFirstResponder{
    [self.textField resignFirstResponder];
}


@end
