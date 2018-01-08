//
//  ArchiveModel.h
//  delegate
//
//  Created by 最爱是深蓝 on 2018/1/4.
//  Copyright © 2018年 ProductTest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArchiveModel : NSObject<NSCoding>

@property (nonatomic, copy) NSString * name ;
@property (nonatomic, copy) NSString * age ;
@property (nonatomic, copy) NSString * gender ;

@end
