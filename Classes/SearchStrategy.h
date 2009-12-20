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
 @brief Transform the state into its successor.
 
 This move is guaranteed to have been returned by the legalMoves method for this state.
 */
- (void)performLegalMove:(id)move;

/**
 @brief Reverts the state back to its successor.
 
 The move passed in will be the last move passed to performLegalMove: for this state.
 */
- (void)undoLegalMove:(id)move;

/**
 @brief Returns an array of legal moves.
 
 These will be used to translate the state into valid successor states.
 If passing is allowed in your game it is your responsibility to return a pass move from this method.
 */
- (NSArray*)legalMoves;

/**
 @brief Return the fitness score of a particular state.
 
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
