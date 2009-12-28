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
#import "SearchStrategy.h"

/**
 @brief Iterative deepening Negamax with Alpha-beta pruning.
 
 Similar to AlphabetaSearchStrategy but allows you to set a time limit
 rather than a fixed-depth limit.
 
 @see http://en.wikipedia.org/wiki/Iterative_deepening_depth-first_search
 */
@interface IterativeAlphabetaSearchStrategy : NSObject < SearchStrategy > {
@private
    NSTimeInterval _timeInterval;
    BOOL _foundEnd;
    NSDate *_cutOffDate;
}

/**
 The maximum time interval to allow for the search.
 */
@property NSTimeInterval timeInterval;

/**
 If true, the previous search ended because a leaf node was reached on every branch that was not pruned.
 */
@property (readonly) BOOL foundEnd;

@end
