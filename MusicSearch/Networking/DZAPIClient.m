//
//  DeezerAPIClient.m
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

#import "DZAPIClient.h"
#import "NSArray+Utility.h"

@implementation DZAPIClient

+ (void)searchKeywords:(NSString *)keywords
            completion:(void (^)(NSArray<DZArtist *> * _Nullable, NSError * _Nullable))completionBlock
{
    NSString *urlStr = [NSString stringWithFormat:@"http://api.deezer.com/search/artist?q=%@", keywords];
    [DZAPIClient _fetchURL:urlStr
                modelClass:DZArtist.class
                completion:completionBlock];
}

+ (void)albumsForArtist:(NSUInteger)artistId
             completion:(void(^)(NSArray<DZAlbum *> * _Nullable, NSError * _Nullable))completionBlock
{
    NSString *urlStr = [NSString stringWithFormat:@"http://api.deezer.com/artist/%lu/albums", artistId];
    [DZAPIClient _fetchURL:urlStr
                modelClass:DZAlbum.class
                completion:completionBlock];
}

+ (void)tracksForAlbum:(NSUInteger)albumId
             completion:(void(^)(NSArray<DZTrack *> * _Nullable, NSError * _Nullable))completionBlock
{
    NSString *urlStr = [NSString stringWithFormat:@"http://api.deezer.com/album/%lu/tracks", albumId];
    [DZAPIClient _fetchURL:urlStr
                modelClass:DZTrack.class
                completion:completionBlock];
}

+ (void)_fetchURL:(NSString *)urlStr
       modelClass:(Class)modelClass
       completion:(void(^)(NSArray * _Nullable, NSError * _Nullable))completionBlock
{
    NSURL *url = [NSURL URLWithString:urlStr];
    [[NSURLSession.sharedSession dataTaskWithURL:url
                               completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completionBlock(nil, error);
        }
        else {
            NSError *err;
            NSDictionary *jsonResult = [NSJSONSerialization JSONObjectWithData:data
                                                                       options:NSJSONReadingAllowFragments
                                                                         error:&err];
            if (err) {
                completionBlock(nil, err);
            }
            else {
                NSArray<DZArtist *> *artists = [jsonResult[@"data"] arrayByManipulationBlock:^id _Nonnull(NSDictionary * _Nonnull json, NSUInteger ind) {
                    return [[modelClass alloc] initWithJson:json];
                }];
                
                completionBlock(artists, nil);
            }
        }
    }] resume];
}

@end
