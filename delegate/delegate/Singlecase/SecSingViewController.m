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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
