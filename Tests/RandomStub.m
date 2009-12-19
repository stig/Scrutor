//
//  RandomStub.m
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "RandomStub.h"


@implementation RandomStub

- (NSArray*)legalMoves {
    return [@"A B C D E F G H I J K L M N O P Q R S T U V W X Y Z" componentsSeparatedByString:@" "];
}
        

- (NSInteger)fitness {
    @throw @"fitness";
}

- (void)unsafePerformMove:(id)move {
    @throw @"performMove";
}

- (void)unsafeUndoMove:(id)move {
    @throw @"undoMove";
}    

@end
