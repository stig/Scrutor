//
//  IterativeAlphabetaSearchStrategy.m
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "IterativeAlphabetaSearchStrategy.h"

@implementation IterativeAlphabetaSearchStrategy

@synthesize timeInterval = _timeInterval;
@synthesize foundEnd = _foundEnd;

#pragma mark -

- (id)initWithCoder:(NSCoder *)aDecoder {
    self.timeInterval = [aDecoder decodeDoubleForKey:@"timeInterval"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.timeInterval forKey:@"timeInterval"];
}

#pragma mark -

- (BOOL)isEqual:(id)object {
    if (![self isMemberOfClass:[object class]])
        return NO;
    IterativeAlphabetaSearchStrategy *o = object;
    return _timeInterval == o.timeInterval;
}

#pragma mark -

- (NSInteger)fitnessWithState:(id<SearchStrategyDelegate>)state
                          ply:(NSUInteger)ply
                        alpha:(NSInteger)alpha
                         beta:(NSInteger)beta
{
	NSParameterAssert(state);
    
    // Have we run out of time?
    if ([_cutOffDate timeIntervalSinceNow] < 0)
        return 0;

    // TODO: move up above the previous statement?
    // Have we reached the maximum ply for this search?
	if (!ply) {
        _foundEnd = NO;
		return [state fitness];
    }
    
    // Any more moves left?
    NSArray *moves = [state legalMoves];
    if (!moves.count)
        return [state fitness];
    
    
    for (id m in moves) {
        [state performLegalMove:m];
        
        NSInteger sc = -[self fitnessWithState:state
                                           ply:ply-1
                                         alpha:-beta
                                          beta:-alpha];
        if (sc > alpha)
            alpha = sc;
        
        [state undoLegalMove:m];
        
        if (beta != INT_MIN && alpha > beta)
            break;
    }
    
    return alpha;
}

- (NSArray*)movesOrderByScores:(NSDictionary*)scores {
    NSArray *moves = [scores keysSortedByValueUsingSelector:@selector(compare:)];
    NSMutableArray *moves2 = [NSMutableArray arrayWithCapacity:moves.count];
    for (id m in moves)
        [moves2 insertObject:m atIndex:0];
    return moves2;
}

- (id)moveFromState:(id<SearchStrategyDelegate>)state {
	NSParameterAssert(state);
    
    _cutOffDate = [NSDate dateWithTimeIntervalSinceNow:self.timeInterval * 0.95];
    
    id bestMove = nil;
    NSArray *moves = [state legalMoves];
    
    for (int ply = 0; ; ply++) {
        NSMutableDictionary *scores = [NSMutableDictionary dictionaryWithCapacity:moves.count];
        
        _foundEnd = YES;
        
        id bestMoveAtPly = nil;
        NSUInteger leafCount = 0;
        NSInteger alpha = INT_MIN;
        for (id m in moves) {
            NSAutoreleasePool *pool = [NSAutoreleasePool new];
            [state performLegalMove:m];
            
            NSInteger sc = -[self fitnessWithState:state ply:ply alpha:INT_MIN beta:-alpha];
            if (sc > alpha) {
                alpha = sc;
                bestMoveAtPly = m;
            }
            
            // Did we search to the end of this branch?
            if (_foundEnd)
                leafCount++;        
            
            // Record the score of this move so we can try that first next time.
            // This is an attempt at optimising the number of alpha-beta cut-offs.
            [scores setObject:[NSNumber numberWithInteger:sc] forKey:m];
            
            [state undoLegalMove:m];
            [pool drain];
        }
        
        // Are we out of time?
        if ([_cutOffDate timeIntervalSinceNow] < 0) {
            NSLog(@"Time is used up");
            break;
        }
        
        // If we found a move searching to this ply (and why would we not?)
        // Record it as the best found so far.
        if (bestMoveAtPly)
            bestMove = bestMoveAtPly;
        
        if (leafCount == [moves count]) {
            // In this case we know that it makes no sense to search any deeper, 
            // because we are (probably) in the endgame and we have already exhausted
            // the remaining search space.
            NSLog(@"Reached the end in every branch");
            break;
        }
        
        //        moves = [self movesOrderedByScores:scores];
    }
    
    return bestMove;
}

@end