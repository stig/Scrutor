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
  
 @see http://en.wikipedia.org/wiki/Decorator_pattern
 */
@interface AbstractDecorator : NSObject < SearchStrategy > {
    
@private
    id<SearchStrategy> _underlyingStrategy;
}

/**
 Property holding the underlying strategy of this decorator.
 This could of course be another decorator. (Decorators are chainable.)
 */
@property (copy) id<SearchStrategy> underlyingStrategy;

@end
