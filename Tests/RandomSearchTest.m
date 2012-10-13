/*
 Copyright (c) 2009, Stig Brautaset.
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:
 
   Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
  
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

#import "RandomSearchTest.h"

#import "Scrutor.h"
#import "RandomStub.h"

@implementation RandomSearchTest

- (void)setUp {
    strategy = [SBRandomSearch new];
}

#pragma mark -

- (NSInteger)searchCount {
    return 1e4;
}    

- (void)testRandomSearch {
    RandomStub *stub = [RandomStub new];    
    
    NSCountedSet *set = [NSCountedSet new];
    for (int i = 0; i < [self searchCount]; i++) {
        NSString *move = [strategy moveFromNode:stub];
        [set addObject:move];
    }

    STAssertEquals(set.count, 26u, nil);
    NSUInteger expect = [self searchCount] / 26;
    for (NSString *move in set) {
        NSUInteger count = [set countForObject:move];
        STAssertEqualsWithAccuracy(count, expect, expect * 0.15, nil);
    }
}

#pragma mark -

- (void)testCopy {
    SBRandomSearch *copy = [strategy copy];
    STAssertEqualObjects(copy, strategy, nil);
}

- (void)testCoding {
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"coding.data"];
    [NSKeyedArchiver archiveRootObject:strategy toFile:path];
    
    id unarchived = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    STAssertEqualObjects(unarchived, strategy, nil);
    STAssertNotNil(unarchived, nil);
}

@end
