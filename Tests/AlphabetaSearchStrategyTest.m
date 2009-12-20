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
    searcher = [AlphabetaSearchStrategy new];
}

- (void)tearDown {
    [stub release];
    [searcher release];
}

#pragma mark -

- (void)testMaxPly1 {
    searcher.maxPly = 1;
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 2u, nil);
    STAssertEquals(stub.maxPlyVisited, 1u, nil);
}

- (void)testMaxPly2 {
    searcher.maxPly = 2;
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 5u, nil);
    STAssertEquals(stub.maxPlyVisited, 2u, nil);
}

- (void)testMaxPly3 {
    searcher.maxPly = 3;
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"B", nil);
    STAssertEquals(stub.countOfVisited, 13u, nil);
    STAssertEquals(stub.maxPlyVisited, 3u, nil);
}

- (void)testMaxPly4 {
    searcher.maxPly = 4;
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 26u, nil);
    STAssertEquals(stub.maxPlyVisited, 4u, nil);
}

- (void)testMaxPly5 {
    searcher.maxPly = 5;
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"B", nil);
    STAssertEquals(stub.countOfVisited, 56u, nil);
    STAssertEquals(stub.maxPlyVisited, 5u, nil);
}

@end
