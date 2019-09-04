//
//  SafariExtensionViewController.h
//  URL2QR Extension
//
//  Created by 王永林 on 2019/9/4.
//  Copyright © 2019 xxstudio. All rights reserved.
//

#import <SafariServices/SafariServices.h>

@interface SafariExtensionViewController : SFSafariExtensionViewController

+ (SafariExtensionViewController *)sharedController;

@end
