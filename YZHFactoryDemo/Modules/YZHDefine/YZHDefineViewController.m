//
//  YZHDefineViewController.m
//  YZHFactoryDemo
//
//  Created by NO NAME on 2022/11/6.
//  Copyright © 2022 yzh. All rights reserved.
//

#import "YZHDefineViewController.h"
#import "YZHDefine.h"
#import "YZHObject.h"

#define NOTIFICATION_TEST @"yinzhihao.YZHFactoryDemo.NOTIFICATION_TEST"

@interface YZHDefineViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation YZHDefineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self zh_setupSubviews];
    
    [NOTIFICATION_CENTER addObserver:self selector:@selector(handleNotification:) name:NOTIFICATION_TEST object:nil];
}

- (void)zh_setupSubviews
{
    self.title = LOCALIZED_STRING(@"YZHDefine");
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
            YZHLog(@"YZHLog");
            break;
        case 1:
            YZHLog(@"APPLICATION = %@", APPLICATION);
            break;
        case 2:
            YZHLog(@"APP_DELEGATE = %@", APP_DELEGATE);
            break;
        case 3:
            YZHLog(@"APP_WINDOW = %@", APP_WINDOW);
            break;
        case 4:
            YZHLog(@"ROOT_VIEW_CONTROLLER = %@", ROOT_VIEW_CONTROLLER);
            break;
        case 5:
            YZHLog(@"USER_DEFAULT = %@", USER_DEFAULT);
            break;
        case 6:
            YZHLog(@"NOTIFICATION_CENTER = %@", NOTIFICATION_CENTER);
            break;
        case 7:
        {
            USER_DEFAULT_SET(@"张三", @"yinzhihao.YZHFactoryDemo");
        }
            break;
        case 8:
        {
            NSString *value = USER_DEFAULT_GET(@"yinzhihao.YZHFactoryDemo");
            YZHLog(@"USER_DEFAULT_GET = %@", value);
        }
            break;
        case 9:
        {
            YZHLog(@"@'' = %d", STRING_IS_EMPTY(@""));
            YZHLog(@"@'123' = %d", STRING_IS_EMPTY(@"123"));
        }
            break;
        case 10:
        {
            YZHLog(@"@[] = %d", ARRAY_IS_EMPTY(@[]));
            YZHLog(@"@[@123] = %d", ARRAY_IS_EMPTY(@[@123]));
        }
            break;
        case 11:
        {
            YZHLog(@"@{} = %d", DICT_IS_EMPTY(@{}));
            YZHLog(@"@{@'key':@'123'} = %d", DICT_IS_EMPTY(@{@"key":@"123"}));
        }
            break;
        case 12:
        {
            YZHLog(@"[NSNull null] = %d", OBJECT_IS_EMPTY([NSNull null]));
            YZHLog(@"[YZHObject shared] = %d", OBJECT_IS_EMPTY([YZHObject shared]));
        }
            break;
        case 13:
            YZHLog(@"NSStringFormat = %@", NSStringFormat(@"%@%d", @"aa", 123));
            break;
        case 14:
        {
            NOTIFICATION_POST(NOTIFICATION_TEST, @YES)
            NOTIFICATION_POST(NOTIFICATION_TEST, @NO)
        }
            break;
        case 15:
            YZHLog(@"SCREEN_WIDTH = %f", SCREEN_WIDTH);
            break;
        case 16:
            YZHLog(@"SCREEN_HEIGHT = %f", SCREEN_HEIGHT);
            break;
        case 17:
            YZHLog(@"SCREEN_BOUNDS = %@", NSStringFromCGRect(SCREEN_BOUNDS));
            break;
        case 18:
            YZHLog(@"SCREEN_SIZE = %@", NSStringFromCGSize(SCREEN_SIZE));
            break;
        case 19:
            YZHLog(@"SCREEN_SCALE = %f", SCREEN_SCALE);
            break;
        case 20:
            YZHLog(@"IS_IPHONEX_SET = %d", IS_IPHONEX_SET);
            break;
        case 21:
            YZHLog(@"STATUS_BAR_HEIGHT = %f", STATUS_BAR_HEIGHT);
            break;
        case 22:
            YZHLog(@"NAVIGATION_BAR_HEIGHT = %f", NAVIGATION_BAR_HEIGHT);
            break;
        case 23:
            YZHLog(@"TABBAR_HEIGHT = %f", TABBAR_HEIGHT);
            break;
        case 24:
            YZHLog(@"SAFE_BOTTOM_HEIGHT = %f", SAFE_BOTTOM_HEIGHT);
            break;
        case 25:
            YZHLog(@"SEARCH_BAR_HEIGHT = %f", SEARCH_BAR_HEIGHT);
            break;
        case 26:
            YZHLog(@"APP_VERSION = %@", APP_VERSION);
            break;
        case 27:
            YZHLog(@"BUILD_VERSION = %@", BUILD_VERSION);
            break;
        case 28:
            YZHLog(@"SYSTEM_VERSION = %@", SYSTEM_VERSION);
            break;
        case 29:
            YZHLog(@"CURRENT_LANGUAGE = %@", CURRENT_LANGUAGE);
            break;
        case 30:
            YZHLog(@"APP_DEVICE_UUIDSTRING = %@", APP_DEVICE_UUIDSTRING);
            break;
        case 31:
            YZHLog(@"DOCUMENT_PATH = %@", DOCUMENT_PATH);
            break;
        case 32:
            YZHLog(@"TEMP_PATH = %@", TEMP_PATH);
            break;
        case 33:
            YZHLog(@"CACHE_PATH = %@", CACHE_PATH);
            break;
        case 34:
        {
            cell.contentView.backgroundColor = RGB_COLOR(25, 125, 225);
        }
            break;
        case 35:
        {
            cell.contentView.backgroundColor = RGBA_COLOR(25, 125, 225, 0.5);
        }
            break;
        case 36:
        {
            cell.contentView.backgroundColor = RANDOM_COLOR;
        }
            break;
        case 37:
        {
            cell.contentView.backgroundColor = COLOR_WITH_HEX(0x654321);
        }
            break;
        case 38:
            cell.textLabel.font = FONT_SYSTEM(15);
            break;
        case 39:
            cell.textLabel.font = FONT_SYSTEM_BOLD(15);
            break;
        case 40:
            cell.textLabel.font = FONT_HELVETICA(15);
            break;
        case 41:
            cell.textLabel.font = FONT_HELVETICA_BOLD(15);
            break;
        case 42:
            cell.textLabel.font = FONT_PINGFANG_SC(15);
            break;
        case 43:
            cell.textLabel.font = FONT_PINGFANG_SC_BOLD(15);
            break;
        case 44:
            cell.textLabel.font = FONT(@"Helvetica-Bold", 15);
            break;
        case 45:
            YZHLog(@"DEGREES_TO_RADIAN = %f", DEGREES_TO_RADIAN(90));
            break;
        case 46:
            YZHLog(@"RADIAN_TO_DEGREES = %f", RADIAN_TO_DEGREES(0.5));
            break;
        case 47:
            break;
        case 48:
            break;
        case 49:
            break;
        case 50:
            cell.imageView.image = IMAGE(@"ic_new project");
            break;
        case 51:
            cell.imageView.image = IMAGE_IN_BUNDLE(@"ic_new project", NSBundle.mainBundle);
            break;
        case 52:
            break;
        case 53:
            [[YZHObject shared] ttt];
            break;
        case 54:
            [[YZHObject shared] ttt];
            break;
        case 55:
            break;
        case 56:
            break;
        case 57:
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
        @"YZHLog",
        
        @"APPLICATION",
        @"APP_DELEGATE",
        @"APP_WINDOW",
        @"ROOT_VIEW_CONTROLLER",
        @"USER_DEFAULT",
        @"NOTIFICATION_CENTER",
        
        @"USER_DEFAULT_SET",
        @"USER_DEFAULT_GET",
        
        @"STRING_IS_EMPTY",
        @"ARRAY_IS_EMPTY",
        @"DICT_IS_EMPTY",
        @"OBJECT_IS_EMPTY",
        
        @"NSStringFormat",
        
        @"NOTIFICATION_POST",
        
        @"SCREEN_WIDTH",
        @"SCREEN_HEIGHT",
        @"SCREEN_BOUNDS",
        @"SCREEN_SIZE",
        @"SCREEN_SCALE",
        
        @"IS_IPHONEX_SET",
        
        @"STATUS_BAR_HEIGHT",
        @"NAVIGATION_BAR_HEIGHT",
        @"TABBAR_HEIGHT",
        @"SAFE_BOTTOM_HEIGHT",
        @"SEARCH_BAR_HEIGHT",
        
        @"APP_VERSION",
        @"BUILD_VERSION",
        @"SYSTEM_VERSION",
        @"CURRENT_LANGUAGE",
        @"APP_DEVICE_UUIDSTRING",
        
        @"DOCUMENT_PATH",
        @"TEMP_PATH",
        @"CACHE_PATH",
        
        @"RGB_COLOR",
        @"RGBA_COLOR",
        @"RANDOM_COLOR",
        @"COLOR_WITH_HEX",
        
        @"FONT_SYSTEM",
        @"FONT_SYSTEM_BOLD",
        @"FONT_HELVETICA",
        @"FONT_HELVETICA_BOLD",
        @"FONT_PINGFANG_SC",
        @"FONT_PINGFANG_SC_BOLD",
        @"FONT",
        
        @"DEGREES_TO_RADIAN",
        @"RADIAN_TO_DEGREES",
        
        @"WO",
        @"WS",
        @"SS",
        
        @"IMAGE",
        @"IMAGE_IN_BUNDLE",
        
        @"BLOCK_EXEC",
        
        @"SINGLETON_FOR_HEADER",
        @"SINGLETON_FOR_CLASS",
        
        @"LOCALIZED_STRING",
        @"LOCALIZED_STRING_IN_BUNDLE",
        @"LOCALIZED_STRING_FROM_TABLE_IN_BUNDLE",
    ];
}

@end
