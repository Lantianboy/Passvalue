//
//  EnumTowViewController.m
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/5.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "EnumTowViewController.h"
#import "EnumViewController.h"
@interface EnumTowViewController ()

@end

@implementation EnumTowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor] ;
    
    self.view.userInteractionEnabled = YES ;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ckmy)] ;
    [self.view addGestureRecognizer:tap] ;
    
    
    
    if (self.type == type1) {
        self.view.backgroundColor = [UIColor redColor] ;
    }else if (self.type == type2) {
        if ([self.Mydelegate respondsToSelector:@selector(eat:)]) {
            [self.Mydelegate eat:@"吃的炸鸡"] ;
        }
        self.view.backgroundColor = [UIColor yellowColor] ;
    }else if (self.type == type3) {
        NSArray * are = @[@"123"] ;
        if (self.Myblock) {
            self.Myblock(are) ;
        }
        self.view.backgroundColor = [UIColor greenColor] ;
    }else {
        self.view.backgroundColor = [UIColor purpleColor] ;
        
        
        NSDictionary * dic = @{@"key":@"tongzhi"} ;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"super" object:@"tongzhi" userInfo:dic] ;

    }

}


- (void)ckmy
{
    [self.navigationController popViewControllerAnimated:YES] ;
}


@end
