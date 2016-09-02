//
//  DWWebViewVC.m
//  photo
//
//  Created by 宋元明 on 16/8/29.
//  Copyright © 2016年 宋元明. All rights reserved.
//

#import "DWWebViewVC.h"
#import "MJPhoto.h"
#import "MJPhotoBrowser.h"
#import "UIView+Extension.h"
#import "Tools.h"

@interface DWWebViewVC ()<UIWebViewDelegate>
@property (nonatomic,weak)UIWebView *myWebView;
@property (nonatomic,strong) NSMutableArray *arrayImagesList;//web中所有图片
@end

@implementation DWWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] init];
    [self.view addSubview:webView];
    webView.frame = self.view.bounds;
    self.myWebView = webView;
    webView.dataDetectorTypes = UIDataDetectorTypeLink;
    webView.userInteractionEnabled = YES;
    webView.delegate = self;
    webView.scrollView.bounces = NO;
//    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"html"];
//    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//    [self.myWebView loadHTMLString:htmlString baseURL:[NSURL URLWithString:filePath]];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://cool.qctt.cn/html/mobile/newsinfo?id=57379&userid=&hiddenTag=1/hiddenTag/1"]]];
}


#pragma mark UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [Tools addJavaScriptWithWebView:webView];
    [webView stringByEvaluatingJavaScriptFromString:@"setImage();"];
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    NSString *urls = [webView stringByEvaluatingJavaScriptFromString:@"getAllImageUrl();"];
//    NSString *string = [self.myWebView stringByEvaluatingJavaScriptFromString:@"get_images();"];
    
//    NSArray *arrimages = [string componentsSeparatedByString:@" "];
    NSArray *arrimages = [urls componentsSeparatedByString:@","];

    NSString *requestString = [[request URL] absoluteString];
    NSArray *components = [requestString componentsSeparatedByString:@"::"];
    if ([components[0] isEqualToString:@"clickgirl"]) {
        int imgIndex = [components[1] intValue];
        CGRect frame = CGRectMake([components[2] floatValue], [components[3] floatValue], [components[4] floatValue], [components[5] floatValue]);
        frame = CGRectMake(frame.origin.x, frame.origin.y  + 64, frame.size.width, frame.size.height);
        
        NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
        for (NSInteger i = 0; i<arrimages.count; i++) {
            MJPhoto *photo = [[MJPhoto alloc] init];
            //提供源视图坐标
            if (imgIndex == i) {
                photo.frame = frame;
            }
            photo.url = [NSURL URLWithString:arrimages[i]];
            [arr addObject:photo];
        }
        MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
        browser.currentPhotoIndex = imgIndex;
        browser.photos = arr;
        [browser show];
        return NO;
        
    }
    return YES;
}


@end
