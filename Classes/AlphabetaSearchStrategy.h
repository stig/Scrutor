//
//  AlphabetaSearchStrategy.h
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchStrategy.h"

/**
 A strategy implementing Negamax with Alpha-beta pruning.
 
 @see http://en.wikipedia.org/wiki/Alpha-beta_pruning
 */
@interface AlphabetaSearchStrategy : NSObject < SearchStrategy > {
    NSUInteger _maxPly;
}

/**
 The maximum ply (depth) to search to.
 */
@property NSUInteger maxPly;

@end
