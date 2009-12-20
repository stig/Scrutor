//
//  SingleMoveOptimisationDecorator.m
//  Scrutor
//
//  Created by Hubbie on 20/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "SingleMoveOptimisationDecorator.h"


@implementation SingleMoveOptimisationDecorator

- (id)moveFromState:(id<SearchStrategyDelegate>)state {
    NSArray *moves = [state legalMoves];
    if (!moves.count || moves.count == 1u)
        return [moves lastObject];
    
    return [self.underlyingStrategy moveFromState:state];
}

@end
