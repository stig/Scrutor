//
//  CopyStateDecorator.h
//  Scrutor
//
//  Created by Hubbie on 20/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "AbstractDecorator.h"

/**
 This decorator is useful if you have observers of the original state and
 don't want it to be temporarily modified during the search for a best move.
 
 In addition to the SearchStrategyDelegate protocol, your states must
 implement the NSCopying protocol to use this decorator.
 */
@interface CopyStateDecorator : AbstractDecorator
@end
