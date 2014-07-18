//
//  SectionInfo.h
//  POC_iPhoto
//
//  Created by Wang, Jinlian on 7/18/14.
//  Copyright (c) 2014 SunnyOrg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transaction.h"

@interface SectionInfo : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray *transactions;

-(instancetype)initFromDict:(NSDictionary *)dict;
-(NSInteger) getTransactionCount;
-(Transaction *) getTransactionAt:(NSInteger)idx;

@end
