//
//  AlphabetaSearchStrategy.h
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchStrategy.h"

@interface AlphabetaSearchStrategy : NSObject < SearchStrategy > {
    NSUInteger _maxPly;
}

@property NSUInteger maxPly;

@end