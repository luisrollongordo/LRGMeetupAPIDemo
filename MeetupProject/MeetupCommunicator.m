//
//  MeetupCommunicator.m
//  MeetupProject
//
//  Created by Luis Rollon Gordo on 16/8/16.
//  Copyright © 2016 Efecto Apple. All rights reserved.
//

#import "MeetupCommunicator.h"
#import "MeetupCommunicatorDelegate.h"

#define API_KEY @"491e6b78594363514c3d4d365229247"
#define PAGE_COUNT 20
#define LATITUDE 40.396810
#define LONGITUDE -3.608901

@implementation MeetupCommunicator

- (void)searchGroups
{
    //1
    NSString *urlAsString = [NSString stringWithFormat:@"https://api.meetup.com/2/groups?lat=%f&lon=%f&page=%d&key=%@", LATITUDE, LONGITUDE, PAGE_COUNT, API_KEY];
    
    //2
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    //3
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        if (error) {
            [self.delegate fetchingGroupsFailedWithError:error];
        } else {
            [self.delegate receivedGroupsJSON:data];
        }
    }]resume];
}

@end
