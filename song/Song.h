//
//  Song.h
//  Objective-C
//
//  Created by Wassily Graf on 06/03/2017.
//  Copyright © 2017 Wassily Graf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject
@property (copy, nonatomic) NSString *title, *artist, *album, *playingTime;

+(id) songWithTitle: (NSString *) theTitle artist: (NSString *) theArtist album: (NSString *) theAlbum andPlayingTime: (NSString *) thePlayingTime;
-(id) initWithTitle: (NSString *) theTitle artist: (NSString *) theArtist album: (NSString *) theAlbum andPlayingTime: (NSString *) thePlayingTime;
-(id) init;
-(void) setTitle: (NSString *) theTitle artist: (NSString *) theArtist album: (NSString *) theAlbum andPlayingTime: (NSString *) thePlayingTime;

-(NSMutableArray *) makeSearchKeys;

-(NSString *) description;
-(void) print;

@end
