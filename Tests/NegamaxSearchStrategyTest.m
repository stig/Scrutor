//
//  NegamaxSearchStrategyTest.m
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "NegamaxSearchStrategyTest.h"

#import "NegamaxStub.h"
#import "NegamaxSearchStrategy.h"

@implementation NegamaxSearchStrategyTest

- (void)setUp {
    stub = [NegamaxStub new];
}

- (void)tearDown {
    [stub release];
}

#pragma mark -

- (void)testIllegalMaxPly {
    STAssertThrows([NegamaxSearchStrategy new], nil);
	STAssertThrows([[NegamaxSearchStrategy alloc] initWithMaxPly:0], nil);
}

- (void)testMaxPly1 {
    NegamaxSearchStrategy *searcher = [[[NegamaxSearchStrategy alloc] initWithMaxPly:1] autorelease];
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 2u, nil);
    STAssertEquals(stub.maxPlyVisited, 1u, nil);
}

- (void)testMaxPly2 {
    NegamaxSearchStrategy *searcher = [[[NegamaxSearchStrategy alloc] initWithMaxPly:2] autorelease];
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 6u, nil);
    STAssertEquals(stub.maxPlyVisited, 2u, nil);
}

- (void)testMaxPly3 {
    NegamaxSearchStrategy *searcher = [[[NegamaxSearchStrategy alloc] initWithMaxPly:3] autorelease];
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"B", nil);
    STAssertEquals(stub.countOfVisited, 14u, nil);
    STAssertEquals(stub.maxPlyVisited, 3u, nil);
}

- (void)testMaxPly4 {
    NegamaxSearchStrategy *searcher = [[[NegamaxSearchStrategy alloc] initWithMaxPly:4] autorelease];
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 30u, nil);
    STAssertEquals(stub.maxPlyVisited, 4u, nil);
}

- (void)testMaxPly5 {
    NegamaxSearchStrategy *searcher = [[[NegamaxSearchStrategy alloc] initWithMaxPly:5] autorelease];
    id move = [searcher moveFromState:stub];
    STAssertEqualObjects(move, @"B", nil);
    STAssertEquals(stub.countOfVisited, 62u, nil);
    STAssertEquals(stub.maxPlyVisited, 5u, nil);
}

@end
