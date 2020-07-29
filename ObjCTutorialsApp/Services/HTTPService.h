//
//  HTTPService.h
//  ObjCTutorialsApp
//
//  Created by Anya on 26.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete) (NSArray * _Nullable dataArray, NSString * _Nullable errorMessage);

@interface HTTPService : NSObject
+ (id) shared;
- (void) getTutorials: (nullable onComplete)completionHandler;
@end

