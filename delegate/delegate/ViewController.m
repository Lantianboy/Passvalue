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
#import "EnumViewController.h"
#import "SingViewController.h"
#import "ArchiveViewController.h"
#import "PlistViewController.h"
#import "ShowdataViewController.h"
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
   
    _ary = [NSArray arrayWithObjects:@"代理",@"通知",@"block",@"枚举",@"单例",@"归档",@"plist",@"数据持久化", nil] ;
    
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
    /*
     **刷新局部cell 自带动画
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil]withRowAnimation:UITableViewRowAnimationFade];
    
    */
    
    
    //刷新局部section自带动画
    NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:0];
    [tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationLeft] ;
    
    
    cell.textLabel.text = _ary[indexPath.row] ;
    //取消点击cell留下的灰条
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
            break ;
        case 3:{
            EnumViewController * vi = [[EnumViewController alloc] init] ;
            [self.navigationController pushViewController:vi animated:YES] ;
        }
            break ;
        case 4:{
            SingViewController * vi = [[SingViewController alloc] init] ;
            [self.navigationController pushViewController:vi animated:YES] ;
        }
            break ;
        case 5:{
            ArchiveViewController * vi = [[ArchiveViewController alloc] init] ;
            [self.navigationController pushViewController:vi animated:YES] ;
        }
            break ;
        case 6:{
            PlistViewController * plist = [[PlistViewController alloc] init ] ;
            [self.navigationController pushViewController:plist animated:YES] ;
        }
            break ;
        case 7:{
            ShowdataViewController * vi = [[ShowdataViewController alloc] init] ;
            [self.navigationController pushViewController:vi animated:YES] ;
        }
            break ;
        default:
            break;
    }
}



@end
