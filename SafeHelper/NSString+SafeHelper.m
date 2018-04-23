//
//  NSString+SafeHelper.m
//  ttttttt
//
//  Created by Visac on 2018/4/23.
//  Copyright © 2018年 Visac. All rights reserved.
//

#import "NSString+SafeHelper.h"
#import "NSObject+SwizzlingHelper.h"

@implementation NSString (SafeHelper)
+(void)load{
    swizzleInstanceMethodWithString(@"__NSCFString",
                                    @selector(characterAtIndex:),
                                    @selector(safe_characterAtIndex:));
    swizzleInstanceMethodWithString(@"__NSCFString",
                                    @selector(substringFromIndex:),
                                    @selector(safe_substringFromIndex:));
    swizzleInstanceMethodWithString(@"__NSCFString",
                                    @selector(substringToIndex:),
                                    @selector(safe_substringToIndex:));
    swizzleInstanceMethodWithString(@"__NSCFString",
                                    @selector(substringWithRange:),
                                    @selector(safe_substringWithRange:));
}
-(unichar)safe_characterAtIndex:(NSUInteger)index{
    if (index >= self.length) {
        return 0;
    }
    return [self safe_characterAtIndex:index];
}
-(NSString *)safe_substringFromIndex:(NSUInteger)from{
    if (from >= self.length) {
        return @"";
    }
    return [self safe_substringFromIndex:from];
}
-(NSString *)safe_substringToIndex:(NSUInteger)to{
    if (to >= self.length) {
        return @"";
    }
    return [self safe_substringToIndex:to];
}
-(NSString *)safe_substringWithRange:(NSRange)range{
    if (range.location + range.length > self.length) {
        return @"";
    }
    return [self safe_substringWithRange:range];
}
@end
