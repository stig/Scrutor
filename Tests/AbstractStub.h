//
//  AbstractStub.h
//  Scrutor
//
//  Created by Hubbie on 22/11/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchStrategy.h"

@interface AbstractStub : NSObject < SearchStrategyDelegate > {

    NSString *_path;
    NSDictionary *_tree;

    NSUInteger _maxPlyVisited;
    NSUInteger _countOfVisited;
}

@property (copy) NSString *path;
@property NSUInteger countOfVisited;
@property NSUInteger maxPlyVisited;

@property (readonly) NSArray* candidates;

@end
