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

#import "NegamaxSearchTest.h"

#import "NegamaxStub.h"
#import "Scrutor.h"

@implementation NegamaxSearchTest

- (void)setUp {
    stub = [NegamaxStub new];
    strategy = [SBNegamaxSearch new];
}

- (void)tearDown {
    [stub release];
    [strategy release];
}

#pragma mark -

- (void)testMaxPly1 {
    strategy.maxPly = 1;
    id move = [strategy moveFromNode:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 2u, nil);
    STAssertEquals(stub.maxPlyVisited, 1u, nil);
}

- (void)testMaxPly2 {
    strategy.maxPly = 2;
    id move = [strategy moveFromNode:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 6u, nil);
    STAssertEquals(stub.maxPlyVisited, 2u, nil);
}

- (void)testMaxPly3 {
    strategy.maxPly = 3;
    id move = [strategy moveFromNode:stub];
    STAssertEqualObjects(move, @"B", nil);
    STAssertEquals(stub.countOfVisited, 14u, nil);
    STAssertEquals(stub.maxPlyVisited, 3u, nil);
}

- (void)testMaxPly4 {
    strategy.maxPly = 4;
    id move = [strategy moveFromNode:stub];
    STAssertEqualObjects(move, @"A", nil);
    STAssertEquals(stub.countOfVisited, 30u, nil);
    STAssertEquals(stub.maxPlyVisited, 4u, nil);
}

- (void)testMaxPly5 {
    strategy.maxPly = 5;
    id move = [strategy moveFromNode:stub];
    STAssertEqualObjects(move, @"B", nil);
    STAssertEquals(stub.countOfVisited, 62u, nil);
    STAssertEquals(stub.maxPlyVisited, 5u, nil);
}

#pragma mark -

- (void)testCopy {
    strategy.maxPly = random();
    SBNegamaxSearch *copy = [[strategy copy] autorelease];
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
