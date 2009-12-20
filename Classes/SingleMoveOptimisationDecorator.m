//
//  SingleMoveOptimisationDecorator.m
//  Scrutor
//
//  Created by Hubbie on 20/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "SingleMoveOptimisationDecorator.h"


@implementation SingleMoveOptimisationDecorator

@synthesize underlyingStrategy = _underlyingStrategy;

#pragma mark -

- (id)initWithCoder:(NSCoder *)aDecoder {
    self.underlyingStrategy = [aDecoder decodeObjectForKey:@"underlyingStrategy"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.underlyingStrategy forKey:@"underlyingStrategy"];
}

#pragma mark -

- (id)copyWithZone:(NSZone *)zone {
    SingleMoveOptimisationDecorator *copy = [[self class] new];
    copy.underlyingStrategy = self.underlyingStrategy;
    return copy;
}

- (BOOL)isEqual:(id)object {
    if (![self isKindOfClass:[object class]])
        return NO;
    
    SingleMoveOptimisationDecorator *o = object;
    return [self.underlyingStrategy isEqual:o.underlyingStrategy];
}

#pragma mark -

- (id)moveFromState:(id<SearchStrategyDelegate>)state {
    NSArray *moves = [state legalMoves];
    if (!moves.count || moves.count == 1u)
        return [moves lastObject];
    
    return [self.underlyingStrategy moveFromState:state];
}

@end
