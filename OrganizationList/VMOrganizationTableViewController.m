//
//  VMOrganizationTableViewController.m
//  OrganizationList
//
//  Created by Владимир Микита on 04.07.16.
//  Copyright © 2016 Vladimir Mikita. All rights reserved.
//

#import "VMOrganizationTableViewController.h"
#import "VMOrganizationDetailViewController.h"
#import "VMNetworkingManager.h"
#import "VMOrganization.h"

@class VMOrganization;

@interface VMOrganizationTableViewController ()

@property (strong, nonatomic) NSMutableArray *organizationArray;

@end

@implementation VMOrganizationTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.organizationArray = [NSMutableArray array];
    
    [[VMNetworkingManager sharedManager] getRequestWithParameters:nil success:^(NSArray *responseObject) {
        
        for (NSDictionary *object in responseObject) {
            
            VMOrganization *organization = [[VMOrganization alloc] initWithName:[object objectForKey:@"name"] andID:[object valueForKey:@"id"]];
            [self.organizationArray addObject:organization];
        }
        
        [self.organizationArray sortUsingComparator:^NSComparisonResult(VMOrganization *obj1, VMOrganization *obj2) {
            return [obj1.orgName compare:obj2.orgName];
        }];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"Error: %@", error.localizedDescription);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.organizationArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VMOrganization *organization = [self.organizationArray objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = organization.orgName;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showOrganizationDetail"]) {
        
        VMOrganizationDetailViewController *detailVC = (VMOrganizationDetailViewController *)segue.destinationViewController;
        detailVC.organization = [self.organizationArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
}

@end
