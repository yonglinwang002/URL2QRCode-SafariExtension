//
//  ViewController.h
//  URL2QR
//
//  Created by yonglinwang on 2019/9/4.
//  Copyright © 2019 xxstudio. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak, nonatomic) IBOutlet NSTextField * appNameLabel;

- (IBAction)openSafariExtensionPreferences:(id)sender;

@end

