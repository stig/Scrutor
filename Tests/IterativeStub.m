//
//  WideStub.m
//  Scrutor
//
//  Created by Hubbie on 19/12/2009.
//  Copyright 2009 Stig Brautaset. All rights reserved.
//

#import "IterativeStub.h"


@implementation IterativeStub

- (NSArray*)successors:(NSArray*)parents {
    NSMutableArray *successors = [NSMutableArray array];
    for (NSString *parent in parents) {
        for (NSString *m in self.candidates) {
            NSString *path = [parent stringByAppendingPathComponent:m];
            [successors addObject:path];
        }
    }
    return successors;
}

- (id)init {
    if (self = [super init]) {
        
        NSMutableArray *nodes = [self.candidates mutableCopy];
        for (int ply = 0; ply < 9; ply++) {
            [nodes addObjectsFromArray:[self successors:nodes]];
             NSLog(@"Ply %u Got %u nodes", ply, nodes.count);
        }
        
        NSMutableDictionary *tree = [NSMutableDictionary dictionaryWithCapacity:nodes.count];
        for (NSString *node in nodes) {
            NSInteger spread = 1e5;
            NSInteger score = (random() % spread) - (spread / 2);
            [tree setObject:[NSNumber numberWithInteger:score] forKey:node];
        }
                
        _tree = [tree copy];
        
    }
    return self;
}



@end
