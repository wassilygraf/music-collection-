//
//  MusicCollection.h
//  Objective-C
//
//  Created by Wassily Graf on 06/03/2017.
//  Copyright © 2017 Wassily Graf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Playlist.h"

@interface MusicCollection : NSObject
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSMutableArray *playLists, *library;

+(id) musicCollectionWithName: (NSString *) name;
-(id) initWithName: (NSString *) name;
-(id) init;
-(void) setName:(NSString *)theName;

-(BOOL) addNewSong: (Song *) theSong;
-(BOOL) addNewSong: (Song *) theSong toNewPlaylist: (Playlist *) thePlaylist;
-(BOOL) addExistingSong:(Song *)theSong toPlaylist:(Playlist *) thePlaylist;

-(BOOL) addPlaylist: (Playlist *) thePlaylist;
-(id)   createPlaylistWithName: (NSString *) theName;
-(BOOL) removePlaylist: (Playlist *) thePlaylist;
-(BOOL) removePlaylistWithName: (NSString *) theName;

-(BOOL) containsPlaylistWithName: (NSString *) theName;
-(NSUInteger)   fetchPlaylistIndexFromString: (NSString *) theName;
-(NSUInteger) fetchPlaylistIndexFromReference:(id) thePlaylist;

-(BOOL) removeSong: (Song *) theSong;
-(BOOL) removeSongWithName: (NSString *) theName;
-(id) searchSongNameForLibraryReference: (NSString *) theName;

-(NSString *) description;

-(NSArray *) searchSongWithString: (NSString *) theName;
@end
