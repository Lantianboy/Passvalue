//
//  EnumViewController.m
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/5.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "EnumViewController.h"
#import "EnumTowViewController.h"
@interface EnumViewController ()<Delegate>
{
    UIButton * _btn ;
}

@end

@implementation EnumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor] ;
    
    for (int i = 0; i < 4; i++) {
        _btn = [UIButton new] ;
        _btn.frame = CGRectMake(110+100*(i%2), 200+100*(i/2), 80, 80) ;
        [_btn setTitle:@"点我" forState:0] ;
        _btn.backgroundColor = [UIColor redColor] ;
        _btn.tag = i+1 ;
        [_btn addTarget:self action:@selector(butt:) forControlEvents:UIControlEventTouchUpInside] ;
        [self.view addSubview:_btn] ;
       
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(test:) name:@"super" object:nil] ;
    
    
}

- (void)test:(NSNotification *)notication{
    [_btn setTitle:notication.object forState:0] ;
    NSLog(@"--%@==%@",notication.userInfo[@"key"],notication.object) ;
    
}


- (void)butt:(UIButton *)btn
{
    EnumTowViewController * en = [[EnumTowViewController alloc] init] ;
    
    switch (btn.tag) {
        case 1:{
            en.type = type1 ;
            NSLog(@"1") ;
                    }
            break ;
        case 2:{
            en.type = type2 ;
             NSLog(@"2") ;
            en.Mydelegate = self ;
        }
            break ;
        case 3:{
            en.type = type3 ;
             NSLog(@"3") ;
            en.Myblock = ^(NSArray * ary){
                [btn setTitle:ary[0] forState:0] ;
                NSLog(@"%@",ary) ;
            } ;
        }
            break ;
        case 4:{
            en.type = type4 ;
             NSLog(@"4") ;
        }
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:en animated:YES] ;
}

- (void)eat:(NSString *)eat
{
    UIButton * bt = (UIButton *)[self.view viewWithTag:2] ;
    [bt setTitle:eat forState:0] ;
    NSLog(@"%@",eat) ;

    
}

@end
