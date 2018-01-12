//
//  SecondViewController.h
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/4.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义block
//typedef void (^Cblock)(NSString * );

@interface SecondViewController : UIViewController

//添加类方法
//+ (void)dastr:(Cblock)str ;

@property (nonatomic, copy) void(^cblock)(NSString * syt) ;


@end
