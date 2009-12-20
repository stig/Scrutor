//
//  CopyStateDecorator.m
//  Scrutor
//
//  Created by Hubbie on 20/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "CopyStateDecorator.h"


@implementation CopyStateDecorator

- (id)moveFromState:(id<SearchStrategyDelegate>)delegate {
    id copy = [delegate copy];
    id move = [self.underlyingStrategy moveFromState:copy];
    [copy release];
    return move;
}


@end
