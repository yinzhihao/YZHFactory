//
//  ViewController.m
//  YZHFactoryDemo
//
//  Created by NO NAME on 2021/1/28.
//  Copyright © 2021 yzh. All rights reserved.
//

#import "ViewController.h"
#import "YZHTESTViewController.h"
#import "YZHDefineViewController.h"
#import "YZHUIColorCategoryViewController.h"

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
    
    [self.navigationController yzh_setNavigationBarStyle:YZHNavigationBarStyleDarkContent titleColer:RANDOM_COLOR barTintColor:RANDOM_COLOR tintColor:RANDOM_COLOR shadowImage:nil];
    
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
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
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
        {
            YZHDefineViewController *vc = [[YZHDefineViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            NSString *string = [[NSDate date] yzh_toFormatString:@"yyyy-MM-dd HH:mm:ss"];
            YZHLog(@"string = %@", string);
        }
            break;
        case 2:
        {
            NSDate *date = [@"2021-09-02 15:12:30" yzh_toDate:@"yyyy-MM-dd HH:mm:ss"];
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
        {
            YZHUIColorCategoryViewController *vc = [[YZHUIColorCategoryViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:
            cell.imageView.image = [UIImage yzh_imageWithColor:RANDOM_COLOR size:CGSizeMake(30, 30)];
            break;
        case 7:
            cell.accessoryView = [UILabel yzh_labelWithText:@"labellabellabellabellabellabel" textAlignment:NSTextAlignmentRight numberOfLines:0 font:FONT_HELVETICA(15) color:RANDOM_COLOR];
            break;
        case 8:
            [self testYZHNav];
            break;
        case 9:
        {
            YZHLog(@"x = %f", self.view.x);
            YZHLog(@"y = %f", self.view.y);
            YZHLog(@"width = %f", self.view.width);
            YZHLog(@"height = %f", self.view.height);
            YZHLog(@"centerX = %f", self.view.centerX);
            YZHLog(@"centerY = %f", self.view.centerY);
            UIImage *image = [self.view yzh_captureImage];
            cell.imageView.image = image;
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
            NSDictionary *dict = [YZHConvertUtils yzh_dictionaryWithJsonString:json];
            YZHLog(@"dict = %@", dict);
            NSData *data = [YZHConvertUtils yzh_hexStr2Data:@"0123456789abcdef"];
            YZHLog(@"data = %@", data);
            NSString *str = [YZHConvertUtils yzh_hexData2hexString:data];
            YZHLog(@"str = %@", str);
            NSString *hexStr = [YZHConvertUtils yzh_hexStringFromString:@"0123456789abcdefghijklmnopqrstuvwxyz"];
            YZHLog(@"hexStr = %@", hexStr);
            
            
            NSString *bcd = [YZHConvertUtils yzh_bcdToDec:[YZHConvertUtils yzh_hexStr2Data:@"123456789"]];
            YZHLog(@"bcd = %@", bcd);
            
            int num = 1;
            NSData *numData = [YZHConvertUtils yzh_ToHex:num];

            YZHLog(@"numData = %@", numData);
            NSString *numStr = [YZHConvertUtils yzh_hexData2hexString:numData];
            long nnn = [YZHConvertUtils yzh_convertHexToDecimal:numStr];
            YZHLog(@"nnn = %ld", nnn);
            
            //小端，yzh_convertHexToDecimal的结果是错误的，需要用这个方法转CFSwapInt32LittleToHost
//            NSData *numData = [NSData dataWithBytes:&num length:4];
//            int n1 = CFSwapInt32LittleToHost(num);
//            YZHLog(@"n1 = %d", n1);
//            int n2 = CFSwapInt32LittleToHost(*(int*)([numData bytes]));
//            YZHLog(@"n2 = %d", n2);
            
        }
            break;
        case 13:
        {
            [self testYZHNav];
            [APP_WINDOW.layer yzh_transitionWithAnimType:TransitionAnimTypeRandom subType:TransitionSubtypesFromRandom curve:TransitionCurveRandom duration:1];
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
    [nav yzh_setNavigationBarStyle:YZHNavigationBarStyleDarkContent titleColer:RANDOM_COLOR barTintColor:RANDOM_COLOR tintColor:RANDOM_COLOR shadowImage:nil];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
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
        @"CALayer+YZHCategory",
    ];
}

@end
