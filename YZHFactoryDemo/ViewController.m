//
//  ViewController.m
//  YZHFactoryDemo
//
//  Created by NO NAME on 2021/1/28.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "ViewController.h"
#import "YZHObject.h"
#import "YZHTESTViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self zh_setupSubviews];
}

- (void)zh_setupSubviews
{
    self.title = LOCALIZED_STRING(@"home");
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
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
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    [self.view addSubview:tableView];
    if (@available(iOS 11.0, *)) {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    tableView.frame = self.view.frame;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *item = self.dataArray[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = item;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *item = self.dataArray[indexPath.row];
    YZHLog(@"点击 %@", item);
    switch (indexPath.row) {
        case 0:
            [YZHObject.shared ttt];
            break;
        case 1:
        {
            NSString *string = [[NSDate date] yzh_toFormatString:@"YYYY-MM-dd HH:mm:ss"];
            YZHLog(@"string = %@", string);
        }
            break;
        case 2:
        {
            NSDate *date = [@"2021-09-02 15:12:30" yzh_toDate:@"YYYY-MM-dd HH:mm:ss"];
            YZHLog(@"date = %@", date);
        }
            break;
        case 3:
            [UIAlertController yzh_alertControllerWithVC:self title:@"提示" message:@"消息" preferredStyle:UIAlertControllerStyleAlert cancelTitle:@"取消" cancelBlock:^(UIAlertAction * _Nonnull action) {
                YZHLog(@"取消");
            } okTitle:@"确定" okBlock:^(UIAlertAction * _Nonnull action) {
                YZHLog(@"确定");
            }];
            break;
        case 4:
            break;
        case 5:
            break;
        case 6:
            break;
        case 7:
            break;
        case 8:
            [self testYZHNav];
            break;
        case 9:
        {
            CGFloat x = [self.view yzh_width];
            YZHLog(@"x = %f", x);
        }
            break;
        case 10:
        {
            UIViewController *curVC = [UIViewController yzh_getCurrentVC];
            YZHLog(@"curVC = %@", [curVC class]);
        }
            break;
        case 11:
        {
            BOOL isexist = [YZHFileManager.shared yzh_fileExistsAtPath:@"123"];
            YZHLog(@"isexist = %@", isexist ? @"存在":@"不存在");
        }
            break;
        case 12:
        {
            NSString *json = [YZHConvertUtils yzh_convertToJsonData:@{@"name":@"张三",@"age":@20}];
            YZHLog(@"json = %@", json);
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 事件

- (void)testYZHNav
{
    YZHTESTViewController *vc = [[YZHTESTViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [nav yzh_setNavigationBarStyle:YZHNavigationBarStyleDarkContent titleColer:nil barTintColor:UIColor.redColor tintColor:UIColor.cyanColor shadowImage:nil];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - lazyload

- (NSArray *)dataArray
{
    return
    @[
        @"YZHDefine",
        @"NSDate+YZHCategory",
        @"NSString+YZHCategory",
        @"UIAlertController+YZHCategory",
        @"UIButton+YZHCategory",
        @"UIColor+YZHCategory",
        @"UIImage+YZHCategory",
        @"UILabel+YZHCategory",
        @"UINavigationController+YZHCategory",
        @"UIView+YZHCategory",
        @"UIViewController+YZHCaregory",
        @"YZHFileManager",
        @"YZHConvertUtils",
    ];
}

@end
