//
//  AlphabetaSearchStrategyTest.m
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "AlphabetaSearchStrategyTest.h"

#import "NegamaxStub.h"
#import "AlphabetaSearchStrategy.h"

@implementation AlphabetaSearchStrategyTest

- (void)setUp {
    stub = [NegamaxStub new];
    strategy = [AlphabetaSearchStrategy new];
}

- (void)tearDown {
    [stub release];
    [strategy release];
}

#pragma mark -

- (void)testMaxPly1 {
    strategy.maxPly = 1;
    id move = [strategy moveFromState:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 2u, nil);
    STAssertEquals(stub.maxPlyVisited, 1u, nil);
}

- (void)testMaxPly2 {
    strategy.maxPly = 2;
    id move = [strategy moveFromState:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 5u, nil);
    STAssertEquals(stub.maxPlyVisited, 2u, nil);
}

- (void)testMaxPly3 {
    strategy.maxPly = 3;
    id move = [strategy moveFromState:stub];
    STAssertEqualObjects(move, @"B", nil);
    STAssertEquals(stub.countOfVisited, 13u, nil);
    STAssertEquals(stub.maxPlyVisited, 3u, nil);
}

- (void)testMaxPly4 {
    strategy.maxPly = 4;
    id move = [strategy moveFromState:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 26u, nil);
    STAssertEquals(stub.maxPlyVisited, 4u, nil);
}

- (void)testMaxPly5 {
    strategy.maxPly = 5;
    id move = [strategy moveFromState:stub];
    STAssertEqualObjects(move, @"B", nil);
    STAssertEquals(stub.countOfVisited, 56u, nil);
    STAssertEquals(stub.maxPlyVisited, 5u, nil);
}

#pragma mark -

- (void)testCopy {
    strategy.maxPly = random();
    AlphabetaSearchStrategy *copy = [[strategy copy] autorelease];
    STAssertEqualObjects(copy, strategy, nil);
    STAssertEquals(copy.maxPly, strategy.maxPly, nil);
}

- (void)testCoding {
    strategy.maxPly = random();

    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"coding.data"];
    [NSKeyedArchiver archiveRootObject:strategy toFile:path];
    
    id unarchived = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    STAssertEqualObjects(unarchived, strategy, nil);
    STAssertNotNil(unarchived, nil);
}

@end
