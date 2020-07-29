//
//  ViewController.m
//  ObjCTutorialsApp
//
//  Created by Anya on 26.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "VideoCell.h"
#import "VideoViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *videoList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [[HTTPService shared] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errorMessage) {
        if (dataArray) {
            NSMutableArray *videoArray = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in dataArray) {
                Video *video = [[Video alloc] initWithDictionary: dict];
                [videoArray addObject: video];
            }
            
            self.videoList = videoArray;
            NSLog(@"%@",self.videoList.debugDescription);
            [self updateTableView];

        } else if (errorMessage) {
            //show alert
        }
    }];
}

- (void) updateTableView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    VideoCell *cell = (VideoCell *)[tableView dequeueReusableCellWithIdentifier:@"videoCell"];
    if (!cell) {
        return [[VideoCell alloc]init];
    }
    
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    [cell configure:video];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"videoVCsegue" sender: video];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.videoList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90.0;
};

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    VideoViewController *vc = (VideoViewController *)segue.destinationViewController;
    vc.video = (Video *)sender;
}

@end
