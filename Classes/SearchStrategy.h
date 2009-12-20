//
//  SearchStrategy.h
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Protocol for states to implement.
 */
@protocol SearchStrategyDelegate < NSObject >

/**
 Transform the state into its successor.
 */
- (void)performLegalMove:(id)move;

/**
 Reverts the state back to its successor.
 */
- (void)undoLegalMove:(id)move;

/**
 Returns an array of legal moves.
 These will be used to translate the state into valid successor states.
 If passing is allowed in your game it is your responsibility to return a pass move from this method.
 */
- (NSArray*)legalMoves;

/**
 Return the fitness score of a particular state.
 This should be a positive score if the state is fortuitous for the current player.
 Zero means that neither player has an advantage.
 */
- (NSInteger)fitness;

@end


/**
 Protocol for concrete search strategies.
 */
@protocol SearchStrategy < NSObject, NSCopying, NSCoding >

/**
 Returns the best move found for this state.
 */
- (id)moveFromState:(id<SearchStrategyDelegate>)state;

@end
