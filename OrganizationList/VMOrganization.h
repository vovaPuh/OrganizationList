//
//  VMOrganization.h
//  OrganizationList
//
//  Created by Владимир Микита on 04.07.16.
//  Copyright © 2016 Vladimir Mikita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMOrganization : NSObject

@property (strong, nonatomic) NSString *orgId;
@property (strong, nonatomic) NSString *orgName;
@property (strong, nonatomic) NSString *orgDescription;

- (instancetype)initWithName:(NSString *)name andID:(NSString *)orgId;

@end
