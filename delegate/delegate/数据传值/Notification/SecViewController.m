//
//  SecViewController.m
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/5.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "SecViewController.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * str = @"1235" ;
    NSDictionary * dic = @{@"吃什么":@"吃炸鸡"} ;
    self.view.backgroundColor = [UIColor whiteColor] ;
    /*
    发送通知
    object   格式必须是OC对象或者OC数据格式 不能携带基础数据类型 可不传 不传写nil
    userInfo 以字典格式携带需要传的值
     */
    [[NSNotificationCenter defaultCenter] postNotificationName:@"super" object:str] ;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"super" object:nil userInfo:dic] ;
}

- (void)dealloc
{
    NSLog(@"释放了内存") ;
}


@end
