//
//  NSMutableDictionary+SafeHelper.m
//  ttttttt
//
//  Created by Visac on 2018/4/21.
//  Copyright © 2018年 Visac. All rights reserved.
//

#import "NSMutableDictionary+SafeHelper.h"
#import "NSObject+SwizzlingHelper.h"

@implementation NSMutableDictionary (SafeHelper)
+(void)load{
    swizzleInstanceMethodWithString(@"__NSDictionaryM",
                                    @selector(setObject:forKey:),
                                    @selector(safe_setObject:forKey:));
    swizzleInstanceMethodWithString(@"__NSDictionaryM",
                                    @selector(removeObjectForKey:),
                                    @selector(safe_removeObjectForKey:));
}
-(void)safe_setObject:(id)anObject forKey:(id<NSCopying>)aKey{
    if (!anObject || !aKey) {
        return;
    }
    [self safe_setObject:anObject forKey:aKey];
}
-(void)safe_removeObjectForKey:(id)aKey{
    if (!aKey) {
        return;
    }
    [self safe_removeObjectForKey:aKey];
}
@end
