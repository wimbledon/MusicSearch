//
//  DZTrack.h
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZTrack : NSObject

@property (nonatomic, readonly) NSUInteger trackId;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *subtitle;
@property (nonatomic, readonly) NSUInteger position;
@property (nonatomic, readonly) NSTimeInterval duration;
@property (nonatomic, strong, readonly) NSURL *previewURL;

- (instancetype)initWithJson:(NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
