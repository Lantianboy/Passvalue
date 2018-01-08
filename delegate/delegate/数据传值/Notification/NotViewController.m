//
//  NotViewController.m
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/4.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "NotViewController.h"
#import "SecViewController.h"
@interface NotViewController ()
{
    NSString * _str ;
}

@end

@implementation NotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor] ;
    
    /**
     addObserver: 注册监听者 一般都是控制器本身去监听一个通知
     selector   : 当监听到通知的时候执行的方法
     name       : 通知的名字 要和发送的通知名字对象一致
     object     : 对象 写nil 会接收所有类型传来的值
     */
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(text:) name:@"super" object:nil] ;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)text:(NSNotification *)notification{
    NSLog(@"%@",notification.object) ;
    _str = notification.object ;//接收object传来的值 具体数据类型根据需要设置
    NSLog(@"---%@",_str) ;
    
    NSDictionary * dic = notification.userInfo ;//接收userInfo字典传来的值 根据key取值
    NSString * sre = dic[@"吃什么"] ;
    NSLog(@"==%@==%@",dic,sre) ;
}

- (void)dealloc
{
    //移除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self] ;
    NSLog(@"销毁了") ;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SecViewController * vi = [[SecViewController alloc] init] ;
    [self.navigationController pushViewController:vi animated:YES] ;
}



@end
