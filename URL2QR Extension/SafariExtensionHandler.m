//
//  SafariExtensionHandler.m
//  URL2QR Extension
//
//  Created by yonglinwang on 2019/9/4.
//  Copyright © 2019 xxstudio. All rights reserved.
//

#import "SafariExtensionHandler.h"
#import "SafariExtensionViewController.h"

@interface SafariExtensionHandler ()
@end

@implementation SafariExtensionHandler

- (void)messageReceivedWithName:(NSString *)messageName fromPage:(SFSafariPage *)page userInfo:(NSDictionary *)userInfo {
    // This method will be called when a content script provided by your extension calls safari.extension.dispatchMessage("message").
//    if([messageName isEqualToString:@"PageLoad"]){
//
//        [page getPagePropertiesWithCompletionHandler:^(SFSafariPageProperties *properties) {
//            NSLog(@"The extension received a message (%@) from a script injected into (%@) with userInfo (%@)", messageName, properties.url, userInfo);
//            self.currentPageURL = properties.url;
//        }];
//    }
}

- (void)toolbarItemClickedInWindow:(SFSafariWindow *)window {
    // This method will be called when your toolbar item is clicked.
    NSLog(@"The extension's toolbar item was clicked %@",window);
}

- (void)validateToolbarItemInWindow:(SFSafariWindow *)window validationHandler:(void (^)(BOOL enabled, NSString *badgeText))validationHandler {
    // This method will be called whenever some state changes in the passed in window. You should use this as a chance to enable or disable your toolbar item and set badge text.
    validationHandler(YES, nil);
}

- (SFSafariExtensionViewController *)popoverViewController {
    return [SafariExtensionViewController sharedController];
}


- (void)popoverWillShowInWindow:(SFSafariWindow *)window{
    [window getActiveTabWithCompletionHandler:^(SFSafariTab * _Nullable activeTab) {
        [activeTab getPagesWithCompletionHandler:^(NSArray<SFSafariPage *> * _Nullable pages) {
            [pages enumerateObjectsUsingBlock:^(SFSafariPage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [obj getPagePropertiesWithCompletionHandler:^(SFSafariPageProperties * _Nullable properties) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [[SafariExtensionViewController sharedController] showCurrentURL:properties.url];
                        * stop = YES;
                    });
                }];
            }];
        }];
    }];
}

/// This is called after the extension's popover is closed.
- (void)popoverDidCloseInWindow:(SFSafariWindow *)window{
    NSLog(@"popoverDidCloseInWindow");
}

@end
