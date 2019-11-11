//
//  DZAlbum.h
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DZAlbum : NSObject

@property (nonatomic, readonly) NSUInteger albumId;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSURL *smallImageURL;
@property (nonatomic, strong, readonly) NSURL *largeImageURL;
@property (nonatomic, strong, readonly) NSURL *trackList;

- (instancetype)initWithJson:(NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
