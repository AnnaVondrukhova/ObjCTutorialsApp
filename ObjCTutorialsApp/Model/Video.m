//
//  Video.m
//  ObjCTutorialsApp
//
//  Created by Anya on 27.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import "Video.h"

@interface Video()
@end

@implementation Video

- (id) initWithDictionary:(NSDictionary *)dictionary {
    self.title = [dictionary objectForKey:@"title"];
    self.descr = [dictionary objectForKey:@"description"];;
    self.iFrame = [dictionary objectForKey:@"iframe"];;
    self.thumbnailUrl = [dictionary objectForKey:@"thumbnail"];
    
    return self;
}
@end
