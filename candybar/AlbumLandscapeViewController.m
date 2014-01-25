//
//  AlbumLandscapeViewController.m
//  candybar
//
//  Created by Ivan Moscoso on 1/24/14.
//  Copyright (c) 2014 Ivan Moscoso. All rights reserved.
//

#import "AlbumLandscapeViewController.h"

@interface AlbumLandscapeViewController ()

@end

@implementation AlbumLandscapeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeRight;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
