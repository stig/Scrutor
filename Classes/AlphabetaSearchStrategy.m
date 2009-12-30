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

#import "AlphabetaSearchStrategy.h"


@implementation AlphabetaSearchStrategy

@synthesize maxPly = _maxPly;

#pragma mark -

- (id)initWithCoder:(NSCoder *)aDecoder {
    self.maxPly = [aDecoder decodeIntegerForKey:@"maxPly"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.maxPly forKey:@"maxPly"];
}

#pragma mark -

- (id)copyWithZone:(NSZone *)zone {
    AlphabetaSearchStrategy *copy = [[self class] new];
    copy.maxPly = self.maxPly;
    return copy;
}

- (BOOL)isEqual:(id)object {
    if (![self isMemberOfClass:[object class]])
        return NO;
    AlphabetaSearchStrategy *o = object;
    return _maxPly == o.maxPly;
}    

#pragma mark -

- (NSInteger)fitnessWithState:(id<SBGameTreeNode>)state alpha:(NSInteger)alpha beta:(NSInteger)beta plyLeft:(NSUInteger)plyLeft {
	NSParameterAssert(state);
    
	if (!plyLeft)
		return [state fitness];
    
    NSArray *moves = [state legalMoves];
    if (!moves.count)
        return [state fitness];
    
    for (id m in moves) {
        [state performLegalMove:m];
        
        NSInteger sc = -[self fitnessWithState:state alpha:-beta beta:-alpha plyLeft:plyLeft-1];
        if (sc > alpha)
            alpha = sc;
        
        [state undoLegalMove:m];
        
        if (beta != INT_MIN && alpha > beta)
            break;
    }
    
    return alpha;
}


- (id)moveFromState:(id<SBGameTreeNode>)state {
	NSParameterAssert(state);
    
    id bestMove = nil;
    NSInteger alpha = INT_MIN;
    
    for (id m in [state legalMoves]) {
        NSAutoreleasePool *pool = [NSAutoreleasePool new];
        [state performLegalMove:m];
        
        NSInteger sc = -[self fitnessWithState:state alpha:INT_MIN beta:-alpha plyLeft:self.maxPly-1];        
        if (sc > alpha) {
            alpha = sc;
            bestMove = m;
        }
        
        [state undoLegalMove:m];
        [pool drain];
    }
    
    return bestMove;
}


@end
