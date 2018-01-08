//
//  EnumTowViewController.h
//  delegate
//
//  Created by 最爱是深蓝 on 2017/12/5.
//  Copyright © 2017年 ProductTest. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, Mytype)
{
    type1 = 0,
    type2,
    type3,
    type4,
};



@protocol Delegate<NSObject>
- (void)eat:(NSString *)eat ;
@end


@interface EnumTowViewController : UIViewController


@property (nonatomic, assign) Mytype type ;

@property (nonatomic, assign) id<Delegate> Mydelegate ;

@property (nonatomic, strong) void(^Myblock) (NSArray *ary) ;

@end
