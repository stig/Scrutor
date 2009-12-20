/*
 Copyright (c) 2009, Stig Bratuaset.
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
