//
//  NSError+SafeHelper.m
//  Visac
//
//  Created by Visac on 2018/4/23.
//  Copyright © 2018年 Visac. All rights reserved.
//

#import "NSError+SafeHelper.h"
#import "NSObject+SwizzlingHelper.h"

@implementation NSError (SafeHelper)
+(void)load{
    swizzleClassMethodWithClass([NSError class],
                                @selector(errorWithDomain:code:userInfo:),
                                @selector(safe_errorWithDomain:code:userInfo:));
}
+(instancetype)safe_errorWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(NSDictionary<NSErrorUserInfoKey,id> *)dict{
    if (!domain) {
        domain = @"";
    }
    return [self safe_errorWithDomain:domain code:code userInfo:dict];
}
@end
