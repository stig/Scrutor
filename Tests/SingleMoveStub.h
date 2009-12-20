//
//  SingleMoveStub.h
//  Scrutor
//
//  Created by Hubbie on 20/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "SearchStrategy.h"

@interface SingleMoveStub : NSObject < SearchStrategyDelegate > {
    NSUInteger _callCount;
}

@property (readonly) NSUInteger callCount;

@end