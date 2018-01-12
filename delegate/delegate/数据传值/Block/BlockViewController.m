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
{
    SecondViewController * vi ;
}

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor] ;
    //调用类方法传值
//    [SecondViewController dastr:^(NSString * str){
//        //NSLog(@"---%@",str) ;
//    }] ;
   
    vi = [[SecondViewController alloc] init] ;
    UILabel * la = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 40)] ;
    la.textColor = [UIColor redColor] ;
    la.backgroundColor = [UIColor yellowColor] ;
    [self.view addSubview:la] ;
    //vi.Cblock(@"zaina") ;
    
    vi.cblock = ^(NSString *syt) {// 赋值
        NSLog(@"==%@",syt) ;
        la.text = syt ;
    } ;
    
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    //vi.Cblock(@"1234") ;
    //SecondViewController * vi = [[SecondViewController alloc] init] ;
    
    [self.navigationController pushViewController:vi animated:YES] ;
}


@end
