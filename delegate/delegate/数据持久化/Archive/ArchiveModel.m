//
//  ArchiveModel.m
//  delegate
//
//  Created by 最爱是深蓝 on 2018/1/4.
//  Copyright © 2018年 ProductTest. All rights reserved.
//

#import "ArchiveModel.h"

@implementation ArchiveModel

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"] ;
    [aCoder encodeObject:self.age forKey:@"age"] ;
    [aCoder encodeObject:self.gender forKey:@"gender"] ;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"] ;
        self.age = [aDecoder decodeObjectForKey:@"age"] ;
        self.gender = [aDecoder decodeObjectForKey:@"gender"] ;
    }
    return self ;
}



@end
