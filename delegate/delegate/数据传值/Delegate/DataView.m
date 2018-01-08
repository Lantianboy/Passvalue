//
//  DataView.m
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/4.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "DataView.h"

@implementation DataView

//初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUI] ;
    }
    return self ;
}


- (void)setUI
{
    self.backgroundColor = [UIColor redColor] ;
    
    UIButton * bt = [UIButton new] ;
    bt.frame = CGRectMake(75, 75, 50, 50) ;
    [bt addTarget:self action:@selector(fangfa) forControlEvents:UIControlEventTouchUpInside] ;
    bt.backgroundColor = [UIColor whiteColor] ;
    [self addSubview:bt] ;
    
    
    
}

- (void)fangfa
{
    NSLog(@"1111") ;
    //判断是否实现了代理方法
    if ([self.delegate respondsToSelector:@selector(eat:)]) {
        NSLog(@"实现了") ;
        [self.delegate eat:@"shshk"] ;
    }
}
   

@end
