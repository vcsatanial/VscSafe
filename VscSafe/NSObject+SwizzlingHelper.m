//
//  NSObject+SwizzlingHelper.m
//  LemonAuction
//
//  Created by Visac on 2018/4/21.
//  Copyright © 2018年 Wintop. All rights reserved.
//

#import "NSObject+SwizzlingHelper.h"
#import <objc/runtime.h>

void swizzleInstanceMethodWithClass(Class goalClass,SEL selecotor1,SEL selecotor2){
    Method method1 = class_getInstanceMethod(goalClass,selecotor1);
    Method method2 = class_getInstanceMethod(goalClass,selecotor2);
    method_exchangeImplementations(method1, method2);
}
void swizzleClassMethodWithClass(Class goalClass,SEL selecotor1,SEL selecotor2){
    Method method1 = class_getClassMethod(goalClass,selecotor1);
    Method method2 = class_getClassMethod(goalClass,selecotor2);
    method_exchangeImplementations(method1, method2);
}
void swizzleInstanceMethodWithString(NSString *className,SEL selecotor1,SEL selecotor2){
    Class goalClass = objc_getClass([className UTF8String]);
    Method method1 = class_getInstanceMethod(goalClass,selecotor1);
    Method method2 = class_getInstanceMethod(goalClass,selecotor2);
    method_exchangeImplementations(method1, method2);
}
void swizzleClassMethodWithString(NSString *className,SEL selecotor1,SEL selecotor2){
    Class goalClass = objc_getClass([className UTF8String]);
    Method method1 = class_getClassMethod(goalClass,selecotor1);
    Method method2 = class_getClassMethod(goalClass,selecotor2);
    method_exchangeImplementations(method1, method2);
}
static BOOL closeNull = NO;
@implementation NSObject (SwizzlingHelper)
+(void)closeNullHandle:(BOOL)close{
    closeNull = close;
}
+(BOOL)isCloseNullHandl{
    return closeNull;
}
@end
