//
//  NegamaxSearchStrategy.h
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchStrategy.h"

/**
 A strategy implementing the Negamax algorithm.
 
 @see http://en.wikipedia.org/wiki/Negamax
 */
@interface NegamaxSearchStrategy : NSObject < SearchStrategy > {
@private
    NSUInteger _maxPly;
}

/**
 The maximum ply for searching.
 */
@property NSUInteger maxPly;

@end
