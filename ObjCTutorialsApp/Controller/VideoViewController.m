//
//  VideoViewController.m
//  ObjCTutorialsApp
//
//  Created by Anya on 28.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import "VideoViewController.h"
#import <WebKit/WebKit.h>
#import "Video.h"

@interface VideoViewController ()
@property (strong, nonatomic) IBOutlet WKWebView *webView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.webView.navigationDelegate = self;
    
    self.titleLabel.text = self.video.title;
    self.descriptionLabel.text = self.video.descr;

    NSString *urlString = self.video.iFrame;
    NSURL *url = [NSURL URLWithString:urlString];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
//    [self.webView loadHTMLString:urlString baseURL:nil];
    
}

- (IBAction)doneButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
//    NSString* path = [[NSBundle mainBundle] pathForResource:@"css"
//    ofType:@"txt"];
//    NSString* cssContent = [NSString stringWithContentsOfFile:path
//    encoding:NSUTF8StringEncoding
//       error:NULL];
//
//    NSString* js = [NSString stringWithFormat:
//                @"var styleNode = document.createElement('style');\n"
//                 "styleNode.type = \"text/css\";\n"
//                 "var styleText = document.createTextNode('%@');\n"
//                 "styleNode.appendChild(styleText);\n"
//                 "document.getElementsByTagName('head')[0].appendChild(styleNode);\n", cssContent];
//    NSLog(@"js:\n%@",js);
//    [self.webView evaluateJavaScript:js completionHandler:nil];
//}

@end
