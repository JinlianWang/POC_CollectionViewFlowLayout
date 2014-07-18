//
//  TransactionsDataService.h
//  POC_iPhoto
//
//  Created by Wang, Jinlian on 7/18/14.
//  Copyright (c) 2014 SunnyOrg. All rights reserved.
//

#import "Transaction.h"
#import "NSDictionary + JSON.h"

@implementation Transaction

-(instancetype) initFromDict:(NSDictionary *)dict{
    self = [super init];
    if(self){
        self.transactionName = [dict objectForPath:@"description"];
        self.transactionAmount = [[dict objectForPath:@"amount"] floatValue];
        self.transactionDate = [dict objectForPath:@"date"];
        self.logoIcon = [dict objectForPath:@"logo"];
    }
    return self;
}

@end
