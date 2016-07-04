//
//  VMNetworkingManager.h
//  OrganizationList
//
//  Created by Владимир Микита on 04.07.16.
//  Copyright © 2016 Vladimir Mikita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMNetworkingManager : NSObject

+ (VMNetworkingManager *)sharedManager;

- (void)getRequestWithParameters:(NSDictionary *)parameters success:(void(^)(NSArray *responseObject))success failure:(void(^)(NSError *error))failure;

@end
