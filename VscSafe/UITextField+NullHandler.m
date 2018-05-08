//
//  UITextField+NullHandler.m
//  Visac
//
//  Created by Visac on 2018/4/23.
//  Copyright © 2018年 Visac. All rights reserved.
//

#import "UITextField+NullHandler.h"
#import "NSObject+SwizzlingHelper.h"

@implementation UITextField (NullHandler)
+(void)load{
#ifdef USENULLHANDLE
    swizzleInstanceMethodWithClass([UITextField class],
                                   @selector(setText:),
                                   @selector(null_setText:));
#endif
}
-(void)null_setText:(NSString *)text{
    if (![text isKindOfClass:[NSString class]] || [text isEqualToString:@"<null>"] || [text isEqualToString:@"(null)"]) {
        text = nil;
    }
    [self null_setText:text];
}
@end
