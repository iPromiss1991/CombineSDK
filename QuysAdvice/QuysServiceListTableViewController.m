//
//  QuysServiceListTableViewController.m
//  quysDevDemo
//
//  Created by quys on 2020/1/7.
//  Copyright © 2020 Quys. All rights reserved.
//

#import "QuysServiceListTableViewController.h"

@interface QuysServiceListTableViewController ()
@property (nonatomic,strong) NSMutableArray *arrServiceList;

@end

@implementation QuysServiceListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"广告类型";
    self.tableView.backgroundColor = [UIColor purpleColor];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
     return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.arrServiceList.count;
}

 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor purpleColor];
    [cell.textLabel setText:self.arrServiceList[indexPath.row]];
    // Configure the cell...
    
    return cell;
}
 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *vc = nil;
    NSString *strService = self.arrServiceList[indexPath.row];

    if ([strService containsString:@"Banner"])
    {
        vc = [[NSClassFromString(@"QuysBannerVC") alloc] init ];
        [vc setValue:@"qystest_banner" forKey:@"businessID"];
        [vc setValue:@"DF6CB421D36AE5B518700B40A77105A7" forKey:@"businessKey"];

    }else if ([strService containsString:@"插屏"])
    {
        vc = [[NSClassFromString(@"QuysSplashVC") alloc] init ];
               [vc setValue:@"quystest-cp" forKey:@"businessID"];
               [vc setValue:@"8EB8AC0B397CA55C2D78DE88DF8587C2" forKey:@"businessKey"];
        
    }else if ([strService containsString:@"信息流"])
    {
        vc = [[NSClassFromString(@"InformationFlowVC") alloc] init ];
               [vc setValue:@"quystest-xx" forKey:@"businessID"];
               [vc setValue:@"3A6511273E535FA02C15F37D17D22A95" forKey:@"businessKey"];
        
    }else if ([strService containsString:@"激励视频"])
    {
        vc = [[NSClassFromString(@"QuysIncentiveVideoVC") alloc] init ];
               [vc setValue:@"jlAdtest" forKey:@"businessID"];
               [vc setValue:@"1262DF2885ACB4EEC8FF0486502E7A6D" forKey:@"businessKey"];
        
    }
    vc.title = strService;

    
    if (self.navigationController)
    {
        [self.navigationController pushViewController:vc animated:YES];
    }else
    {
        [self presentViewController:vc animated:YES completion:nil];
        
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Init

- (NSMutableArray *)arrServiceList
{
    if (_arrServiceList == nil)
    {
        _arrServiceList = [NSMutableArray arrayWithArray:@[@"Banner",@"信息流",@"插屏",@"激励视频(点击屏幕加载广告)"]];
    }return _arrServiceList;
}


@end
