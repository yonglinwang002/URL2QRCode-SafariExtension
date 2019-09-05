//
//  ViewController.m
//  URL2QR
//
//  Created by yonglinwang on 2019/9/4.
//  Copyright © 2019 xxstudio. All rights reserved.
//

#import "ViewController.h"
#import <SafariServices/SFSafariApplication.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appNameLabel.stringValue = @"URL2QR";
}

- (IBAction)openSafariExtensionPreferences:(id)sender {
    [SFSafariApplication showPreferencesForExtensionWithIdentifier:@"com.xxstudio.URL2QR-Extension" completionHandler:^(NSError * _Nullable error) {
        if (error) {
            // Insert code to inform the user something went wrong.
        }
    }];
}

@end
