//
//  SecSingViewController.m
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/6.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "SecSingViewController.h"
#import "SingViewController.h"
#import "modell.h"
@interface SecSingViewController ()

@end

@implementation SecSingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor] ;
    modell * mde = [modell new] ;
    NSLog(@"%@",mde.str) ;
    
}


@end
