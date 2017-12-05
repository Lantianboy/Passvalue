//
//  ViewController.m
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/4.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "ViewController.h"
#import "DeteViewController.h"
#import "BlockViewController.h"
#import "NotViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tab ;
    NSArray * _ary  ;
}

@end
static NSString * str = @"index" ;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor whiteColor] ;
    
    _tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)] ;
    _tab.delegate = self ;
    _tab.dataSource = self ;
    _tab.tableFooterView = [[UIView alloc] init] ;
    [self.view addSubview:_tab] ;
   
    _ary = [NSArray arrayWithObjects:@"代理",@"通知",@"block",@"枚举", nil] ;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _ary.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str] ;
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str] ;
    cell.textLabel.text = _ary[indexPath.row] ;//取消点击cell留下的灰条
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone] ;
    return cell ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            DeteViewController * vi = [[DeteViewController alloc] init] ;
            [self.navigationController pushViewController:vi animated:YES] ;
        }
            break;
        case 1:{
            NotViewController * vi = [[NotViewController alloc] init] ;
            [self.navigationController pushViewController:vi animated:YES] ;
        }
            break ;
        case 2:{
            BlockViewController * vi = [[BlockViewController alloc] init] ;
            [self.navigationController pushViewController:vi animated:YES] ;
        }
            
        default:
            break;
    }
}



@end
