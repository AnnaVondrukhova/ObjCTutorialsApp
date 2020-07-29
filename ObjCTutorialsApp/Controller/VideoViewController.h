//
//  VideoViewController.h
//  ObjCTutorialsApp
//
//  Created by Anya on 28.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@class Video;

NS_ASSUME_NONNULL_BEGIN

@interface VideoViewController : UIViewController <WKNavigationDelegate>
@property (nonatomic, strong) Video *video;
@end

NS_ASSUME_NONNULL_END
