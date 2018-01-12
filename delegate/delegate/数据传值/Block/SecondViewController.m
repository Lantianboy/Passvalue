//
//  SecondViewController.m
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/4.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor] ;
    // Do any additional setup after loading the view.
   
   
}

//给block赋值
//+ (void)dastr:(Cblock)str
//{
//    NSString * sta = @"123456" ;
//    str(sta) ;
//}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.cblock(@"1234") ;//调用  先走block块外代码 再走块内代码 
    [self.navigationController popViewControllerAnimated:YES] ;
}


@end
