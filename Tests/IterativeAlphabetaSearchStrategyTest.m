//
//  IterativeAlphabetaSearchStrategyTest.m
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "IterativeAlphabetaSearchStrategyTest.h"

#import "NegamaxStub.h"
#import "IterativeStub.h"
#import "IterativeAlphabetaSearchStrategy.h"

@implementation IterativeAlphabetaSearchStrategyTest

- (void)setUp {
    searcher = [IterativeAlphabetaSearchStrategy new];
}

- (void)tearDown {
    [searcher release];
}

#pragma mark -

- (void)testSearchSpaceExhausted {
    NegamaxStub *stub = [[NegamaxStub new] autorelease];
    searcher.timeInterval = 10.0; // Allow many seconds.
    
    NSDate *start = [NSDate date];
    id move = [searcher moveFromState:stub];
    NSTimeInterval duration = -[start timeIntervalSinceNow];
    
    STAssertTrue(duration < 0.02, @"Duration was %f", duration);
    STAssertEquals(stub.maxPlyVisited, 5u, @"reached max ply");
    STAssertEqualObjects(move, @"B", nil);
}

- (void)testUsesUpTime {
    IterativeStub *stub = [[IterativeStub new] autorelease];
    searcher.timeInterval = 0.1;

    NSDate *start = [NSDate date];
    id move = [searcher moveFromState:stub];
    NSTimeInterval duration = -[start timeIntervalSinceNow];
    
    STAssertNotNil(move, nil);
    STAssertTrue(stub.maxPlyVisited > 5u, nil);
    STAssertEqualsWithAccuracy(duration, 0.1, 0.005, nil);
    
}

@end
