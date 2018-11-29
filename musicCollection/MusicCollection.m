//
//  MusicCollection.m
//  Objective-C
//
//  Created by Wassily Graf on 06/03/2017.
//  Copyright © 2017 Wassily Graf. All rights reserved.
//

#import "MusicCollection.h"
static int gCollectionCounter;

@implementation MusicCollection
@synthesize name, playLists, library;

+(id) musicCollectionWithName: (NSString *) theName
{

    MusicCollection *newMusicCollection = [[MusicCollection alloc] initWithName:theName];
    return newMusicCollection;
}

-(id) initWithName: (NSString *) theName
{
    ++gCollectionCounter;
    self = [super init];
    
    if(self)
    {
        playLists = [NSMutableArray array];
        library   = [NSMutableArray array];
        [self setName:theName];
    }
    
    return self;
}

-(id) init
{
    NSString *defaultName = [NSString stringWithFormat:@"Music_Collection%i", gCollectionCounter];
    return [self initWithName:defaultName];
}

-(void) setName:(NSString *)theName
{
    name = [NSString stringWithString:theName];
}


-(BOOL) addNewSong: (Song *) theSong
{
    if(![library containsObject:theSong])
    {
        [library addObject:theSong];
        return YES;
    }
    
    else
    {
        NSLog(@"This song was not added! A reference of this song is already located in the library!");
        return NO;
    }
}

-(BOOL) addNewSong:(Song *)theSong toNewPlaylist:(Playlist *) thePlaylist
{
    //int x = 1;
    if(![library containsObject:theSong])
    {
        if(![playLists containsObject:thePlaylist])
            [playLists addObject:thePlaylist];
        [[playLists objectAtIndex:[self fetchPlaylistIndexFromReference:thePlaylist]] addSong:theSong];
        [library addObject:theSong];
        return YES;
    }
    else
        return NO;
}
    
    
#ifdef addxisting
-(BOOL) addExistingSong:(Song *)theSong toPlaylist:(Playlist *) thePlaylist
{
    
}
#endif

         
-(BOOL) addPlaylist:(Playlist *)thePlaylist
{
    if([playLists containsObject:thePlaylist] || [self containsPlaylistWithName:[thePlaylist name]])
    {
        NSLog(@"A playlist with this name exists already!");
        return NO;
    }
    
    else
    {
        [playLists addObject:thePlaylist];
        return YES;
    }
}

-(id) createPlaylistWithName:(NSString *)theName
{
    if(![self containsPlaylistWithName:theName])
    {
        Playlist *newPlaylist = [Playlist playlistWithName:theName];
        [playLists addObject:newPlaylist];
    
        return newPlaylist;
    }
    else
    {
        NSLog(@"A playlist with this name exists already! Please choose a different name!");
    
        return nil;
    }
}


-(BOOL) removePlaylist: (Playlist *) thePlaylist
{
    if([playLists containsObject:thePlaylist]) {
        [[self playLists] removeObject:thePlaylist];
        return YES;
    }
    
    else
    {
        NSLog(@"No Playlist with such a name found");
        return NO;
    }
}

-(BOOL) removePlaylistWithName: (NSString *) theName
{
    if([self containsPlaylistWithName:theName]) {
        [playLists removeObjectAtIndex:[self fetchPlaylistIndexFromString:theName]];
        return YES;
    }
    
    else
    {
        NSLog(@"No Playlist with such a name found");
        return NO;
    }
}

-(BOOL) containsPlaylistWithName: (NSString *) theName
{
    NSUInteger result = [playLists indexOfObjectPassingTest:^(id obj, NSUInteger idx, BOOL *stop)
                          {
                              if ([[obj name] compare:theName] == NSOrderedSame)
                                  return YES;
                              else
                                  return NO;
                          }];
    
    if(result)
        return NO;
    else
        return YES;
}

-(NSUInteger) fetchPlaylistIndexFromString:(NSString *)theName
{
    NSInteger indexNumber = [playLists indexOfObjectPassingTest:^(id obj, NSUInteger idx, BOOL *stop)
                             {
                                 if([[obj name] compare: theName] == NSOrderedSame)
                                     return YES;
                                 else
                                     return NO;
                             }];
    
    return indexNumber;
}

-(NSUInteger) fetchPlaylistIndexFromReference:(id) thePlaylist
{
    NSInteger indexNumber = [playLists indexOfObjectPassingTest:^(id obj, NSUInteger idx, BOOL *stop)
                             {
                                 if([obj isEqual: thePlaylist])
                                     return YES;
                                 else
                                     return NO;
                             }];
    
    return indexNumber;
}

-(BOOL) removeSong: (Song *) theSong
{
    if([library containsObject:theSong])
    {
        [library removeObject:theSong];
        
        for(Playlist *nextPlaylist in playLists)
            [nextPlaylist removeSongFromPlaylist:theSong];
        return YES;
    }
    
    else
    {
        NSLog(@"Could not remove the song, no such song in the library");
        return NO;
    }
}

-(BOOL) removeSongWithName:(NSString *)theName
{
    Song * deleteSong = [self searchSongNameForLibraryReference:theName];
    
    if(deleteSong)
    {
        [self removeSong:deleteSong];
        return YES;
    }
    else
    {
        NSLog(@"Could not delete song");
        return NO;
    }
}

-(id) searchSongNameForLibraryReference: (NSString *) theName
{
    NSIndexSet *results  = [library indexesOfObjectsPassingTest:^(id obj, NSUInteger idx, BOOL *stop){
        if([[obj title] compare:theName])
            return YES;
        else
            return NO;
    }];
    
    if([results count] > 1)
    {
        NSLog(@"could not remove: %lu songs with the same title", [results count]);
        return nil;
    }
    
    else if ([results count] == 0)
    {
        NSLog(@"could not remove the song, no such title in library!");
        return nil;
    }
    
    else
    {
        return [library objectAtIndex:[results firstIndex]];
    }
}

-(NSString *) description
{
    NSMutableString *displayFormat = [NSMutableString stringWithFormat:@"\n==================== %-25@ ====================\n\n", name];
    
    [displayFormat  appendFormat:@"library collection:\n"];
    
    for(Song * nextSong in library)
        [displayFormat appendFormat:@"%@\n", nextSong];
    
    for(Playlist *nextPlaylist in playLists)
        [displayFormat appendFormat:@"%@\n", nextPlaylist];
    
    [displayFormat appendFormat:@"==================================================================="];
    
    return displayFormat;
}

-(void) list
{
    NSLog(@"==================== %-25@ ====================\n\n", name);
    NSLog(@"library collection:");
    
    for(Song * nextSong in library)
        NSLog(@"%@\n", nextSong);
    
    for(Playlist *nextPlaylist in playLists)
        NSLog(@"%@\n", nextPlaylist);
    
    NSLog(@"===================================================================");

}

-(NSArray *) searchSongWithString: (NSString *) theName
{
    NSMutableArray *searchResults = [NSMutableArray array];
    NSMutableArray *searchKeys;
    for(Song *nextSong in library)
    {
        searchKeys = [nextSong makeSearchKeys];
        
        for(NSString *nextKey in searchKeys)
        {
            if([nextKey localizedCaseInsensitiveContainsString:theName])
            {
                [searchResults addObject:nextSong];
                break;
            }
            
        }
        
    }
    
    for(Song *nextSong in searchResults)
        NSLog(@"%@", nextSong);
    
    return searchResults;
}
@end
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
