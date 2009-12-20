//
//  NegamaxSearchStrategy.m
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "NegamaxSearchStrategy.h"


@implementation NegamaxSearchStrategy

@synthesize maxPly = _maxPly;

#pragma mark -

- (id)initWithCoder:(NSCoder *)aDecoder {
    self.maxPly = [aDecoder decodeIntegerForKey:@"maxPly"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.maxPly forKey:@"maxPly"];
}

#pragma mark -

- (BOOL)isEqual:(id)object {
    if (![self isMemberOfClass:[object class]])
        return NO;
    NegamaxSearchStrategy *o = object;
    return _maxPly == o.maxPly;
}    

#pragma mark -

- (NSInteger)fitnessWithState:(id<SearchStrategyDelegate>)state plyLeft:(NSUInteger)plyLeft {
	NSParameterAssert(state);
    
	if (!plyLeft)
		return [state fitness];
    
    NSArray *moves = [state legalMoves];
    if (!moves.count)
        return [state fitness];
    
    NSInteger best = INT_MIN;
    for (id m in moves) {
        [state performLegalMove:m];
        
        NSInteger sc = -[self fitnessWithState:state plyLeft:plyLeft-1];
        if (sc > best)
            best = sc;
        
        [state undoLegalMove:m];
    }
    return best;
}

- (id)moveFromState:(id<SearchStrategyDelegate>)state {
	NSParameterAssert(state);
    
    id bestMove = nil;
    NSInteger best = INT_MIN;
    for (id m in [state legalMoves]) {
        NSAutoreleasePool *pool = [NSAutoreleasePool new];        
        [state performLegalMove:m];
        
        NSInteger sc = -[self fitnessWithState:state plyLeft:self.maxPly-1];
        
        if (sc > best) {
            best = sc;
            bestMove = m;
        }
        
        [state undoLegalMove:m];
        [pool drain];
    }
    
    return bestMove;
}

@end
