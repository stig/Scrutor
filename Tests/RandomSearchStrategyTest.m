//
//  RanmoSearchStrategyTest.m
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "RandomSearchStrategyTest.h"

#import "RandomSearchStrategy.h"
#import "RandomStub.h"

@implementation RandomSearchStrategyTest

- (void)setUp {
    strategy = [RandomSearchStrategy new];
}

- (void)tearDown {
    [strategy release];
}

#pragma mark -

- (NSInteger)searchCount {
    return 1e4;
}    

- (void)testRandomSearch {
    RandomStub *stub = [[RandomStub new] autorelease];    
    
    NSCountedSet *set = [NSCountedSet new];
    for (int i = 0; i < [self searchCount]; i++) {
        NSString *move = [strategy moveFromState:stub];
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
    RandomSearchStrategy *copy = [[strategy copy] autorelease];
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
