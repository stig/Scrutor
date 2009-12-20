//
//  SearchStrategy.h
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol SearchStrategyDelegate < NSObject >

- (void)performLegalMove:(id)move;
- (void)undoLegalMove:(id)move;
- (NSArray*)legalMoves;
- (NSInteger)fitness;

@end


@protocol SearchStrategy < NSObject, NSCopying, NSCoding >

- (id)moveFromState:(id<SearchStrategyDelegate>)state;

@end
