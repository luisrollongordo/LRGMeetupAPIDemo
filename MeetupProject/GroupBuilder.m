//
//  GroupBuilder.m
//  MeetupProject
//
//  Created by Luis Rollon Gordo on 7/6/16.
//  Copyright © 2016 Efecto Apple. All rights reserved.
//

#import "GroupBuilder.h"
#import "Group.h"

@implementation GroupBuilder

+ (NSArray *)groupsFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    NSError *localError = nil;
    //1.
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    //2.
    NSMutableArray *groups = [[NSMutableArray alloc] init];
    
    //3.
    NSArray *results = [parsedObject valueForKey:@"results"];
    NSLog(@"Count %lu", (unsigned long)results.count);
    
    //4.
    for (NSDictionary *groupDic in results) {
        Group *group = [[Group alloc] init];
        for (NSString *key in groupDic) {
            if ([group respondsToSelector:NSSelectorFromString(key)]) {
                [group setValue:[groupDic valueForKey:key] forKey:key];
            }
        }
        //5.
        [groups addObject:group];
    }
    
    //6.
    return groups;
}

@end

