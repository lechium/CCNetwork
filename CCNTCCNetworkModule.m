#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <TVSystemMenuUI/TVSMButtonViewController.h>
#include "CCNTCCNetworkModule.h"
#import <MobileCoreServices/LSApplicationWorkspace.h>

@interface LSApplicationWorkspace (more)
- (BOOL)openURL:(id)url;
@end

@implementation CCNTCCNetworkModule

+(long long)buttonStyle {
    return 1;
}

-(id)contentViewController {
    
    TVSMButtonViewController *buttonController = (TVSMButtonViewController*)[super contentViewController];
    NSString *btIcon = [[self bundle] pathForResource:@"icon" ofType:@"png"];
    [buttonController setImage:[[UIImage imageWithContentsOfFile:btIcon] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    
    return buttonController;
}

-(void)handleAction {
    
    [[NSBundle bundleWithPath:@"/System/Library/Frameworks/CoreServices.framework/"] load];
    [[LSApplicationWorkspace defaultWorkspace] openURL:[NSURL URLWithString:@"app-prefs:settings-network"]];
   
}

-(BOOL)dismissAfterAction {
    return TRUE;
}

@end
