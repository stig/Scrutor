//
//  IterativeAlphabetaSearchStrategy.h
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchStrategy.h"

/**
 A strategy implementing Iterative Deepening Negamax with Alpha-beta pruning.
 
 @see http://en.wikipedia.org/wiki/Iterative_deepening_depth-first_search
 */
@interface IterativeAlphabetaSearchStrategy : NSObject < SearchStrategy > {
    NSTimeInterval _timeInterval;
    BOOL _foundEnd;

@private
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
