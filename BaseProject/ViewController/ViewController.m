//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "KindViewModel.h"
#import "KindIntroViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)KindViewModel *kindVM;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (KindViewModel *)kindVM{
    if (!_kindVM) {
        _kindVM = [KindViewModel new];
    }
    return _kindVM;
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.kindVM.rowNumber;
}
kRemoveCellSeparator
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    UILabel *label = [cell.contentView viewWithTag:100];
    label.text = [self.kindVM titleForRow:indexPath.row];
    UIButton *btn = [cell.contentView viewWithTag:200];
    btn.hidden = ![self.kindVM hasDetailForRow:indexPath.row];
    btn.layer.cornerRadius = 10;
    [btn bk_addEventHandler:^(id sender) {
        KindIntroViewController *vc = [KindIntroViewController new];
        vc.introKind = [self.kindVM detailForRow:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
        vc.title = label.text;
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.tableFooterView = [UIView new];
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
