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

#import "NegamaxStub.h"


@implementation NegamaxStub


- (id)init {
    if (self = [super init]) {
        _tree = @{@"A": @"-2",
                 @"B": @"4",
                 
                 // Ply 2
                 @"A/A": @"16",
                 @"A/B": @"-27",
                 
                 @"B/A": @"-46",
                 @"B/B": @"-6",
                 
                 // Ply 3
                 @"A/A/A": @"32",
                 @"A/A/B": @"-48",
                 
                 @"A/B/A": @"43",
                 @"A/B/B": @"42",
                 
                 @"B/A/A": @"28",
                 @"B/A/B": @"20",
                 
                 @"B/B/A": @"6",
                 @"B/B/B": @"15",
                 
                 // Ply 4
                 @"A/A/A/A": @"32",
                 @"A/A/A/B": @"43",
                 
                 @"A/A/B/A": @"37",
                 @"A/A/B/B": @"29",
                 
                 @"A/B/A/A": @"-44",
                 @"A/B/A/B": @"-45",
                 
                 @"A/B/B/A": @"13",
                 @"A/B/B/B": @"41",
                 
                 @"B/A/A/A": @"-28",
                 @"B/A/A/B": @"-10",
                 
                 @"B/A/B/A": @"-3",
                 @"B/A/B/B": @"16",
                 
                 @"B/B/A/A": @"-8",
                 @"B/B/A/B": @"23",
                 
                 @"B/B/B/A": @"11",
                 @"B/B/B/B": @"-22",
                 
                 // Ply 5
                 @"A/A/A/A/A": @"-43",
                 @"A/A/A/A/B": @"30",
                 
                 @"A/A/A/B/A": @"46",
                 @"A/A/A/B/B": @"9",
                 
                 @"A/A/B/A/A": @"10",
                 @"A/A/B/A/B": @"-33",
                 
                 @"A/A/B/B/A": @"33",
                 @"A/A/B/B/B": @"13",
                 
                 @"A/B/A/A/A": @"-16",
                 @"A/B/A/A/B": @"5",
                 
                 @"A/B/A/B/A": @"21",
                 @"A/B/A/B/B": @"-6",
                 
                 @"A/B/B/A/A": @"-40",
                 @"A/B/B/A/B": @"-44",
                 
                 @"A/B/B/B/A": @"-2",
                 @"A/B/B/B/B": @"-4",
                 
                 @"B/A/A/A/A": @"-10",
                 @"B/A/A/A/B": @"48",
                 
                 @"B/A/A/B/A": @"-4",
                 @"B/A/A/B/B": @"-46",
                 
                 @"B/A/B/A/A": @"-12",
                 @"B/A/B/A/B": @"-3",
                 
                 @"B/A/B/B/A": @"-33",
                 @"B/A/B/B/B": @"2",
                 
                 @"B/B/A/A/A": @"-46",
                 @"B/B/A/A/B": @"2",
                 
                 @"B/B/A/B/A": @"38",
                 @"B/B/A/B/B": @"-14",
                 
                 @"B/B/B/A/A": @"5",
                 @"B/B/B/A/B": @"-29",
                 
                 @"B/B/B/B/A": @"-26",
                 @"B/B/B/B/B": @"16"};
        
    }
    return self;
}
@end
