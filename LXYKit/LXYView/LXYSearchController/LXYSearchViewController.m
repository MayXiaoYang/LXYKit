//
//  LXYSearchViewController.m
//  LXYKit
//
//  Created by liang lee on 2019/9/9.
//  Copyright © 2019 li xiao yang. All rights reserved.
//

#import "LXYSearchViewController.h"
#import "UIImage+LXYSearchBar.h"
#import "LXYCollectionViewLeftFlowLayout.h"
#import "LXYHotSearchCollectionViewCell.h"
#import "LXYSearchCollectionReusableView.h"
@interface LXYSearchViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate,LXYHotSearchCollectionViewCellDelegate,UISearchBarDelegate,LXYSearchCollectionReusableViewDelegate>
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *array_dataSource;
@property (nonatomic, strong)NSMutableArray *array_history;
@end

@implementation LXYSearchViewController

-(NSMutableArray *)array_dataSource{
    if (!_array_dataSource) {
        _array_dataSource = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _array_dataSource;
}
-(NSMutableArray *)array_history{
    if (!_array_history) {
        _array_history = [NSKeyedUnarchiver unarchiveObjectWithFile:DOCUMENT_PATH(@"searchHistryPath")];
        if (!_array_history) {
            _array_history = [[NSMutableArray alloc]initWithCapacity:0];
        }
    }
    return _array_history;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        LXYCollectionViewLeftFlowLayout *flowLayout = [[LXYCollectionViewLeftFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 15, 10, 15);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 88, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 34 - 88) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[LXYHotSearchCollectionViewCell class] forCellWithReuseIdentifier:@"item"];
        [_collectionView registerClass:[LXYSearchCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createNavRightItem];//导航右侧取消按钮
    
    [self createSearchBar];//searchBar
    
    [self initSearchData];//假数据，这里可以请求数据然后加载
    
}
#pragma mark ------- custom Data
-(void)initSearchData{
    for (int i = 0; i< 7; i++) {
        LXYHotSearchModel *model = [[LXYHotSearchModel alloc]init];
        switch (i) {
            case 0:
                model.hotSearchTitle = @"哈哈";
                break;
            case 1:
                model.hotSearchTitle = @"哈哈哈";
                break;
            case 2:
                model.hotSearchTitle = @"哈哈哈哈";
                break;
            case 3:
                model.hotSearchTitle = @"哈哈哈哈哈";
                break;
            case 4:
                model.hotSearchTitle = @"哈哈哈哈哈哈";
                break;
            case 5:
                model.hotSearchTitle = @"哈哈哈哈哈哈哈";
                break;
            case 6:
                 model.hotSearchTitle = @"哈哈哈哈哈哈哈哈";
                break;
            default:
                model.hotSearchTitle = @"哈哈哈哈哈哈哈哈";
                break;
        }
        [model calHotSearchTitleWidth];
        [self.array_dataSource addObject:model];
    }
    [self.collectionView reloadData];
}
#pragma mark ------- custom UI
-(void)createNavRightItem{
    UIButton *btn_right = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_right setFrame:CGRectMake(0, 0, 36, 36) title:@"取消" titleFont:[UIFont systemFontOfSize:15] titleColor:[UIColor blackColor] target:self action:@selector(backClick:)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn_right];
    self.navigationItem.rightBarButtonItem= rightItem;
}
-(void)createSearchBar{
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 36)];
    [searchBar setSearchFieldBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(searchBar.width, 36)] forState:UIControlStateNormal];
    searchBar.delegate = self;
    UITextField *textfield = [searchBar valueForKey:@"_searchField"];
    textfield.layer.masksToBounds = YES;
    textfield.layer.cornerRadius = 18;
    [searchBar becomeFirstResponder];
    self.navigationItem.titleView = searchBar;
}
#pragma mark ------- collectionViewDelegateAndDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return (section == 0) ? self.array_dataSource.count : self.array_history.count;
}
-(__kindof UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LXYHotSearchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    cell.delegate = self;
    cell.model = (indexPath.section == 0)?self.array_dataSource[indexPath.row]:self.array_history[indexPath.row];
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 15;
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        LXYHotSearchModel *model = self.array_dataSource[indexPath.row];
        if (model.isEditing) {
            return CGSizeMake(model.hotSearchTitleWidth + 20 + 20, 30);
        }
        return CGSizeMake(model.hotSearchTitleWidth + 20, 30);
    }
    LXYHotSearchModel *model = self.array_history[indexPath.row];
    if (model.isEditing) {
        return CGSizeMake(model.hotSearchTitleWidth + 20 + 20, 30);
    }
    return CGSizeMake(model.hotSearchTitleWidth + 20, 30);
    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        LXYSearchCollectionReusableView * headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        headView.headTitle.text = (indexPath.section == 0)?@"热门搜索":@"搜索历史";
        headView.clearBtn.hidden = (indexPath.section == 0)?YES:NO;
        if (indexPath.section == 1) {
            headView.delegate = self;
        }
        return headView;
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.view.frame.size.width, 34);
}
#pragma mark ------- custom delegate
-(void)didLongPressTitleWithLabel:(UILabel *)label withCell:(LXYHotSearchCollectionViewCell *)cell{
    NSIndexPath *indexPth = [self.collectionView indexPathForCell:cell];
    if (indexPth.section == 1) {
        for (LXYHotSearchModel *model in self.array_history) {
            if ([model.hotSearchTitle isEqualToString:label.text]) {
                model.isEditing = YES;
            }else{
                model.isEditing = NO;
            }
        }
        [self.collectionView reloadData];
    }
}
-(void)didTapDeleteBtnWithCell:(LXYHotSearchCollectionViewCell *)cell withBtn:(UIButton *)sender{
    NSIndexPath *indexPth = [self.collectionView indexPathForCell:cell];
    [self.array_history removeObjectAtIndex:indexPth.row];
    [NSKeyedArchiver archiveRootObject:self.array_history toFile:DOCUMENT_PATH(@"searchHistryPath")];
    [self.collectionView reloadData];
}
-(void)didSelectedClearBtnOnView:(LXYSearchCollectionReusableView *)headView withBtn:(UIButton *)sender{
    [self.array_history removeAllObjects];
    [NSKeyedArchiver archiveRootObject:self.array_history toFile:DOCUMENT_PATH(@"searchHistryPath")];
    [self.collectionView reloadData];
}

#pragma mark ------- searchBar delegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    //点击搜索按钮执行
    //1.将搜索的字符串存入本地沙盒中
//    DOCUMENT_PATH(@"searchHistryPath");
    for (LXYHotSearchModel *model in self.array_history) {
        if ([model.hotSearchTitle isEqualToString:searchBar.text]) {
            [self.array_history removeObject:model];//移到数组第一位
        }
    }
    LXYHotSearchModel *model = [[LXYHotSearchModel alloc]init];
    model.hotSearchTitle = searchBar.text;
    [model calHotSearchTitleWidth];
    [self.array_history insertObject:model atIndex:0];
    [NSKeyedArchiver archiveRootObject:self.array_history toFile:DOCUMENT_PATH(@"searchHistryPath")];
    [self.collectionView reloadData];
    
}
#pragma mark ------- action
-(void)backClick:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
