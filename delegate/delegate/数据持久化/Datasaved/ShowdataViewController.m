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
    [self.view addSubview:_tab] ;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_dataArray.count < 1) {
        return 1 ;
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

@end
