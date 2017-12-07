//
//  SingViewController.m
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/6.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "SingViewController.h"
#import "modell.h"
#import "SecSingViewController.h"
@interface SingViewController ()

@end

@implementation SingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor] ;
    
    modell * mde = [modell shareInstance] ;
    mde.str = @"1234" ;
    
    modell * sin = [modell new] ;
    
    modell * mdel = [[modell alloc] init] ;
    
    NSLog(@"==%p==%p==%p",mde,sin,mdel) ;
    NSLog(@"%@",[NSThread currentThread]) ;
    
    
    
    NSOperationQueue * oper = [[NSOperationQueue alloc] init] ;
    
    [oper addOperationWithBlock:^{
        modell * sin = [modell new] ;
        NSLog(@"--%p-%@",sin,[NSThread currentThread]) ;
    }] ;
    [oper addOperationWithBlock:^{
        modell * sin1 = [modell new] ;
           NSLog(@"--%p-%@",sin1,[NSThread currentThread]) ;
    }] ;
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SecSingViewController * vi = [[SecSingViewController alloc] init] ;
    [self.navigationController pushViewController:vi animated:YES] ;
}

- (void)dealloc
{
    NSLog(@"xiaohuile ") ;
}

@end
