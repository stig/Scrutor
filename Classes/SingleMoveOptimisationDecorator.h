//
//  SingleMoveOptimisationDecorator.h
//  Scrutor
//
//  Created by Hubbie on 20/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//


#import "AbstractDecorator.h"

/**
 This decorator is useful to make sure we do not waste time searching
 deep into a tree if there is only a single legal move at the top level.
 */
@interface SingleMoveOptimisationDecorator : AbstractDecorator
@end
