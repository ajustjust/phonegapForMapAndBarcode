//
//  CDMap.h
//  插件demo
//
//  Created by xxzx on 15/6/17.
//
//

#import "CDMap.h"
#import <Cordova/CDV.h>
@class MapViewController;
@interface CDMap : CDVPlugin


@property(strong,nonatomic)MapViewController* MapVc;
- (void)Map:(CDVInvokedUrlCommand*)command;

@end
