//
//  VMOrganizationDetailViewController.m
//  OrganizationList
//
//  Created by Владимир Микита on 04.07.16.
//  Copyright © 2016 Vladimir Mikita. All rights reserved.
//

#import "VMOrganizationDetailViewController.h"
#import "VMNetworkingManager.h"
#import "VMOrganization.h"

@interface VMOrganizationDetailViewController ()

@end

@implementation VMOrganizationDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if (self.organization.orgDescription == nil) {
        
        [[VMNetworkingManager sharedManager] getRequestWithParameters:@{@"id":self.organization.orgId} success:^(NSArray *responseObject) {
            
            NSDictionary *orgDescription = responseObject.firstObject;
            self.organization.orgDescription = [orgDescription objectForKey:@"description"];
            
            self.descriptionLabel.text = self.organization.orgDescription;
            
        } failure:^(NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }
    
    self.nameLabel.text = self.organization.orgName;
    self.descriptionLabel.text = self.organization.orgDescription;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
