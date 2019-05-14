//
//  ViewController.h
//  MiniBrowser
//
//  Created by loveapplepi on 14/05/2019.
//  Copyright © 2019 loveapplepi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISegmentedControl *bookmarkSegmentedControl;
@property (strong, nonatomic) IBOutlet UIWebView *mainWebView;
@property (strong, nonatomic) IBOutlet UITextField *textField;



@end

