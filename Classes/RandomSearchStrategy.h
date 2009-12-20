//
//  SBRandomSearch.h
//  Phage
//
//  Created by Stig Brautaset on 28/10/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchStrategy.h"

/**
 A search strategy that simply picks one of the legal moves at random.
 */
@interface RandomSearchStrategy : NSObject < SearchStrategy >
@end
