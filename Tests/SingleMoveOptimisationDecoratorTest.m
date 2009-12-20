//
//  SingleMoveOptimisationDecoratorTest.m
//  Scrutor
//
//  Created by Hubbie on 20/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "SingleMoveOptimisationDecoratorTest.h"

#import "SingleMoveOptimisationDecorator.h"
#import "RandomSearchStrategy.h"

@implementation SingleMoveOptimisationDecoratorTest

- (void)setUp {
    strategy = [SingleMoveOptimisationDecorator new];
    strategy.underlyingStrategy = [[RandomSearchStrategy new] autorelease];
}

- (void)tearDown {
    [strategy release];
}

#pragma mark -

- (void)testCopy {
    SingleMoveOptimisationDecorator *copy = [strategy copy];
    STAssertEqualObjects(copy, strategy, nil);
    STAssertEqualObjects(copy.underlyingStrategy, strategy.underlyingStrategy, nil);
}

- (void)testCoding {
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"coding.data"];
    [NSKeyedArchiver archiveRootObject:strategy toFile:path];
    
    id unarchived = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    STAssertEqualObjects(unarchived, strategy, nil);
    STAssertNotNil(unarchived, nil);
}

@end
