//
//  DZAlbum.m
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

#import "DZAlbum.h"

@implementation DZAlbum

- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        _albumId = [json[@"id"] integerValue];
        _title = json[@"title"];
        _smallImageURL = [NSURL URLWithString:json[@"cover_small"]];
        _largeImageURL = [NSURL URLWithString:json[@"cover_big"]];
    }
    return self;
}

@end
