//
//  VideoCell.h
//  ObjCTutorialsApp
//
//  Created by Anya on 27.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

NS_ASSUME_NONNULL_BEGIN

@interface VideoCell : UITableViewCell
- (void)configure: (nonnull Video *)video;
@end

NS_ASSUME_NONNULL_END
