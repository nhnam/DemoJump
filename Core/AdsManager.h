//
//  AdsManager.h
//  DemoJumpPhysic
//
//  Created by Nam Nguyen on 3/1/14.
//  Copyright (c) 2014 Nam Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GADBannerView.h"
#import <dispatch/dispatch.h>
#define ADMOB_BANNER_UNIT_ID  ((IS_IPAD) ? @"a1526954f69b314"  : @"a1526955dc20272" );
typedef enum _bannerType
{
    kBanner_Portrait_Top,
    kBanner_Portrait_Bottom,
    kBanner_Landscape_Top,
    kBanner_Landscape_Bottom,
}CocosBannerType;

#define BANNER_TYPE kBanner_Portrait_Top

// Add new instance variable
dispatch_queue_t backgroundQueue;

@interface AdsManager : NSObject
{
    CocosBannerType bannerType_;
    GADBannerView *bannerView_;
    float on_x, on_y, off_x, off_y;
}

+(AdsManager*)sharedInstance;
-(void)getBannerWithRoot:(UIViewController*)theRootViewController;
-(void)hideBannerView;
-(void)showBannerView;

@end
