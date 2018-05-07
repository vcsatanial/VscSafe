//
//  NSAttributedString+SafeHelper.m
//  Visac
//
//  Created by Visac on 2018/4/23.
//  Copyright © 2018年 Visac. All rights reserved.
//

#import "NSAttributedString+SafeHelper.h"
#import "NSObject+SwizzlingHelper.h"

@implementation NSAttributedString (SafeHelper)
+(void)load{
    swizzleInstanceMethodWithString(@"NSConcreteAttributedString",
                                    @selector(initWithString:),
                                    @selector(safe_initWithString:));
    swizzleInstanceMethodWithString(@"NSConcreteAttributedString",
                                    @selector(initWithString:attributes:),
                                    @selector(safe_initWithString:attributes:));
    swizzleInstanceMethodWithString(@"NSConcreteAttributedString",
                                    @selector(initWithAttributedString:),
                                    @selector(safe_initWithAttributedString:));
}
-(instancetype)safe_initWithString:(NSString *)str{
    if (!str) {
        return nil;
    }
    return [self safe_initWithString:str];
}
-(instancetype)safe_initWithString:(NSString *)str attributes:(NSDictionary<NSAttributedStringKey,id> *)attrs{
    if (!str) {
        return nil;
    }
    return [self safe_initWithString:str];
}
-(instancetype)safe_initWithAttributedString:(NSAttributedString *)attrStr{
    if (!attrStr) {
        return nil;
    }
    return [self safe_initWithAttributedString:attrStr];
}
@end
