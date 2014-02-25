//
//  AlbumRepository.h
//  candybar
//
//  Created by Ivan Moscoso on 2/5/14.
//  Copyright (c) 2014 Ivan Moscoso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumRepository : NSObject

@property(nonatomic,readonly)NSUInteger count;

+(AlbumRepository *)createRepository;

-(UIImage *)imageForAlbumAt:(NSUInteger)albumIndex;
-(NSString *)titleForAlbumAt:(NSUInteger)albumIndex;
-(NSArray *)tracksForAlbumAt:(NSUInteger)albumIndex;

@end
