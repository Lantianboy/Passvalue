//
//  DateViewController.h
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/4.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Mydelegate <NSObject>
-(void)eat:(NSString *)eat ;
@end


@interface DateViewController : UIViewController

@property (nonatomic,assign)id<Mydelegate>delegate ;


@end
