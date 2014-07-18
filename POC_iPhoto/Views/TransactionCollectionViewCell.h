//
//  TransactionCollectionViewCell.h
//  POC_iPhoto
//
//  Created by Wang, Jinlian on 7/18/14.
//  Copyright (c) 2014 SunnyOrg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transaction.h"

@interface TransactionCollectionViewCell : UICollectionViewCell

- (void)refreshUIFromTransaction:(Transaction *)transaction;


@end
