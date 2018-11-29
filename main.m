//
//  main.m
//  Objective-C
//
//  Created by Wassily Graf on 20/02/2017.
//  Copyright © 2017 Wassily Graf. All rights reserved.
//


// Define three new classes, calld Song, Playlist, and MusicCollection. A song object will contain information about a particular song, such as it's title, album and playing time. A playlist object will contain a collection of playlists, including a special master playlist called library that contains every song in the collection. Define these three classes and write methods to do the following
// Creare a Song object and st its information
// Create a Playlist object, and add songs to and remove songs from a playlist. A new song should be added to the master playlist it it's not already there. Mak sur that is a song is removed from the master playlist, it is removed from all playlists in the music collection as well.
// Create a MusicCollection object, and add playlists to and remove playlists from the collection.
// Search and display the information about any song, any playlist, or the entire music collection.
// Make sure all your classes do not leak memory!

#import "MusicCollection.h"

int main (int argc, const char *argv[])
{
    @autoreleasepool {
        Song *aSong = [Song songWithTitle: @"Aaron" artist: @"Kalkbrenner" album: @"Berlin Calling" andPlayingTime: @"6:01"];
        Song *bSong = [Song songWithTitle: @"Accross the Universe" artist: @"The Beatles" album: @"Let it be" andPlayingTime: @"3:49"];
        Song *cSong = [Song songWithTitle: @"Alles Neu" artist: @"Peter Fox" album: @"Stadtaffe" andPlayingTime: @"4:20"];
        Song *dSong = [Song songWithTitle: @"Baba Yetu" artist: @"christopher Tin" album: @"Calling all dawns" andPlayingTime: @"3:30"];
        Song *eSong = [Song songWithTitle: @"Bank Robber" artist: @"The Clash" album: @"RocknRolla" andPlayingTime: @"4:32"];
        Song *fSong = [Song songWithTitle: @"Kleine Nachtmusik" artist: @"Andrew Manze" album: @"Mozart Night Music" andPlayingTime: @"7:45"];
        
        Playlist *oldButGold = [Playlist playlistWithName:@"Old but Gold"];
        Playlist *rockClassic = [Playlist playlistWithName:@"Rock Classics"];
        Playlist *electronic = [Playlist playlistWithName:@"New Electronic"];
        
        MusicCollection *myCollection = [MusicCollection musicCollectionWithName:@"My Music Collection"];
        
        [myCollection addNewSong:fSong toNewPlaylist:oldButGold];
        [myCollection addNewSong:bSong toNewPlaylist:oldButGold];
        [myCollection addNewSong:eSong toNewPlaylist:rockClassic];
        [myCollection addNewSong:cSong toNewPlaylist:rockClassic];
        [myCollection addNewSong:aSong toNewPlaylist:electronic];
        [myCollection addNewSong:dSong toNewPlaylist:electronic];
        
        NSLog(@"%@", myCollection);
        
        [myCollection searchSongWithString:@"3:"];
        
        [oldButGold list];
        
        [aSong print];
        
        Playlist *newPlaylist = [myCollection createPlaylistWithName:@"newPlaylist"];
        
        NSLog(@"%@", myCollection);
        

    }
    
    return 0;
}
