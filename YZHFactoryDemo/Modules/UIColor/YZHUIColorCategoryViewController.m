//
//  YZHUIColorCategoryViewController.m
//  YZHFactoryDemo
//
//  Created by NO NAME on 2022/11/7.
//  Copyright © 2022 yzh. All rights reserved.
//

#import "YZHUIColorCategoryViewController.h"

@interface YZHUIColorCategoryViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation YZHUIColorCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self zh_setupSubviews];
}

- (void)zh_setupSubviews
{
    self.title = LOCALIZED_STRING(@"UIColor+YZHCategory");
    self.view.backgroundColor = UIColor.whiteColor;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-(STATUS_BAR_HEIGHT+NAVIGATION_BAR_HEIGHT)) style:UITableViewStyleGrouped];
    self.tableView = tableView;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 55;
    tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
    tableView.estimatedSectionHeaderHeight = 0.001;
    tableView.sectionFooterHeight = UITableViewAutomaticDimension;
    tableView.estimatedSectionFooterHeight = 0.001;
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
    if (@available(iOS 11.0, *)) {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *item = self.dataArray[indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseId"];
    cell.textLabel.text = item;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *item = self.dataArray[indexPath.row];
    YZHLog(@"点击 %@", item);
    switch (indexPath.row) {
        case 0:
            cell.contentView.backgroundColor = [UIColor yzh_colorWithHex:0xFFFF0000];
            break;
        case 1:
            cell.contentView.backgroundColor = [UIColor yzh_arc4randomColor];
            break;
        case 2:
            cell.contentView.backgroundColor = [UIColor yzh_colorWithHexString:@"#654321" alpha:1.0];;
            break;
        case 3:
            cell.contentView.backgroundColor = [UIColor yzh_colorWithHexString:@"342165"];
            break;
            
        default:
            break;
    }
}

#pragma mark - 事件

- (void)handleNotification:(NSNotification *)notify
{
    YZHLog(@"收到通知");
    id obj = notify.object;
    YZHLog(@"notify.object = %@", obj);
}

#pragma mark - lazyload

- (NSArray *)dataArray
{
    return
    @[
        @"yzh_colorWithHex",
        @"yzh_arc4randomColor",
        @"yzh_colorWithHexString",
        @"yzh_colorWithHexString",
    ];
}

@end
