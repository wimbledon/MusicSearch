//
//  NSArray+Utility.h
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Utility)

- (NSArray *)arrayByManipulationBlock:(id(^)(id obj, NSUInteger ind))manipulationBlock;

@end

NS_ASSUME_NONNULL_END
