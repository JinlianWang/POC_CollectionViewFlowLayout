//
//  NSDictionary + JSON.h
//  POC_iPhoto
//
//  Created by Wang, Jinlian on 7/18/14.
//  Copyright (c) 2014 SunnyOrg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary(JSON)

+(id)loadFromFile:(NSString *)name;

-(id) objectForPath:(NSString *)path;

@end
