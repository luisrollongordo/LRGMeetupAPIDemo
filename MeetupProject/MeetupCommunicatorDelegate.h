//
//  MeetupCommunicatorDelegate.h
//  MeetupProject
//
//  Created by Luis Rollon Gordo on 7/6/16.
//  Copyright © 2016 Efecto Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MeetupCommunicatorDelegate <NSObject>

- (void)receivedGroupsJSON:(NSData *)objectNotation;
- (void)fetchingGroupsFailedWithError:(NSError *)error;

@end
