//
//  SearchStrategyDecorator.h
//  Scrutor
//
//  Created by Hubbie on 20/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "SearchStrategy.h"

/**
 Abstract class to aid implementation of decorators.
 
 Decorators can be chained.
 
 @see http://en.wikipedia.org/wiki/Decorator_pattern
 */
@interface AbstractDecorator : NSObject < SearchStrategy > {
    id<SearchStrategy> _underlyingStrategy;
}

@property (copy) id<SearchStrategy> underlyingStrategy;

@end
