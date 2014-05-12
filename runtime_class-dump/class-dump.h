//
//  class-dump.h
//  runtime_class-dump
//
//  Created by Asger Hautop Drewsen on 5/6/14.
//  Copyright (c) 2014 Tyilo. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *basicTypeFromEncoding(const char *encoding);
NSArray *typeStringFromEncoding(const char *typeEncoding, NSUInteger *end);
NSString *variableDefinitionWithName(const char *typeEncoding, const char *name);
NSString *methodArgTypeString(const char *typeEncoding);
NSString *class_dump_class(Class class);
NSString *class_dump_all_classes(BOOL includeSystemClasses);
