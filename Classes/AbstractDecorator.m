//
//  SearchStrategyDecorator.m
//  Scrutor
//
//  Created by Hubbie on 20/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "AbstractDecorator.h"


@implementation AbstractDecorator

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
    AbstractDecorator *copy = [[self class] new];
    copy.underlyingStrategy = self.underlyingStrategy;
    return copy;
}

- (BOOL)isEqual:(id)object {
    if (![self isKindOfClass:[object class]])
        return NO;
    
    AbstractDecorator *o = object;
    return [self.underlyingStrategy isEqual:o.underlyingStrategy];
}

#pragma mark -

- (id)moveFromState:(id<SearchStrategyDelegate>)state {
    NSAssert1(0, @"You must override %s in your decorator subclass", _cmd);
}

@end
