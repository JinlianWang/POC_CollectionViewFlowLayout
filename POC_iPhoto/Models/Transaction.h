//
//  TransactionsDataService.h
//  POC_iPhoto
//
//  Created by Wang, Jinlian on 7/18/14.
//  Copyright (c) 2014 SunnyOrg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transaction : NSObject

@property(retain, nonatomic) NSString *transactionName;
@property(assign, nonatomic) float transactionAmount;
@property(retain, nonatomic) NSString *logoIcon;
@property(retain, nonatomic) NSString *transactionDate;

-(instancetype) initFromDict:(NSDictionary *)dict;

@end
