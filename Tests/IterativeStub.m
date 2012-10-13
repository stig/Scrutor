/*
 Copyright (c) 2009, Stig Brautaset.
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:
 
   Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
  
   Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
 
   Neither the name of the the author nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

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
            [tree setObject:@(score) forKey:node];
        }
                
        _tree = [tree copy];
        
    }
    return self;
}



@end
