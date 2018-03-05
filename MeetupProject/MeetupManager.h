//
//  MeetupManager.h
//  MeetupProject
//
//  Created by Luis Rollon Gordo on 8/6/16.
//  Copyright © 2016 Efecto Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "MeetupManagerDelegate.h"
#import "MeetupCommunicatorDelegate.h"

@class MeetupCommunicator;

@interface MeetupManager : NSObject <MeetupCommunicatorDelegate>

@property (strong, nonatomic) MeetupCommunicator *communicator;
@property (weak, nonatomic) id <MeetupManagerDelegate> delegate;

- (void)fetchGroups;

@end
