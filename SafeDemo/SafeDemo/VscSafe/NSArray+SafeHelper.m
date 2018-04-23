//
//  NSArray+SafeHelper.m
//  LemonAuction
//
//  Created by Visac on 2018/4/21.
//  Copyright © 2018年 Wintop. All rights reserved.
//

#import "NSArray+SafeHelper.h"
#import "NSObject+SwizzlingHelper.h"

@implementation NSArray (SafeHelper)
+(void)load{
    swizzleInstanceMethodWithString(@"__NSPlaceholderArray",
                                    @selector(initWithObjects:count:),
                                    @selector(safe_initWithObjects:count:));
    swizzleInstanceMethodWithString(@"__NSArrayI",
                                    @selector(objectAtIndex:),
                                    @selector(safe_objectAtIndex:));
    swizzleInstanceMethodWithString(@"__NSArrayI",
                                    @selector(objectAtIndexedSubscript:),
                                    @selector(safe_objectAtIndexedSubscript:));
    swizzleInstanceMethodWithString(@"__NSSingleObjectArrayI",
                                    @selector(objectAtIndex:),
                                    @selector(safe_single_objectAtIndex:));
    swizzleInstanceMethodWithString(@"__NSArray0",
                                    @selector(objectAtIndex:),
                                    @selector(safe_zero_objectAtIndex:));
    swizzleInstanceMethodWithString(@"__NSArrayI",
                                    @selector(arrayByAddingObject:),
                                    @selector(safe_arrayByAddingObject:));
}
-(instancetype)safe_initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt{
    NSUInteger cus_cnt = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        if (!objects[i]) {
            break;
        }
        cus_cnt ++;
    }
    return [self safe_initWithObjects:objects count:cus_cnt];
}
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
-(id)safe_single_objectAtIndex:(NSUInteger)index{
    if (index > 0) {
        return nil;
    }
    return [self safe_single_objectAtIndex:index];
}
-(id)safe_zero_objectAtIndex:(NSUInteger)index{
    return nil;
}
-(NSArray *)safe_arrayByAddingObject:(id)anObject{
    if (!anObject) {
        return self;
    }
    return [self safe_arrayByAddingObject:anObject];
}

@end
