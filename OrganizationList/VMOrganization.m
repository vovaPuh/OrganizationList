//
//  VMOrganization.m
//  OrganizationList
//
//  Created by Владимир Микита on 04.07.16.
//  Copyright © 2016 Vladimir Mikita. All rights reserved.
//

#import "VMOrganization.h"

@implementation VMOrganization

- (instancetype)initWithName:(NSString *)name andID:(NSString *)orgId {
    
    self = [super init];
    
    if (self) {
        _orgName = name;
        _orgId = orgId;
    }
    
    return self;
}

@end
