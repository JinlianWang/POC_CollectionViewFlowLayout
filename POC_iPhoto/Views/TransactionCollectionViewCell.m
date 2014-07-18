//
//  TransactionCollectionViewCell.m
//  POC_iPhoto
//
//  Created by Wang, Jinlian on 7/18/14.
//  Copyright (c) 2014 SunnyOrg. All rights reserved.
//

#import "TransactionCollectionViewCell.h"

@interface TransactionCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;

@end

@implementation TransactionCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 1.0f;
}

- (void)refreshUIFromTransaction:(Transaction *)transaction{
    self.logoImageView.image = [UIImage imageNamed:transaction.logoIcon];
}

@end
