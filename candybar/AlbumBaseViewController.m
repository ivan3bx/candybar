//
//  AlbumBaseViewController.m
//  candybar
//
//  Created by Ivan Moscoso on 1/24/14.
//  Copyright (c) 2014 Ivan Moscoso. All rights reserved.
//

#import "AlbumBaseViewController.h"
#import "AlbumRepository.h"

@interface AlbumBaseViewController () {
    NSUInteger _index;
    AlbumRepository *_repo;
}

@property (weak, nonatomic) IBOutlet UIImageView *currentImage;

@end

@implementation AlbumBaseViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    _repo = [AlbumRepository createRepository];
    _index = 0;
    [self.currentImage setImage:[_repo imageForAlbumAt:_index]];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
