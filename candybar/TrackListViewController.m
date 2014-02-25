//
//  TrackListViewController.m
//  candybar
//
//  Created by Ivan Moscoso on 1/24/14.
//  Copyright (c) 2014 Ivan Moscoso. All rights reserved.
//

#import "TrackListViewController.h"
#import "TrackCell.h"

@interface TrackListViewController ()

@end

@implementation TrackListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TrackCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    
    NSArray *trackNames = @[@"Tale of Bit City (Intro)",
                            @"Swing Mode",
                            @"I Got You",
                            @"Bring Me Up (feat. All Dom Wrong)",
                            @"Kids Play",
                            @"Get It On, Pt. 1",
                            @"What I Do",
                            @"Compurhythm",
                            @"1983 (feat. Högni Egilsson)",
                            @"What U Love",
                            @"Tale of the Bit City",
                            @"Get It On, Pt. 2",
                            @"I Should Be Sleeping",
                            @"Over",
                            @"Get Back"];
    
    cell.trackNumber.text = [NSString stringWithFormat:@"%li", (unsigned long)indexPath.row + 1];
    cell.trackTitle.text = trackNames[indexPath.row];
    return cell;
}

@end
