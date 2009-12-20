//
//  AbstractFoo.m
//  Scrutor
//
//  Created by Hubbie on 22/11/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "AbstractStub.h"

@implementation AbstractStub

- (id)init {
    if (self = [super init])
        self.path = @"";
    return self;
}

- (NSArray*)candidates {
    return [@"A B C" componentsSeparatedByString:@" "];
}

- (NSArray*)legalMoves {
    NSMutableArray *moves = [NSMutableArray array];
    for (NSString *m in [self candidates]) {
        NSString *path = [self.path stringByAppendingPathComponent:m];
        
        if ([_tree objectForKey:path])
            [moves addObject:m];
    
    }

//    NSLog(@"Path: %@, Moves: %@", self.path, moves);
    
    return moves;
}

- (void)performLegalMove:(id)move {

//    NSLog(@"Path: %@, Move: %@", self.path, move);
    
    _countOfVisited++;
    self.path = [self.path stringByAppendingPathComponent:move];
    
    // Count path components to record the deepest path we see
    _maxPlyVisited = MAX(_maxPlyVisited, [[self.path pathComponents] count]);
}

- (void)undoLegalMove:(id)move {
    self.path = [self.path stringByDeletingLastPathComponent];
}

- (NSInteger)fitness {
    NSInteger fitness = [[_tree objectForKey:self.path] integerValue];
    
//    NSLog(@"Path: %@, Fitness: %d", self.path, fitness);
    
    return fitness;
}

@synthesize path = _path;
@synthesize countOfVisited = _countOfVisited;
@synthesize maxPlyVisited = _maxPlyVisited;

@end
