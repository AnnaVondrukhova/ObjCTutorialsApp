//
//  Video.h
//  ObjCTutorialsApp
//
//  Created by Anya on 27.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Video : NSObject
- (id) initWithDictionary:(NSDictionary *)dictionary;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *descr;
@property (nonatomic, strong) NSString *iFrame;
@property (nonatomic, strong) NSString *thumbnailUrl;

@end

NS_ASSUME_NONNULL_END
