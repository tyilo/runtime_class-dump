//
//  tests.m
//  runtime_class-dump
//
//  Created by Asger Hautop Drewsen on 5/7/14.
//  Copyright (c) 2014 Tyilo. All rights reserved.
//

#import "tests.h"

#import "TestClass.h"
#import "class-dump.h"

#define TEST(enc) test_func(@encode(enc), #enc)

int test_counter = 0;
int fail_counter = 0;

void test_func(const char *encoding, const char *expectedString) {
	NSString *def = variableDefinitionWithName(encoding, "");
	NSString *trimmedDef = [def stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" ;"]];
	
	if([trimmedDef isNotEqualTo:[NSString stringWithUTF8String:expectedString]]) {
		printf("Failed %d:\n\tEncoded:  %s\n\tGot:      %s\n\tExpected: %s\n\n", test_counter, encoding, [trimmedDef UTF8String], expectedString);
		fail_counter++;
	}
	
	test_counter++;
}

void run_tests(void) {
	TEST(int);
	TEST(int [3][6]);
	TEST(int* [10][10]);
	TEST(struct { int field0[22]; unsigned long long field1:10; unsigned long long field2:5; });
	TEST(struct CGPoint { double field0; double field1; });
	TEST(union union_name { int field0; int field1; });
	
	TEST(int(* ) [10]);
	
	test_func("{YorkshireTeaStruct=\"pot\"i\"lady\"c}", "struct YorkshireTeaStruct { int pot; char lady; }");
	
	test_func("{CFSlice=\"items\"^^v\"wantsStrong\"c\"wantsWeak\"c\"shouldCopyIn\"c\"usesStrong\"c\"usesWeak\"c\"usesSentinel\"c\"pointerPersonality\"c\"integerPersonality\"c\"simpleReadClear\"c\"callback\"@\"__CFWeakCallback\"\"sizeFunction\"^?\"hashFunction\"^?\"isEqualFunction\"^?\"describeFunction\"^?\"acquireFunction\"^?\"relinquishFunction\"^?\"allocateFunction\"^?\"freeFunction\"^?\"readAt\"^?\"clearAt\"^?\"storeAt\"^?}", "struct CFSlice { void** items; char wantsStrong; char wantsWeak; char shouldCopyIn; char usesStrong; char usesWeak; char usesSentinel; char pointerPersonality; char integerPersonality; char simpleReadClear; __CFWeakCallback * callback; void ** sizeFunction; void ** hashFunction; void ** isEqualFunction; void ** describeFunction; void ** acquireFunction; void ** relinquishFunction; void ** allocateFunction; void ** freeFunction; void ** readAt; void ** clearAt; void ** storeAt; }");
	
	if(fail_counter == 0) {
		printf("Ran all %d tests succesfully!\n", test_counter);
	} else {
		printf("Failed %d out of %d tests!\n", fail_counter, test_counter);
	}
}
