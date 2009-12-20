//
//  CopyStateDecoratorTest.m
//  Scrutor
//
//  Created by Hubbie on 20/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "CopyStateDecoratorTest.h"

#import "CopyStateDecorator.h"
#import "AlphabetaSearchStrategy.h"
#import "NegamaxStub.h"

@implementation CopyStateDecoratorTest

- (void)setUp {
    AlphabetaSearchStrategy *underlyingStrategy = [AlphabetaSearchStrategy new];
    underlyingStrategy.maxPly = 3u;
    
    strategy = [CopyStateDecorator new];
    strategy.underlyingStrategy = [underlyingStrategy autorelease];
}

- (void)tearDown {
    [strategy release];
}

#pragma mark -

- (void)testDecorator {
    NegamaxStub *stub = [[NegamaxStub new] autorelease];
    
    id move;
    STAssertNoThrow(move = [strategy moveFromState:stub], nil);
    STAssertEqualObjects(move, @"B", nil);
    STAssertEquals(stub.countOfVisited, 0u, nil);
    STAssertEquals(stub.maxPlyVisited, 0u, nil);
}

#pragma mark -

- (void)testCopy {
    CopyStateDecorator *copy = [strategy copy];
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
