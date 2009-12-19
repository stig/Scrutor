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
}

- (void)tearDown {
    [stub release];
}

#pragma mark -

- (void)testIllegalMaxPly {
    STAssertThrows([AlphabetaSearchStrategy new], nil);
	STAssertThrows([[AlphabetaSearchStrategy alloc] initWithMaxPly:0], nil);
}

- (void)testMaxPly1 {
    AlphabetaSearchStrategy *searcher = [[[AlphabetaSearchStrategy alloc] initWithMaxPly:1] autorelease];
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 2u, nil);
    STAssertEquals(stub.maxPlyVisited, 1u, nil);
}

- (void)testMaxPly2 {
    AlphabetaSearchStrategy *searcher = [[[AlphabetaSearchStrategy alloc] initWithMaxPly:2] autorelease];
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 5u, nil);
    STAssertEquals(stub.maxPlyVisited, 2u, nil);
}

- (void)testMaxPly3 {
    AlphabetaSearchStrategy *searcher = [[[AlphabetaSearchStrategy alloc] initWithMaxPly:3] autorelease];
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"B", nil);
    STAssertEquals(stub.countOfVisited, 13u, nil);
    STAssertEquals(stub.maxPlyVisited, 3u, nil);
}

- (void)testMaxPly4 {
    AlphabetaSearchStrategy *searcher = [[[AlphabetaSearchStrategy alloc] initWithMaxPly:4] autorelease];
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 26u, nil);
    STAssertEquals(stub.maxPlyVisited, 4u, nil);
}

- (void)testMaxPly5 {
    AlphabetaSearchStrategy *searcher = [[[AlphabetaSearchStrategy alloc] initWithMaxPly:5] autorelease];
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"B", nil);
    STAssertEquals(stub.countOfVisited, 56u, nil);
    STAssertEquals(stub.maxPlyVisited, 5u, nil);
}

@end
