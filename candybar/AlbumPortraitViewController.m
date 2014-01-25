//
//  ViewController.m
//  candybar
//
//  Created by Ivan Moscoso on 1/21/14.
//  Copyright (c) 2014 Ivan Moscoso. All rights reserved.
//

#import "AlbumPortraitViewController.h"

@interface AlbumPortraitViewController ()
@property(nonatomic,weak)UIViewController *landscapeViewController;
@end

@implementation AlbumPortraitViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(swapControllersIfNeeded)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

- (void)swapControllersIfNeeded
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    
    // Check that we're not showing the wrong controller for the orientation.
    if (UIDeviceOrientationIsLandscape(deviceOrientation) &&
        self.navigationController.visibleViewController == self)
    {
        // Orientation is landscape but the visible controller is this one,
        // which is the portrait one.
        // Create new instance of landscape controller from the storyboard.
        // Use a property to keep track of it because we need it for
        // the check in the else branch.
        self.landscapeViewController =
        [self.storyboard instantiateViewControllerWithIdentifier:@"LandscapeViewID"];
        // TODO - Set the landscape controller's model from the model we have.
        // self.landscapeViewController.model = self.model;
        // Push the new controller rather than use a segue so that we can do it
        // without animation.
        [self.navigationController pushViewController:self.landscapeViewController
                                             animated:NO];
    }
    else if (UIDeviceOrientationIsPortrait(deviceOrientation) &&
             self.navigationController.visibleViewController == self.landscapeViewController)
    {
        // Orientation is portrait but the visible controller is
        // the landscape controller. Pop the top controller, we
        // know the portrait controller, self, is the next one down.
        [self.navigationController popViewControllerAnimated:NO];
    }
}
@end
