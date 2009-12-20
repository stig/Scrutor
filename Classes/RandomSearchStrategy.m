//
//  SBRandomSearch.m
//  Phage
//
//  Created by Stig Brautaset on 28/10/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "RandomSearchStrategy.h"


@implementation RandomSearchStrategy

- (id)initWithCoder:(NSCoder *)aDecoder {
    return [self init];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
}

#pragma mark -

- (id)copyWithZone:(NSZone *)zone {
    return [self retain];
}

- (BOOL)isEqual:(id)object {
    return [self isMemberOfClass:[object class]];
}    

#pragma mark -

- (id)moveFromState:(id<SearchStrategyDelegate>)state {
	NSParameterAssert(state);
	NSArray *moves = [state legalMoves];
    
	NSUInteger idx = random() % moves.count;
	return [moves objectAtIndex:idx];
}

@end
