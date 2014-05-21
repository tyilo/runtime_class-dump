//
//  TestClass.h
//  runtime_class-dump
//
//  Created by Asger Hautop Drewsen on 5/6/14.
//  Copyright (c) 2014 Tyilo. All rights reserved.
//

#import <Foundation/Foundation.h>

struct test {
	int a:1;
	int b:3;
	int c[10];
	unsigned long long d:64;
};

@interface TestClass : NSObject <NSCopying, NSMutableCopying> {
	NSObject *ivar1;
	const char *ivar2;
}

@property (readonly, getter=getter1, setter=setter1:) id property1;
@property (atomic) struct test property2;

+ (int)classMethod:(int [10])arg0;
- (struct test)testMethod:(NSString *)arg1 withOtherArg:(const char *)arg2;

@end
