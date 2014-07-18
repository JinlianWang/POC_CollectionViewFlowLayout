//
//  TransactionsDataService.h
//  POC_iPhoto
//
//  Created by Wang, Jinlian on 7/18/14.
//  Copyright (c) 2014 SunnyOrg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transaction.h"
#import "SectionInfo.h"

@interface TransactionsDataService : NSObject

+ (TransactionsDataService *) sharedInstance;

- (Transaction *)getTransactionAt:(NSIndexPath *)indexPath;
- (NSInteger)getTransactionCount:(NSInteger)section;
- (NSInteger)getSectionCount;
- (NSString *)getSectionTitle:(NSInteger)section;
@end
