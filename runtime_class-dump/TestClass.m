//
//  TestClass.m
//  runtime_class-dump
//
//  Created by Asger Hautop Drewsen on 5/6/14.
//  Copyright (c) 2014 Tyilo. All rights reserved.
//

#import "TestClass.h"

@implementation TestClass

+ (int)classMethod:(int [10])arg0 {
	return 0;
}

- (struct test)testMethod:(NSString *)arg1 withOtherArg:(const char *)arg2 {
	struct test a;
	return a;
}

- (id)copyWithZone:(NSZone *)zone {
	return nil;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
	return nil;
}

@end
