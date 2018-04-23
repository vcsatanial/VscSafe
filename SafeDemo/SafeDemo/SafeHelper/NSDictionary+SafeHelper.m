//
//  NSDictionary+SafeHelper.m
//  Visac
//
//  Created by Visac on 2018/4/21.
//  Copyright © 2018年 Visac. All rights reserved.
//

#import "NSDictionary+SafeHelper.h"
#import "NSObject+SwizzlingHelper.h"

@implementation NSDictionary (SafeHelper)
+(void)load{
    swizzleInstanceMethodWithString(@"__NSPlaceholderDictionary",
                                    @selector(initWithObjects:forKeys:count:),
                                    @selector(safe_initWithObjects:forKeys:count:));
}
-(instancetype)safe_initWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt{
    NSUInteger cus_cnt = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        if (!(keys[i] && objects[i])) {
            break;
        }
        cus_cnt ++;
    }
    return [self safe_initWithObjects:objects forKeys:keys count:cus_cnt];
}
@end
