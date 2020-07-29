//
//  VideoCell.m
//  ObjCTutorialsApp
//
//  Created by Anya on 27.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import "VideoCell.h"
#import "Video.h"

@interface VideoCell()
@property (strong, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UIView *backView;

@end

@implementation VideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 2.0;
    self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOpacity = 0.8;
    
}

- (void)configure: (nonnull Video *)video {
    self.titleLabel.text = video.title;
    self.descriptionLabel.text = video.descr;
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL: [NSURL URLWithString:video.thumbnailUrl]]];
    self.thumbnailImageView.image = image;
}
@end
