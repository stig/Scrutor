/*
 Copyright (c) 2009, Stig Brautaset.
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:
 
 Redistributions of source code must retain the above copyright notice,
 this list of conditions and the following disclaimer.

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

#import "AbstractStub.h"

@implementation AbstractStub

@synthesize path = _path;
@synthesize countOfVisited = _countOfVisited;
@synthesize maxPlyVisited = _maxPlyVisited;

#pragma mark -

- (id)init {
    if (self = [super init])
        self.path = @"";
    return self;
}

#pragma mark -

- (id)copyWithZone:(NSZone *)zone {
    AbstractStub *copy = [[self class] new];
    copy.path = self.path;
    copy->_tree = [_tree copy];
    return copy;
}

#pragma mark -

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
    
    return moves;
}

- (void)performLegalMove:(id)move {    
    _countOfVisited++;
    self.path = [self.path stringByAppendingPathComponent:move];
    
    // Count path components to record the deepest path we see
    _maxPlyVisited = MAX(_maxPlyVisited, [[self.path pathComponents] count]);
}

- (void)undoLegalMove:(id)move {
    self.path = [self.path stringByDeletingLastPathComponent];
}

- (NSInteger)fitness {
    return [[_tree objectForKey:self.path] integerValue];
}

@end
