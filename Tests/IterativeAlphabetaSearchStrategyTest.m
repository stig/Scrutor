/*
 Copyright (c) 2009, Stig Brautaset.
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:
 
 Redistributions of source code must retain the above copyright notice,
 this list of conditions and the following disclaimer.

 Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 Neither the name of the the author nor the names of its contributors
 may be used to endorse or promote products derived from this software
 without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "IterativeAlphabetaSearchStrategyTest.h"

#import "NegamaxStub.h"
#import "IterativeStub.h"
#import "Scrutor.h"

@implementation IterativeAlphabetaSearchStrategyTest

- (void)setUp {
    strategy = [IterativeAlphabetaSearchStrategy new];
}

- (void)tearDown {
    [strategy release];
}

#pragma mark -

- (void)testSearchSpaceExhausted {
    NegamaxStub *stub = [[NegamaxStub new] autorelease];
    strategy.timeInterval = 10.0; // Allow many seconds.
    
    NSDate *start = [NSDate date];
    id move = [strategy moveFromState:stub];
    NSTimeInterval duration = -[start timeIntervalSinceNow];
    
    STAssertTrue(duration < 0.1, @"Duration was %f", duration);
    STAssertEqualObjects(move, @"B", nil);

    STAssertEquals(stub.maxPlyVisited, 5u, @"reached max ply");
    STAssertTrue(strategy.foundEnd, @"reached max ply in all paths");
}

- (void)testUsesUpTime {
    IterativeStub *stub = [[IterativeStub new] autorelease];
    strategy.timeInterval = 0.1;

    NSDate *start = [NSDate date];
    id move = [strategy moveFromState:stub];
    NSTimeInterval duration = -[start timeIntervalSinceNow];
    
    STAssertNotNil(move, nil);
    STAssertTrue(stub.maxPlyVisited > 5u, nil);
    STAssertTrue(stub.maxPlyVisited < 9u, nil);
    STAssertEqualsWithAccuracy(duration, 0.1, 0.005, nil);
    STAssertFalse(strategy.foundEnd, @"Did not reach end in all paths");
    
    // Verify that a plain AlphaBeta to the highest completed level finds the same best move.
    SBAlphabetaSearch *ab = [[SBAlphabetaSearch new] autorelease];

    // Subtract 1 from the maxPlyVisited because that is the highest attempted level.
    ab.maxPly = stub.maxPlyVisited - 1;
    id move2 = [ab moveFromState:stub];
    STAssertEqualObjects(move, move2, nil);
}

#pragma mark -

- (void)testCopy {
    strategy.timeInterval = random();
    IterativeAlphabetaSearchStrategy *copy = [[strategy copy] autorelease];
    STAssertEqualObjects(copy, strategy, nil);
    STAssertEquals(copy.timeInterval, strategy.timeInterval, nil);
}

- (void)testCoding {
    strategy.timeInterval = random();
    
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"coding.data"];
    [NSKeyedArchiver archiveRootObject:strategy toFile:path];
    
    id unarchived = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    STAssertEqualObjects(unarchived, strategy, nil);
    STAssertNotNil(unarchived, nil);
}

@end
