//
//  TransactionsDataService.m
//  POC_iPhoto
//
//  Created by Wang, Jinlian on 7/18/14.
//  Copyright (c) 2014 SunnyOrg. All rights reserved.
//

#import "TransactionsDataService.h"
#import "NSDictionary + JSON.h"
#import "SectionInfo.h"
#import <UIKit/UIKit.h>

@interface TransactionsDataService()

@property (nonatomic, strong, getter=getSectionsInfo)NSArray *sectionsInfo;

@end

@implementation TransactionsDataService

+ (TransactionsDataService *) sharedInstance{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

//Override getter to do lazy loading of sectionsInfo from transactions.json
- (NSArray *)getSectionsInfo{
    if(!_sectionsInfo){
        NSArray *sectionArray = (NSArray *)[NSDictionary loadFromFile:@"transactions"];
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:sectionArray.count];
        NSEnumerator *enumerator = [sectionArray objectEnumerator];
        NSDictionary *nextDict;
        while (nextDict = [enumerator nextObject]) {
            SectionInfo *t = [[SectionInfo alloc] initFromDict:nextDict];
            [array addObject:t];
        }
        _sectionsInfo = array;
    }
    return _sectionsInfo;
}

- (Transaction *)getTransactionAt:(NSIndexPath *)indexPath{
    SectionInfo *sectionInfo = (SectionInfo *)[self.sectionsInfo objectAtIndex:indexPath.section];
    return[sectionInfo getTransactionAt:indexPath.item];
}

- (NSInteger)getTransactionCount:(NSInteger)section{
    SectionInfo *sectionInfo = (SectionInfo *)[self.sectionsInfo objectAtIndex:section];
    return [sectionInfo getTransactionCount];
}

- (NSInteger)getSectionCount{
    return self.sectionsInfo.count;
}

- (NSString *)getSectionTitle:(NSInteger)section{
    SectionInfo *info = (SectionInfo*)[self.sectionsInfo objectAtIndex:section];
    return info.title;
}

@end
