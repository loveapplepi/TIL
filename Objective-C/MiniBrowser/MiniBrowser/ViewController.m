//
//  ViewController.m
//  MiniBrowser
//
//  Created by loveapplepi on 14/05/2019.
//  Copyright © 2019 loveapplepi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mainWebView, textField, bookmarkSegmentedControl, activityIndicatorView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlString = @"https://www.facebook.com";
    [mainWebView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString: urlString]]];
    textField.text = urlString;
    textField.delegate = self;
    mainWebView.delegate = self;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *urlString = textField.text;
    if (![urlString hasPrefix:@"https://"]) {
        urlString = [[NSString alloc]initWithFormat:@"https://%@",urlString];
    }
    [mainWebView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString: urlString]]];
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)bookmarkAction:(id)sender {
    NSString *bookmarkURL = [bookmarkSegmentedControl titleForSegmentAtIndex: bookmarkSegmentedControl.selectedSegmentIndex];
    
    NSString *urlString = [[NSString alloc]initWithFormat:@"https://www.%@.com", bookmarkURL];
    [mainWebView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString: urlString]]];
    textField.text = urlString;
}

- (IBAction)backAction:(id)sender {
    [mainWebView goBack];
}

- (IBAction)forwardAction:(id)sender {
    [mainWebView goForward];
}

- (IBAction)stopAction:(id)sender {
    [mainWebView stopLoading];
}

- (IBAction)refreshAction:(id)sender {
    [mainWebView reload];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [activityIndicatorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [activityIndicatorView stopAnimating];
}

@end
