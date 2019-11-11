//
//  DZArtist.h
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZArtist : NSObject
@property (nonatomic, readonly) NSUInteger artistId;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSURL *smallImageURL;
@property (nonatomic, strong, readonly) NSURL *largeImageURL;

- (instancetype)initWithJson:(NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
