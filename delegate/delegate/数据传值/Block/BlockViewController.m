//
//  BlockViewController.m
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/4.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "BlockViewController.h"
#import "SecondViewController.h"
@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor] ;
    //调用类方法传值
    [SecondViewController dastr:^(NSString * str){
        NSLog(@"---%@",str) ;
    }] ;
   
    // Do any additional setup after loading the view.
}



@end
