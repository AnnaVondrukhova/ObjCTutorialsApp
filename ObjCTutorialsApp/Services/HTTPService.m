//
//  HTTPService.m
//  ObjCTutorialsApp
//
//  Created by Anya on 26.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import "HTTPService.h"
#define URL_BASE "http://localhost:6060"
#define URL_TUTORIALS "/tutorials"

@implementation HTTPService
+ (id) shared {
    static HTTPService *shared = nil;
    
    @synchronized (self) {
        if(shared == nil) {
            shared = [[self alloc] init];
        }
        return shared;
    }
}

- (void) getTutorials:(onComplete)completionHandler {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"%s%s", URL_BASE, URL_TUTORIALS]];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data != nil) {
            NSError *err;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                completionHandler(json, nil);
            } else {
                completionHandler(nil, @"Data is corrupted");
            }
        } else {
            NSLog(@"Error: %@", error.debugDescription);
            completionHandler(nil, @"Can't connect to the server");
        }
    }] resume];
}
@end
