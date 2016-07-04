//
//  VMOrganizationDetailViewController.h
//  OrganizationList
//
//  Created by Владимир Микита on 04.07.16.
//  Copyright © 2016 Vladimir Mikita. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VMOrganization;

@interface VMOrganizationDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (strong, nonatomic) VMOrganization *organization;

@end
