//
//  DZTrack.m
//  MusicSearch
//
//  Created by Alex Sanchetz on 2019-11-10.
//  Copyright © 2019 Tida. All rights reserved.
//

#import "DZTrack.h"

@implementation DZTrack

- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        _trackId = [json[@"id"] integerValue];
        _title = json[@"title_short"];
        _subtitle = json[@"title_version"];
        _position = [json[@"track_position"] integerValue];
        _duration = [json[@"duration"] doubleValue];
        _previewURL = [NSURL URLWithString:json[@"preview"]];
    }
    return self;
}

@end
