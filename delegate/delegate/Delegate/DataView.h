//
//  DataView.h
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/4.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import <UIKit/UIKit.h>

//设置协议
@protocol Mydelegate1 <NSObject>
-(void)eat:(NSString *)eat ;//设置代理方法
@end

@interface DataView : UIView
@property (nonatomic,assign)id<Mydelegate1>delegate ;//实例化协议对象



@end
