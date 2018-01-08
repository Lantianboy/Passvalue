//
//  AddataViewController.m
//  delegate
//
//  Created by 最爱是深蓝 on 2018/1/4.
//  Copyright © 2018年 ProductTest. All rights reserved.
//

#import "AddataViewController.h"
#import "AddataTableViewCell.h"
@interface AddataViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray * _placeMut ;
    
    AddataTableViewCell * cell ;
    UITableView * tab ;
}
@property (nonatomic, strong) UIView * HearView ;
@end

@implementation AddataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加数据" ;
    self.view.backgroundColor = [UIColor whiteColor] ;
    
    //_Array = [NSMutableArray arrayWithCapacity:0] ;
   _placeMut = [[NSMutableArray alloc] initWithObjects:@"请选择性别",@"请输入姓名",@"请输入年龄",@"请输入学号",@"请输入时间", nil] ;
    
    UIButton * btn = [UIButton new] ;
    [btn setTitle:@"保存 " forState:0] ;
    [btn setTitleColor:[UIColor blackColor] forState:0] ;
    [btn addTarget:self action:@selector(addData) forControlEvents:UIControlEventTouchUpInside] ;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn] ;
    
     tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height - 65)] ;
    tab.tableHeaderView = self.HearView ;
    tab.tableFooterView = [UIView new] ;
    tab.delegate = self ;
    tab.dataSource = self ;
    [self.view addSubview:tab] ;
}

- (UIView *)HearView
{
    if (!_HearView) {
        
    _HearView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    UILabel*la=[[UILabel alloc]initWithFrame:CGRectMake(120, 25, 120, 25)];
    la.text=@"身份证照片";
    la.font=[UIFont systemFontOfSize:20];
    la.textColor=[UIColor blackColor];
    [_HearView addSubview:la];
        
    }
    return _HearView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _placeMut.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * str = @"cell" ;
    cell = [tableView dequeueReusableCellWithIdentifier:str] ;
    cell = [[AddataTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str] ;
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone] ;
    cell.textf.placeholder = _placeMut[indexPath.row] ;
    if (indexPath.row == 0) {
        cell.btn.hidden = NO ;
        cell.btn1.hidden = NO ;
        cell.textf.enabled = NO ;
    }
    return cell ;
}



- (void)addData
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:_placeMut.count];
    NSArray *keys = @[@"gender", @"name", @"age", @"number", @"time"];
    for (NSUInteger i = 0; i < _placeMut.count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *baseCell = [tab cellForRowAtIndexPath:indexPath];
        if ([baseCell isKindOfClass:[AddataTableViewCell class]]) {
            AddataTableViewCell *cell = (AddataTableViewCell *)baseCell;
            [dict setObject:cell.textf.text forKey:keys[i]];
        }
    }
   
    NSMutableArray * mut = [[NSMutableArray alloc] initWithCapacity:0] ;
    mut = self.Array ;
    [mut addObject:dict] ;
    
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults] ;
    
    [user setValue:mut forKey:@"data"] ;
    [user synchronize] ;//保存
    [self.navigationController popViewControllerAnimated:YES] ;
    
    NSLog(@"--%@",mut) ;
}
@end
