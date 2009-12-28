/*
 Copyright (c) 2009, Stig Brautaset.
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

#import <Foundation/Foundation.h>

/**
 @brief Protocol for states to implement.
 
 You must implement this protocol in your states to make them
 searchable by the various search strategies provided by Scrutor.
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
 @brief Protocol for concrete search strategies.
 
 You can create your own strategies implementing this protocol
 and plug them in alongside the ones provided here.
 */
@protocol SearchStrategy < NSObject, NSCopying, NSCoding >

/**
 Returns the best move found for this state.
 */
- (id)moveFromState:(id<SearchStrategyDelegate>)state;

@end
