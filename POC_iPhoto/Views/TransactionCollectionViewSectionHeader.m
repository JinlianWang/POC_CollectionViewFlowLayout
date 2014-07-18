//
//  TransactionCollectionViewSectionHeader.m
//  POC_iPhoto
//
//  Created by Wang, Jinlian on 7/18/14.
//  Copyright (c) 2014 SunnyOrg. All rights reserved.
//

#import "TransactionCollectionViewSectionHeader.h"
@interface TransactionCollectionViewSectionHeader()
@property (weak, nonatomic) IBOutlet UILabel *sectionTitleLabel;

@end

@implementation TransactionCollectionViewSectionHeader

- (void)awakeFromNib {
    // Initialization code
    self.layer.borderColor = [UIColor greenColor].CGColor;
    self.layer.borderWidth = 1.0f;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.sectionTitleLabel.text = self.title;
}
@end
