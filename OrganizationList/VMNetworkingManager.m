//
//  VMNetworkingManager.m
//  OrganizationList
//
//  Created by Владимир Микита on 04.07.16.
//  Copyright © 2016 Vladimir Mikita. All rights reserved.
//

#import "VMNetworkingManager.h"
#import "AFNetworking.h"

@class AFHTTPSessionManager;

@interface VMNetworkingManager ()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end

@implementation VMNetworkingManager

+ (VMNetworkingManager *)sharedManager {
    
    static VMNetworkingManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[VMNetworkingManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager] initWithBaseURL:[NSURL URLWithString:@"http://mobile.digital.paramon.ru:32080/test/"]];
        AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        serializer.stringEncoding = NSUTF8StringEncoding;
        serializer.removesKeysWithNullValues = true;
        //AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
        serializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
        //serializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
        //AFCompoundResponseSerializer *serializer = [AFCompoundResponseSerializer serializer];
        manager.responseSerializer = serializer;
        _sessionManager = manager;
        //_sessionManager = [[AFHTTPSessionManager manager] initWithBaseURL:[NSURL URLWithString:@"http://mobile.digital.paramon.ru:32080/test/"]];
    }
    
    return self;
}

- (void)getRequestWithParameters:(NSDictionary *)parameters success:(void(^)(NSArray *responseObject))success failure:(void(^)(NSError *error))failure {
    
    [self.sessionManager GET:@"" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
}

@end
