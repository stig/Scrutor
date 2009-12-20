//
//  SingleMoveOptimisationDecorator.h
//  Scrutor
//
//  Created by Hubbie on 20/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchStrategy.h"

@interface SingleMoveOptimisationDecorator : NSObject < SearchStrategy > {
    id<SearchStrategy> _underlyingStrategy;
}

@property (copy) id<SearchStrategy> underlyingStrategy;

@end
