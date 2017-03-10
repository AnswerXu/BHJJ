//
//  BHSettingTableView.m
//  薄荷家居
//
//  Created by 澳蜗科技 on 2017/3/10.
//  Copyright © 2017年 AnswerXu. All rights reserved.
//

#import "BHSettingTableView.h"
#import "BHSettingModel.h"

@interface BHSettingTableView()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,copy) NSMutableArray<NSArray<BHSettingModel *> *> *datas;
@end

@interface BHSettingTableViewCell : UITableViewCell
@end
@implementation BHSettingTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier]) {
        self.textLabel.font = [UIFont systemFontOfSize:15];
        self.detailTextLabel.font = [UIFont systemFontOfSize:15];
        self.detailTextLabel.textColor = BHFontColor_normal;
    }
    return self;
}
@end
@implementation BHSettingTableView

-(NSMutableArray<NSArray<BHSettingModel *> *> *)datas{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame style:UITableViewStyleGrouped]) {
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[BHSettingTableViewCell class] forCellReuseIdentifier:@"cell"];
        for (NSInteger section = 0; section < 3; section++) {
            NSMutableArray<BHSettingModel *> *models = [NSMutableArray array];
            for (NSInteger row = 0; row < 3; row++) {
                if(section == 2 && row > 0) continue;
                BHSettingModel *model = [[BHSettingModel alloc] initSettingModelWithIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
                [models addObject:model];
            }
            [self.datas addObject:models];
        }
    }
    return self;
}

#pragma mark-  UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _datas.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas[section].count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BHSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    BHSettingModel *model = _datas[indexPath.section][indexPath.row];
    cell.imageView.image = model.icon;
    cell.textLabel.text = model.title;
    if(indexPath.section == 1){
        if(indexPath.row == 0) cell.detailTextLabel.text = @"男孩 职场新人";
        if(indexPath.row == 1) cell.accessoryView = [[UISwitch alloc] init];
    }
    if ((indexPath.section == 0 && indexPath.row == 2) || (indexPath.section == 1 && indexPath.row == 0) || indexPath.section == 2) {
        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_arrow"]];
    }
    return cell;
}

#pragma mark-  UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.000001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
