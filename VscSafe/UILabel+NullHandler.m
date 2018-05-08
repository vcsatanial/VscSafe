//
//  UILabel+NullHandler.m
//  Visac
//
//  Created by Visac on 2018/4/23.
//  Copyright © 2018年 Visac. All rights reserved.
//

#import "UILabel+NullHandler.h"
#import "NSObject+SwizzlingHelper.h"

@implementation UILabel (NullHandler)
+(void)load{
#ifdef USENULLHANDLE
    swizzleInstanceMethodWithClass([UILabel class],
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
