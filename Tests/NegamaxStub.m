/*
 Copyright (c) 2009, Stig Bratuaset.
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

#import "NegamaxStub.h"


@implementation NegamaxStub


- (id)init {
    if (self = [super init]) {
        _tree = [NSDictionary dictionaryWithObjectsAndKeys:
                 
                 // Ply 1
                 @"-2",  @"A",
                 @"4",   @"B",
                 
                 // Ply 2
                 @"16",  @"A/A",
                 @"-27", @"A/B",
                 
                 @"-46", @"B/A",
                 @"-6",  @"B/B",
                 
                 // Ply 3
                 @"32",  @"A/A/A",
                 @"-48", @"A/A/B",
                 
                 @"43",  @"A/B/A",
                 @"42",  @"A/B/B",
                 
                 @"28",  @"B/A/A",
                 @"20",  @"B/A/B",
                 
                 @"6",   @"B/B/A",
                 @"15",  @"B/B/B",
                 
                 // Ply 4
                 @"32",  @"A/A/A/A",
                 @"43",  @"A/A/A/B",
                 
                 @"37",  @"A/A/B/A",
                 @"29",  @"A/A/B/B",
                 
                 @"-44", @"A/B/A/A",
                 @"-45", @"A/B/A/B",
                 
                 @"13",  @"A/B/B/A",
                 @"41",  @"A/B/B/B",
                 
                 @"-28", @"B/A/A/A",
                 @"-10", @"B/A/A/B",
                 
                 @"-3",  @"B/A/B/A",
                 @"16",  @"B/A/B/B",
                 
                 @"-8",  @"B/B/A/A",
                 @"23",  @"B/B/A/B",
                 
                 @"11",  @"B/B/B/A",
                 @"-22", @"B/B/B/B",
                 
                 // Ply 5
                 @"-43", @"A/A/A/A/A",
                 @"30",  @"A/A/A/A/B",
                 
                 @"46",  @"A/A/A/B/A",
                 @"9",   @"A/A/A/B/B",
                 
                 @"10",  @"A/A/B/A/A",
                 @"-33", @"A/A/B/A/B",
                 
                 @"33",  @"A/A/B/B/A",
                 @"13",  @"A/A/B/B/B",
                 
                 @"-16", @"A/B/A/A/A",
                 @"5",   @"A/B/A/A/B",
                 
                 @"21",  @"A/B/A/B/A",
                 @"-6",  @"A/B/A/B/B",
                 
                 @"-40", @"A/B/B/A/A",
                 @"-44", @"A/B/B/A/B",
                 
                 @"-2",  @"A/B/B/B/A",
                 @"-4",  @"A/B/B/B/B",
                 
                 @"-10", @"B/A/A/A/A",
                 @"48",  @"B/A/A/A/B",
                 
                 @"-4",  @"B/A/A/B/A",
                 @"-46", @"B/A/A/B/B",
                 
                 @"-12", @"B/A/B/A/A",
                 @"-3",  @"B/A/B/A/B",
                 
                 @"-33", @"B/A/B/B/A",
                 @"2",   @"B/A/B/B/B",
                 
                 @"-46", @"B/B/A/A/A",
                 @"2",   @"B/B/A/A/B",
                 
                 @"38",  @"B/B/A/B/A",
                 @"-14", @"B/B/A/B/B",
                 
                 @"5",   @"B/B/B/A/A",
                 @"-29", @"B/B/B/A/B",
                 
                 @"-26", @"B/B/B/B/A",
                 @"16",  @"B/B/B/B/B",
                 
                 nil];
        
    }
    return self;
}
@end
