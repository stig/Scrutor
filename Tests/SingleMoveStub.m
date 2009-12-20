//
//  SingleMoveStub.m
//  Scrutor
//
//  Created by Hubbie on 20/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "SingleMoveStub.h"


@implementation SingleMoveStub

@synthesize callCount = _callCount;

- (id)copyWithZone:(NSZone *)zone {
    return [self retain];
}

- (NSArray*)legalMoves {
    _callCount++;
    return [NSArray arrayWithObject:@"A"];
}        

- (NSInteger)fitness {
    _callCount++;
    @throw @"fitness";
}

- (void)performLegalMove:(id)move {
    _callCount++;
    @throw @"performMove";
}

- (void)undoLegalMove:(id)move {
    _callCount++;
    @throw @"undoMove";
}    

@end
