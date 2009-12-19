//
//  SBRandomSearch.m
//  Phage
//
//  Created by Stig Brautaset on 28/10/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "RandomSearchStrategy.h"


@implementation RandomSearchStrategy

- (id)moveFromState:(id<SearchStrategyDelegate>)state {
	NSParameterAssert(state);
	NSArray *moves = [state legalMoves];

	NSUInteger idx = random() % moves.count;
	return [moves objectAtIndex:idx];
}

#pragma mark -

- (id)initWithCoder:(NSCoder *)aDecoder {
    return [super init];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
}

@end
