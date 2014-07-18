//
//  NSDictionary + JSON.m
//  POC_iPhoto
//
//  Created by Wang, Jinlian on 7/18/14.
//  Copyright (c) 2014 SunnyOrg. All rights reserved.
//

#import "NSDictionary + JSON.h"

@implementation NSDictionary(JSON)

+(id)loadFromFile:(NSString *)name{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    if(!filePath){
        return nil;
    }
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    if(!data){
        return nil;
    }
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    // Be careful here: the result might be an NSArray as well!
    if (error != nil) {
        return nil;
    }
    return result;
}

-(id) objectForPath:(NSString *)path{
    if(![self isKindOfClass:[NSDictionary class]]){
        return nil;
    }
    NSDictionary *dict=(NSDictionary *)self;
    NSArray *pcs = [path componentsSeparatedByString:@"/"];
    NSString *lastkey=[pcs lastObject];
    
    for (int i=0;i<pcs.count-1;i++){
        NSString *pc=[pcs objectAtIndex:i];
        if (pc.length>0){
            if ([dict isKindOfClass:[NSDictionary class]]){
                dict = [dict objectForKey:pc];
            } else if([dict isKindOfClass:[NSArray class]]){
                dict = [(NSArray *)dict objectAtIndex:[pc integerValue]];
            } else {
                return nil;
            }
        } else {
            return nil;
        }
    }
    if (![dict isKindOfClass:[NSNull class]]) {
        if([[dict objectForKey:lastkey] isKindOfClass:[NSNull class]]){
            return nil;
        }
    } else {
        return nil;
    }
    return [dict objectForKey:lastkey];
}

@end
