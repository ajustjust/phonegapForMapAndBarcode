//
//  CDMap.m
//  插件demo
//
//  Created by xxzx on 15/6/17.
//
//

#import "CDMap.h"
#import <Cordova/CDV.h>
#import "MapViewController.h"
@implementation CDMap



- (void)Map:(CDVInvokedUrlCommand*)command
{
    
    __weak CDMap* weakSelf = self;
      NSLog(@"成功调用了本地代码");
    [self.commandDelegate runInBackground:^{
     
        
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];
    
    if (echo != nil && [echo length] > 0) {
         NSLog(@"成功echo是%@",echo);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
        
    } else {
        NSLog(@"错误pluginResult");

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
           }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    NSLog(@"ID是%@",command.callbackId);
    
        
        
        MapViewController* mapVc = [[MapViewController alloc] init];
        weakSelf.MapVc = mapVc;
        
        
        // Perform UI operations on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            
           
            [weakSelf.viewController presentViewController:mapVc animated:YES completion:^{
                 NSLog(@"ok----");
            }];
 

            
        });

           

        
        
    }];
}
@end
