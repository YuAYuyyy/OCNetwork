//
//  ZJHSessionConfiguration.m
//  ZJHURLProtocol
//
//  Created by ZhangJingHao2345 on 2018/8/24.
//  Copyright © 2018年 ZhangJingHao2345. All rights reserved.
//

#import "ZJHSessionConfiguration.h"
#import <objc/runtime.h>
#import "ZJHURLProtocol.h"

@implementation ZJHSessionConfiguration

+ (ZJHSessionConfiguration *)defaultConfiguration {
    static ZJHSessionConfiguration *staticConfiguration;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staticConfiguration=[[ZJHSessionConfiguration alloc] init];
    });
    return staticConfiguration;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.isSwizzle = NO;
    }
    return self;
}

- (void)load {
    self.isSwizzle=YES;
    Class cls = NSClassFromString(@"__NSCFURLSessionConfiguration") ?: NSClassFromString(@"NSURLSessionConfiguration");
    [self swizzleSelector:@selector(protocolClasses) fromClass:cls toClass:[self class]];
    
}

- (void)unload {
    self.isSwizzle=NO;
    Class cls = NSClassFromString(@"__NSCFURLSessionConfiguration") ?: NSClassFromString(@"NSURLSessionConfiguration");
    [self swizzleSelector:@selector(protocolClasses) fromClass:cls toClass:[self class]];
}

- (void)swizzleSelector:(SEL)selector fromClass:(Class)original toClass:(Class)stub {
    Method originalMethod = class_getInstanceMethod(original, selector);
    Method stubMethod = class_getInstanceMethod(stub, selector);
    if (!originalMethod || !stubMethod) {
        [NSException raise:NSInternalInconsistencyException format:@"Couldn't load NEURLSessionConfiguration."];
    }
    method_exchangeImplementations(originalMethod, stubMethod);
}

- (NSArray *)protocolClasses {
    return @[[ZJHURLProtocol class]];
    
}

@end
