//
//  main.m
//  runtime_class-dump
//
//  Created by Asger Hautop Drewsen on 5/6/14.
//  Copyright (c) 2014 Tyilo. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <objc/runtime.h>

#import "class-dump.h"
#import "TestClass.h"
#import "tests.h"

int main(int argc, const char * argv[])
{
	@autoreleasepool {
		run_tests();
		
		NSLog(@"\n%@", class_dump_all_classes(NO));
	}
	
    return 0;
}

