//
//  Playlist.h
//  Objective-C
//
//  Created by Wassily Graf on 06/03/2017.
//  Copyright © 2017 Wassily Graf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Song.h"

@interface Playlist : NSObject
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSMutableArray *songList;

+(id) playlistWithName: (NSString *) theName;
-(id) initWithName: (NSString *) theName;
-(id) init;
-(void) setName:(NSString *)theName;

-(void) addSong: (Song *) theSong;
-(void) removeSongFromPlaylist: (Song *) theSong;

-(NSString *) description;
-(void) list;

@end
