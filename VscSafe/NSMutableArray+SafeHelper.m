//
//  NSMutableArray+SafeHelper.m
//  Visac
//
//  Created by Visac on 2018/4/21.
//  Copyright © 2018年 Visac. All rights reserved.
//

#import "NSMutableArray+SafeHelper.h"
#import "NSObject+SwizzlingHelper.h"

@implementation NSMutableArray (SafeHelper)
+(void)load{
    swizzleInstanceMethodWithString(@"__NSArrayM",
                                    @selector(addObject:),
                                    @selector(safe_addObject:));
    swizzleInstanceMethodWithString(@"__NSArrayM",
                                    @selector(insertObject:atIndex:),
                                    @selector(safe_insertObject:atIndex:));
    swizzleInstanceMethodWithString(@"__NSArrayM",
                                    @selector(removeObjectAtIndex:),
                                    @selector(safe_removeObjectAtIndex:));
    swizzleInstanceMethodWithString(@"__NSArrayM",
                                    @selector(objectAtIndex:),
                                    @selector(safe_objectAtIndex:));
    swizzleInstanceMethodWithString(@"__NSArrayM",
                                    @selector(replaceObjectAtIndex:withObject:),
                                    @selector(safe_replaceObjectAtIndex:withObject:));
    if (NSFoundationVersionNumber > floor(NSFoundationVersionNumber_iOS_9_x_Max)) {
        swizzleInstanceMethodWithString(@"__NSArrayM",
                                        @selector(objectAtIndexedSubscript:),
                                        @selector(safe_objectAtIndexedSubscript:));
    }
}
#pragma mark - 增
-(void)safe_addObject:(id)anObject{
    if (!anObject) {
        return;
    }
    [self safe_addObject:anObject];
}
-(void)safe_insertObject:(id)anObject atIndex:(NSUInteger)index{
    if (index > self.count) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self safe_insertObject:anObject atIndex:index];
}
#pragma mark - 删
-(void)safe_removeObjectAtIndex:(NSUInteger)index{
    if (index >= self.count) {
        return;
    }
    [self safe_removeObjectAtIndex:index];
}
#pragma mark - 查
-(id)safe_objectAtIndex:(NSUInteger)index{
    if (index >= self.count) {
        return nil;
    }
    return [self safe_objectAtIndex:index];
}
-(id)safe_objectAtIndexedSubscript:(NSUInteger)idx{
    if (idx >= self.count) {
        return nil;
    }
    return [self safe_objectAtIndexedSubscript:idx];
}
#pragma mark - 改
-(void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    if (index >= self.count) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self safe_replaceObjectAtIndex:index withObject:anObject];
}

@end
