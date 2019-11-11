//
//  DeezerAPIClient.h
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZArtist.h"
#import "DZAlbum.h"
#import "DZTrack.h"

NS_ASSUME_NONNULL_BEGIN

@interface DZAPIClient : NSObject

+ (void)searchKeywords:(NSString *)keywords
            completion:(void(^)(NSArray<DZArtist *> * _Nullable, NSError * _Nullable))completionBlock;

+ (void)albumsForArtist:(NSUInteger)artistId
             completion:(void(^)(NSArray<DZAlbum *> * _Nullable, NSError * _Nullable))completionBlock;

+ (void)tracksForAlbum:(NSUInteger)albumId
            completion:(void(^)(NSArray<DZTrack *> * _Nullable, NSError * _Nullable))completionBlock;

@end

NS_ASSUME_NONNULL_END
