//
//  modell.m
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/6.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import "modell.h"

@implementation modell

+ (instancetype)shareInstance
{
    static modell * instance = nil ;
    //只执行一次 onceToken次数
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        
            instance = [[super allocWithZone:NULL] init] ;
        
    }) ;
    return instance ;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [modell shareInstance] ;
}

//- (id) copyWithZone:(struct _NSZone *)zone
//{
//    return [modell shareInstance] ;
//}


@end
