//
//  NSObject+SwizzlingHelper.h
//  LemonAuction
//
//  Created by Visac on 2018/4/21.
//  Copyright © 2018年 Wintop. All rights reserved.
//

#import <Foundation/Foundation.h>

void swizzleInstanceMethodWithClass(Class goalClass,SEL selecotor1,SEL selecotor2);
void swizzleClassMethodWithClass(Class goalClass,SEL selecotor1,SEL selecotor2);
void swizzleInstanceMethodWithString(NSString *className,SEL selecotor1,SEL selecotor2);
void swizzleClassMethodWithString(NSString *className,SEL selecotor1,SEL selecotor2);


#define USENULLHANDLE //注释此项,不对label textfield展示null进行规避

@interface NSObject (SwizzlingHelper)
@end
