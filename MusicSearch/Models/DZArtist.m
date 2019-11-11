//
//  DZArtist.m
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

#import "DZArtist.h"

@implementation DZArtist

- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        _artistId = [json[@"id"] integerValue];
        _name = json[@"name"];
        _smallImageURL = [NSURL URLWithString:json[@"picture_small"]];
        _largeImageURL = [NSURL URLWithString:json[@"picture_big"]];
    }
    return self;
}

@end
