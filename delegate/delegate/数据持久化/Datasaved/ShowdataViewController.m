//
//  ShowdataViewController.m
//  delegate
//
//  Created by 最爱是深蓝 on 2018/1/4.
//  Copyright © 2018年 ProductTest. All rights reserved.
//

#import "ShowdataViewController.h"
#import "ShowdataTableViewCell.h"
#import "AddataViewController.h"

@interface ShowdataViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tab ;
    NSMutableArray * _dataArray ;
}

@property (nonatomic,assign)UITableViewCellEditingStyle style ;

@end

@implementation ShowdataViewController

- (void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults] ;
    _dataArray = [[user valueForKey:@"data"] mutableCopy];
    NSLog(@"==%@",_dataArray) ;
    [_tab reloadData] ;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * btn = [UIButton new] ;
    [btn setTitle:@"添加数据" forState:0] ;
    [btn setTitleColor:[UIColor blackColor] forState:0] ;
    [btn addTarget:self action:@selector(selme) forControlEvents:UIControlEventTouchUpInside] ;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn] ;
    
    self.view.backgroundColor = [UIColor whiteColor] ;
    self.title = @"数据持久化" ;
    
    _dataArray = [NSMutableArray array] ;
    
    _tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height - 65)] ;
    _tab.tableFooterView = [UIView new] ;
    _tab.delegate = self ;
    _tab.dataSource = self ;
    _tab.separatorColor = [UIColor orangeColor] ;
    //_tab.bounces = NO ;
    [self.view addSubview:_tab] ;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_dataArray.count < 1) {
        return  NO ;
    }else{
        return _dataArray.count ;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * str = @"cellID" ;
    ShowdataTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str] ;
   
    cell = [[ShowdataTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str] ;
    [cell contentCellModel:_dataArray[indexPath.row]] ;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone] ;
    cell.accessoryView = [[UISwitch alloc] init] ;//cell 添加开关
    
    return cell ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160 ;
}

- (void)selme
{
    AddataViewController * vi = [[AddataViewController alloc] init] ;
    vi.Array = _dataArray ;
    [self.navigationController pushViewController:vi animated:YES] ;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES ;
}


//****左滑多个按钮******
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction * deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        //先删数据 再删UI
        [_dataArray removeObjectAtIndex:indexPath.row] ;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade] ;
        
    }] ;
    
    UITableViewRowAction * topAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"置顶" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        //更新数据
        [_dataArray exchangeObjectAtIndex:indexPath.row withObjectAtIndex:0] ;
        
        //更新UI
        NSIndexPath * firxtIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.section] ;
        [tableView moveRowAtIndexPath:indexPath toIndexPath:firxtIndexPath] ;
        
    }] ;
    
   
    topAction.backgroundColor = [UIColor blueColor] ;
    return @[deleteAction, topAction] ;
}

//*****一个按钮*****
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//
//        //删除数组数据
//        [_dataArray removeObjectAtIndex:indexPath.row] ;
//
//        //删除列表数据
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight] ;
//    }
//
//}
//
//
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return @"删除数据" ;
//}

//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return self.style ;
//}


@end
