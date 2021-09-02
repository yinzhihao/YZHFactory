//
//  YZHObject.m
//  YZHFactoryDemo
//
//  Created by NO NAME on 2021/9/2.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "YZHObject.h"

@implementation YZHObject

SINGLETON_FOR_CLASS()

- (void)ttt
{
    YZHLog(@"测试单例");
}

@end
