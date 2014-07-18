//
//  TransactionsCollectionViewDataSource.m
//  POC_iPhoto
//
//  Created by Wang, Jinlian on 7/18/14.
//  Copyright (c) 2014 SunnyOrg. All rights reserved.
//

#import "TransactionsCollectionViewDataSource.h"
#import "TransactionsDataService.h"
#import "TransactionCollectionViewCell.h"
#import "TransactionCollectionViewSectionHeader.h"

@interface TransactionsCollectionViewDataSource()

@property (strong, nonatomic) TransactionsDataService *dataService;

@end

@implementation TransactionsCollectionViewDataSource

- (id)init{
    self = [super init];
    if(self){
        self.dataService = [TransactionsDataService sharedInstance];
    }
    return self;
}

#pragma UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataService getTransactionCount:section];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [self.dataService getSectionCount];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TransactionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TRAN_COLLECTIONVIEW_CELL_REUSEIDENTIFIER forIndexPath:indexPath];
    [cell refreshUIFromTransaction:[self.dataService getTransactionAt:indexPath]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        TransactionCollectionViewSectionHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:TRAN_COLLECTIONVIEW_SECTION_HEADER_REUSEIDENTIFIER forIndexPath:indexPath];
        header.title = [self.dataService getSectionTitle:indexPath.section];
        return header;
    }
    return nil;
}

@end
