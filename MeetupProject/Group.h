//
//  Group.h
//  MeetupProject
//
//  Created by Luis Rollon Gordo on 7/6/16.
//  Copyright © 2016 Efecto Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *description;
@property (copy, nonatomic) NSString *who;
@property (copy, nonatomic) NSString *country;
@property (copy, nonatomic) NSString *city;

@end
