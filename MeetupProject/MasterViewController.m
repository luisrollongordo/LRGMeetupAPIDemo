//
//  MasterViewController.m
//  MeetupProject
//
//  Created by Luis Rollon Gordo on 6/6/16.
//  Copyright © 2016 Efecto Apple. All rights reserved.
//

#import "MasterViewController.h"
#import "Group.h"
#import "MeetupManager.h"
#import "MeetupCommunicator.h"
#import "DetailCell.h"

@interface MasterViewController () <MeetupManagerDelegate> {
    NSArray *_groups;
    MeetupManager *_manager;
    UIActivityIndicatorView *_activityView;
}

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _manager = [[MeetupManager alloc] init];
    _manager.communicator = [[MeetupCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    [self addActivityIndicatorView];
    
    [_manager fetchGroups];
    
}

- (void)addActivityIndicatorView{
    
    _activityView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    _activityView.center = self.view.center;
    [_activityView startAnimating];
    [self.view addSubview:_activityView];
}

#pragma mark - MeetupManagerDelegate

- (void)didReceiveGroups:(NSArray *)groups
{
    _groups = groups;
    [self.tableView reloadData];
    [_activityView stopAnimating];
}

- (void)fetchingGroupsFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}


#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCell *detailCell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];
    
    Group *group = _groups[indexPath.row];
    
    detailCell.nameLabel.text = group.name;
    detailCell.whoLabel.text = group.who;
    detailCell.locationLabel.text = [NSString stringWithFormat:@"%@, %@", group.city, group.country];
    detailCell.descriptionLabel.text = group.description;
    
    return detailCell;
}
@end
