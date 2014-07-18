//
//  TransactionsViewController.m
//  POC_iPhoto
//
//  Created by Wang, Jinlian on 7/18/14.
//  Copyright (c) 2014 SunnyOrg. All rights reserved.
//

#import "TransactionsCollectionViewController.h"
#import "TransactionsCollectionViewDataSource.h"
#import "TransactionCollectionViewCell.h"
#import "TransactionCollectionViewSectionHeader.h"

@interface TransactionsCollectionViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *transactionsCollectionView;
@property (strong, nonatomic) TransactionsCollectionViewDataSource *transactionCollectionViewDataSource;
@end

@implementation TransactionsCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupTransactionsCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTransactionsCollectionView{
    self.transactionCollectionViewDataSource = [[TransactionsCollectionViewDataSource alloc] init];
    self.transactionsCollectionView.dataSource = self.transactionCollectionViewDataSource;
    //self.transactionsCollectionView.collectionViewLayout = [[TransactionsCollectionViewLayout alloc] init];
    
    
    //Sunny: The following are using flow layout. It does not have precise control over the spacing between items.
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.transactionsCollectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(120, 60);
    layout.headerReferenceSize = CGSizeMake(400, 50);
    layout.minimumLineSpacing = 2.0f;
    layout.minimumInteritemSpacing = 2.0f;
    
    
    self.transactionsCollectionView.delegate = self;
    [self.transactionsCollectionView registerNib:[UINib nibWithNibName:@"TransactionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:TRAN_COLLECTIONVIEW_CELL_REUSEIDENTIFIER];
    [self.transactionsCollectionView registerNib:[UINib nibWithNibName:@"TransactionCollectionViewSectionHeader" bundle:nil]  forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:TRAN_COLLECTIONVIEW_SECTION_HEADER_REUSEIDENTIFIER];
}

@end
