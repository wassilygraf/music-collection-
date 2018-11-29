//
//  Song.m
//  Objective-C
//
//  Created by Wassily Graf on 06/03/2017.
//  Copyright © 2017 Wassily Graf. All rights reserved.
//

#import "Song.h"

@implementation Song
@synthesize title, artist, album, playingTime;

+(id) songWithTitle: (NSString *) theTitle artist: (NSString *) theArtist album: (NSString *) theAlbum andPlayingTime: (NSString *) thePlayingTime
{
    Song *newSong = [[Song alloc] initWithTitle:theTitle artist:theArtist album:theAlbum andPlayingTime:thePlayingTime];
    return newSong;
}

-(id) initWithTitle: (NSString *) theTitle artist: (NSString *) theArtist album: (NSString *) theAlbum andPlayingTime: (NSString *) thePlayingTime
{
    self = [super self];
    if(self)
    {
        [self setTitle:theTitle artist:theArtist album:theAlbum andPlayingTime:thePlayingTime];
    }
    
    return self;
}

-(id) init
{
    NSString *defaultContent = [NSString stringWithFormat:@"not specified"];
    return [self initWithTitle:defaultContent artist:defaultContent album:defaultContent andPlayingTime:defaultContent];
}

-(void) setTitle: (NSString *) theTitle artist: (NSString *) theArtist album: (NSString *) theAlbum andPlayingTime: (NSString *) thePlayingTime
{
    title = [NSString stringWithString:theTitle];
    artist = [NSString stringWithString:theArtist];
    album = [NSString stringWithString:theAlbum];
    playingTime = [NSString stringWithString:thePlayingTime];
}

-(NSMutableArray *) makeSearchKeys
{
    NSMutableArray *searchKeys = [NSMutableArray arrayWithObjects:title, artist, album, playingTime, nil];
    return searchKeys;
}

-(NSString *) description
{
    NSString *displayFormat = [NSString stringWithFormat:@"'%@' by %@ in '%@' | playing time is: %@", title, artist, album, playingTime];
    
    return displayFormat;
}

-(void) print
{
    NSLog(@"'%@' by %@ in '%@' | playing time is: %@", title, artist, album, playingTime);
}
@end

