//
//  NSArray+Utility.m
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

#import "NSArray+Utility.h"

@implementation NSArray (Utility)

- (NSArray *)arrayByManipulationBlock:(id(^)(id obj, NSUInteger ind))manipulationBlock
{
    if (self.count) {
        NSMutableArray *ma = [NSMutableArray arrayWithCapacity:self.count];
        for (NSUInteger i = 0; i < self.count; i++) {
            id mObj = manipulationBlock(self[i], i);
            if (mObj) {
                [ma addObject:mObj];
            }
        }
        return [NSArray arrayWithArray:ma];
    }
    return nil;
}

@end
