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
        for (NSString *m in [NSArray arrayWithObjects:@"A", @"B", @"C", nil]) {
            NSString *path = [parent stringByAppendingPathComponent:m];
            [successors addObject:path];
        }
    }
    return successors;
}

- (id)init {
    if (self = [super init]) {
        
        NSArray *nodes = [self candidates];
        for (int ply = 0; ply < 5; ply++) {
            nodes = [nodes arrayByAddingObjectsFromArray:[self successors:nodes]];
            NSLog(@"ply %d", ply);
        }
        
        NSMutableDictionary *tree = [_tree mutableCopy];
        for (NSString *node in nodes) {
            NSInteger spread = 1e5;
            NSInteger score = (random() / spread) - (spread / 2);
            [tree setObject:[NSNumber numberWithInteger:score] forKey:node];
        }
        
        _tree = [tree copy];
        
    }
    return self;
}



@end
