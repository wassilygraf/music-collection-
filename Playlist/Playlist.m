//
//  Playlist.m
//  Objective-C
//
//  Created by Wassily Graf on 06/03/2017.
//  Copyright © 2017 Wassily Graf. All rights reserved.
//

#import "Playlist.h"
static int gCounter;
@implementation Playlist
@synthesize name, songList;

+(id) playlistWithName: (NSString *) theName
{
    Playlist *newPlaylist = [[Playlist alloc] initWithName:theName];
    return newPlaylist;
}

-(id) initWithName: (NSString *) theName
{
    self = [super init];
    
    if(self)
    {
        songList = [[NSMutableArray alloc] init];
        [self setName:theName];
    }
    ++gCounter;
    return self;
}

-(id) init
{

    
    NSString *defaultName = [NSString stringWithFormat:@"Playlist%i", gCounter];
    return [self initWithName:defaultName];
}

-(void) setName:(NSString *)theName
{
    name = [NSString stringWithString:theName];
}

-(void) addSong:(Song *)theSong
{
    [songList addObject:theSong];
}

-(void) removeSongFromPlaylist:(Song *)theSong
{
    [songList removeObject:theSong];
}

-(NSString *) description
{
    NSMutableString * displayFormat = [NSMutableString stringWithFormat:@"\n============== %30@ ==============\n", name];
    
    for(Song * nextSong in songList)
        [displayFormat appendFormat:@"- %@\n", nextSong];
    
    [displayFormat appendFormat:@"=========================================="];
    
    return displayFormat;
}

-(void) list
{
    NSLog(@"========== %-20@ ==========\n", name);
    
    for(Song * nextSong in songList)
        NSLog(@"- %@\n", nextSong);
    
    NSLog(@"==========================================");
}

@end



















































