//
//  SectionInfo.m
//  POC_iPhoto
//
//  Created by Wang, Jinlian on 7/18/14.
//  Copyright (c) 2014 SunnyOrg. All rights reserved.
//

#import "SectionInfo.h"
#import "NSDictionary + JSON.h"
#import "Transaction.h"

@implementation SectionInfo
-(instancetype)initFromDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        
        self.title = [dict objectForPath:@"title"];
        
        //parse transactions
        NSArray *transactionArray = (NSArray *)[dict objectForPath:@"transactions"];
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:transactionArray.count];
        NSEnumerator *enumerator = [transactionArray objectEnumerator];
        NSDictionary *nextDict;
        while (nextDict = [enumerator nextObject]) {
            Transaction *t = [[Transaction alloc] initFromDict:nextDict];
            [array addObject:t];
        }
        self.transactions = array;
    }
    return self;
}

-(NSInteger) getTransactionCount{
    return self.transactions.count;
}

-(Transaction *) getTransactionAt:(NSInteger)idx{
    return [self.transactions objectAtIndex:idx];
}
@end
