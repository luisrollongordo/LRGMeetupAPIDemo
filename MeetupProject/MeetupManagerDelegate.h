//
//  MeetupManagerDelegate.h
//  MeetupProject
//
//  Created by Luis Rollon Gordo on 8/6/16.
//  Copyright © 2016 Efecto Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MeetupManagerDelegate <NSObject>

- (void)didReceiveGroups:(NSArray *)groups;
- (void)fetchingGroupsFailedWithError:(NSError *)error;

@end
