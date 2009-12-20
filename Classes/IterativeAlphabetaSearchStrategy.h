//
//  IterativeAlphabetaSearchStrategy.h
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchStrategy.h"

@interface IterativeAlphabetaSearchStrategy : NSObject < SearchStrategy > {
    NSTimeInterval _timeInterval;
    NSDate *_cutOffDate;
    BOOL _foundEnd;
}

@property NSTimeInterval timeInterval;

@end
