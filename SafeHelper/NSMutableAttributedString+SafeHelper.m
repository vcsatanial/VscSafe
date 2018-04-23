//
//  NSMutableAttributedString+SafeHelper.m
//  ttttttt
//
//  Created by Visac on 2018/4/23.
//  Copyright © 2018年 Visac. All rights reserved.
//

#import "NSMutableAttributedString+SafeHelper.h"
#import "NSObject+SwizzlingHelper.h"

@implementation NSMutableAttributedString (SafeHelper)
+(void)load{
    swizzleInstanceMethodWithString(@"NSConcreteMutableAttributedString",
                                    @selector(appendAttributedString:),
                                    @selector(safe_appendAttributedString:));
    swizzleInstanceMethodWithString(@"NSConcreteMutableAttributedString",
                                    @selector(addAttribute:value:range:),
                                    @selector(safe_addAttribute:value:range:));
    swizzleInstanceMethodWithString(@"NSConcreteMutableAttributedString",
                                    @selector(addAttributes:range:),
                                    @selector(safe_addAttributes:range:));
    swizzleInstanceMethodWithString(@"NSConcreteMutableAttributedString",
                                    @selector(removeAttribute:range:),
                                    @selector(safe_removeAttribute:range:));
    swizzleInstanceMethodWithString(@"NSConcreteMutableAttributedString",
                                    @selector(replaceCharactersInRange:withString:),
                                    @selector(safe_replaceCharactersInRange:withString:));
    swizzleInstanceMethodWithString(@"NSConcreteMutableAttributedString",
                                    @selector(insertAttributedString:atIndex:),
                                    @selector(safe_insertAttributedString:atIndex:));
    swizzleInstanceMethodWithString(@"NSConcreteMutableAttributedString",
                                    @selector(deleteCharactersInRange:),
                                    @selector(safe_deleteCharactersInRange:));
    swizzleInstanceMethodWithString(@"NSConcreteMutableAttributedString",
                                    @selector(setAttributedString:),
                                    @selector(safe_setAttributedString:));
}
-(void)safe_appendAttributedString:(NSAttributedString *)attrString{
    if (!attrString) {
        return;
    }
    [self safe_appendAttributedString:attrString];
}
-(void)safe_addAttribute:(NSAttributedStringKey)name value:(id)value range:(NSRange)range{
    if (!name) {
        return;
    }
    if (!value) {
        return;
    }
    if (range.location + range.length > self.length) {
        return;
    }
    [self safe_addAttribute:name value:value range:range];
}
-(void)safe_addAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs range:(NSRange)range{
    if (!attrs) {
        return;
    }
    if (range.location + range.length > self.length) {
        return;
    }
    [self safe_addAttributes:attrs range:range];
}
-(void)safe_removeAttribute:(NSAttributedStringKey)name range:(NSRange)range{
    if (range.location + range.length > self.length) {
        return;
    }
    [self safe_removeAttribute:name range:range];
}
-(void)safe_replaceCharactersInRange:(NSRange)range withString:(NSString *)str{
    if (range.location + range.length > self.length) {
        return;
    }
    if (!str) {
        return;
    }
    [self safe_replaceCharactersInRange:range withString:str];
}
-(void)safe_insertAttributedString:(NSAttributedString *)attrString atIndex:(NSUInteger)loc{
    if (!attrString) {
        return;
    }
    if (loc > self.length) {
        return;
    }
    [self safe_insertAttributedString:attrString atIndex:loc];
}
-(void)safe_deleteCharactersInRange:(NSRange)range{
    if (range.location + range.length > self.length) {
        return;
    }
    [self safe_deleteCharactersInRange:range];
}
-(void)safe_setAttributedString:(NSAttributedString *)attrString{
    if (!attrString) {
        return;
    }
    [self safe_setAttributedString:attrString];
}
@end
