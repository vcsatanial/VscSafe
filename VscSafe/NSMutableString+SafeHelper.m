//
//  NSMutableString+SafeHelper.m
//  ttttttt
//
//  Created by Visac on 2018/4/23.
//  Copyright © 2018年 Visac. All rights reserved.
//

#import "NSMutableString+SafeHelper.h"
#import "NSObject+SwizzlingHelper.h"

@implementation NSMutableString (SafeHelper)
+(void)load{
    swizzleInstanceMethodWithString(@"__NSCFConstantString",
                                    @selector(appendString:),
                                    @selector(safe_appendString:));
    swizzleInstanceMethodWithString(@"__NSCFConstantString",
                                    @selector(appendFormat:),
                                    @selector(safe_appendFormat:));
    swizzleInstanceMethodWithString(@"__NSCFConstantString",
                                    @selector(setString:),
                                    @selector(safe_setString:));
    swizzleInstanceMethodWithString(@"__NSCFConstantString",
                                    @selector(insertString:atIndex:),
                                    @selector(safe_insertString:atIndex:));
}
-(void)safe_appendString:(NSString *)aString{
    if (!aString) {
        return;
    }
    [self safe_appendString:aString];
}
-(void)safe_appendFormat:(NSString *)format, ...{
    if (!format) {
        return;
    }
    va_list arg;
    va_start(arg, format);
    NSString *string = [[NSString alloc] initWithFormat:format arguments:arg];
    va_end(arg);
    [self safe_appendFormat:@"%@",string];
}
-(void)safe_setString:(NSString *)aString{
    if (!aString) {
        return;
    }
    [self safe_setString:aString];
}
-(void)safe_insertString:(NSString *)aString atIndex:(NSUInteger)loc{
    if (!aString) {
        return;
    }
    if (loc > self.length) {
        return;
    }
    [self safe_insertString:aString atIndex:loc];
}
@end
