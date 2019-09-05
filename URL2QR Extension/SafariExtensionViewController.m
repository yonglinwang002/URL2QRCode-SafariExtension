//
//  SafariExtensionViewController.m
//  URL2QR Extension
//
//  Created by yonglinwang on 2019/9/4.
//  Copyright © 2019 xxstudio. All rights reserved.
//

#import "SafariExtensionViewController.h"
#import <Cocoa/Cocoa.h>
#import <CoreImage/CoreImage.h>

static const CGFloat imageSizeWidth = 400;

@interface SafariExtensionViewController ()
@property (nonatomic,strong) NSImageView * imageView;
@property (nonatomic,strong) NSTextView * textView;
@end

@implementation SafariExtensionViewController

+ (SafariExtensionViewController *)sharedController {
    static SafariExtensionViewController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[SafariExtensionViewController alloc] init];
        sharedController.preferredContentSize = NSMakeSize(270, 310);
    });
    return sharedController;
}

-(void)viewDidLoad{
    self.imageView =[[NSImageView alloc] initWithFrame:CGRectMake(15, 15, 240, 240)];
    self.imageView.layer.backgroundColor =[NSColor redColor].CGColor;
    [self.imageView setImageScaling:NSImageScaleAxesIndependently];
    [self.view addSubview:self.imageView];
}

-(CIImage *)createImageWithString:(NSString *)string{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    
    CIImage *image = [filter outputImage];
    
    CGRect imageSize = CGRectIntegral(image.extent);
    CGSize outputSize = CGSizeMake(imageSizeWidth,imageSizeWidth);
    CIImage *imageByTransform = [image imageByApplyingTransform:CGAffineTransformMakeScale(outputSize.width/CGRectGetWidth(imageSize), outputSize.height/CGRectGetHeight(imageSize))];
    
    return imageByTransform;
}

-(void)showCurrentURL:(NSURL *)url{
    NSCIImageRep * rep = [NSCIImageRep imageRepWithCIImage:[self createImageWithString:url.absoluteString]];
    NSImage * nsImage = [[NSImage alloc] initWithSize:CGSizeMake(imageSizeWidth, imageSizeWidth)];
    [nsImage addRepresentation:rep];
    self.imageView.image =nsImage;
}
@end
