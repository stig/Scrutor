//
//  AlphabetaSearchStrategyTest.h
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class NegamaxStub;
@class AlphabetaSearchStrategy;

@interface AlphabetaSearchStrategyTest : SenTestCase {
    NegamaxStub *stub;
    AlphabetaSearchStrategy *strategy;
}

@end
