//
//  AlbumRepository.m
//  candybar
//
//  Created by Ivan Moscoso on 2/5/14.
//  Copyright (c) 2014 Ivan Moscoso. All rights reserved.
//

#import "AlbumRepository.h"
#import <MediaPlayer/MediaPlayer.h>
#import <TargetConditionals.h>

@interface AlbumRepositoryDeviceImpl : AlbumRepository {
    MPMediaQuery*  _query;
    NSArray*        _albums;
}
@end

@implementation AlbumRepositoryDeviceImpl

- (id)init
{
    self = [super init];
    if (self) {
        _query = [MPMediaQuery albumsQuery];
        _albums = _query.collections;
    }
    return self;
}

-(UIImage *)imageForAlbumAt:(NSUInteger)albumIndex
{
    MPMediaItem *item = [_albums[albumIndex] representativeItem];
    MPMediaItemArtwork *artwork = [item valueForProperty:MPMediaItemPropertyArtwork];
    return [artwork imageWithSize:artwork.bounds.size];
}
@end


@interface AlbumRepositoryTestImpl : AlbumRepository {
    NSUInteger  _count;
    NSArray*    _testImages;
}
@end

@implementation AlbumRepositoryTestImpl

- (id)init
{
    self = [super init];
    if (self) {
        _count = 1;
        _testImages = @[[UIImage imageNamed:@"image.png"]];
    }
    return self;
}

-(UIImage *)imageForAlbumAt:(NSUInteger)albumIndex
{
    return _testImages[albumIndex];
}

@end

@implementation AlbumRepository

+(AlbumRepository *)createRepository
{
#if TARGET_IPHONE_SIMULATOR
    return [[AlbumRepositoryTestImpl alloc] init];
#else
    return [[AlbumRepositoryDeviceImpl alloc] init];
#endif
}

-(UIImage *)imageForAlbumAt:(NSUInteger)albumIndex
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return nil;
}

-(NSString *)titleForAlbumAt:(NSUInteger)albumIndex
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return nil;
}

-(NSArray *)tracksForAlbumAt:(NSUInteger)albumIndex
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
    return nil;
}


@end
