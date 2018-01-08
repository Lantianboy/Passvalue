//
//  PlistViewController.m
//  delegate
//
//  Created by 最爱是深蓝 on 2018/1/4.
//  Copyright © 2018年 ProductTest. All rights reserved.
//

#import "PlistViewController.h"

@interface PlistViewController ()

@end

@implementation PlistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor] ;
    
    //设置导航条字体大小和颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor blackColor]}] ;
    
    
    NSDictionary * dia = @{@"age":@"18",@"name":@"makel"} ;
    
    //代码创建plist文件 获取沙盒路径
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"007.plist"] ;
    
    //写入数据
    [dia writeToFile:path atomically:YES] ;
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 30, 50, 100, 30)] ;
    btn.backgroundColor = [UIColor purpleColor] ;
    [btn setTitle:@"读取plist" forState:0] ;
    [btn addTarget:self action:@selector(rload) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:btn] ;
    
}

- (void)rload
{
    NSString * path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"007.plist"] ;
    //什么类型写入什么类型读取
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:path] ;
    NSLog(@"%@",dic) ;
}

@end
