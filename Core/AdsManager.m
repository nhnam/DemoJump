//
//  AdsManager.m
//  DemoJumpPhysic
//
//  Created by Nam Nguyen on 3/1/14.
//  Copyright (c) 2014 Nam Nguyen. All rights reserved.
//

#import "AdsManager.h"
#import "cocos2d.h"

@implementation AdsManager
static AdsManager *sharedInstance = nil;

+(AdsManager*)sharedInstance{
    @synchronized(self){
        if(!sharedInstance){
            sharedInstance = [[AdsManager alloc] init];
             backgroundQueue = dispatch_queue_create("com.namnguyen.demojump.adsqueue", NULL);
        }
    }
    return  sharedInstance;
}

-(void)getBannerWithRoot:(UIViewController*)theRootViewController{
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        
        bannerType_ = BANNER_TYPE;
        
        if(bannerType_ <= kBanner_Portrait_Bottom){
            bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];
        }else{
            bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerLandscape];
        }
        
        bannerView_.adUnitID = ADMOB_BANNER_UNIT_ID;
        
        bannerView_.rootViewController = theRootViewController;
        [theRootViewController.view addSubview:bannerView_];
        
        [bannerView_ loadRequest:[GADRequest request]];
        
        CGRect frame = bannerView_.frame;
        
        off_x = 0.0f;
        on_x = 0.0f;
        
        switch (bannerType_)
        {
            case kBanner_Portrait_Top:
            {
                off_y = -frame.size.height;
                on_y = 0.0f;
            }
                break;
            case kBanner_Portrait_Bottom:
            {
                off_y = layerHeight;
                on_y = layerHeight - frame.size.height;
            }
                break;
            case kBanner_Landscape_Top:
            {
                off_y = -frame.size.height;
                on_y = 0.0f;
            }
                break;
            case kBanner_Landscape_Bottom:
            {
                off_y = layerHeight;
                on_y = layerHeight - frame.size.height;
            }
                break;
                
            default:
                break;
        }
        
        frame.origin.y = off_y;
        frame.origin.x = off_x;
        
        bannerView_.frame = frame;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        
        frame = bannerView_.frame;
        frame.origin.x = on_x;
        frame.origin.y = on_y;
        
        bannerView_.frame = frame;
        [UIView commitAnimations];
        
        });
}

-(void)showBannerView
{
    if (bannerView_)
    {
        //banner on bottom
//        {
//            CGRect frame = bannerView_.frame;
//            frame.origin.y = off_y;
//            frame.origin.x = on_x;
//            bannerView_.frame = frame;
//            
//            [UIView animateWithDuration:0.5
//                                  delay:0.1
//                                options: UIViewAnimationCurveEaseOut
//                             animations:^
//             {
//                 CGRect frame = bannerView_.frame;
//                 frame.origin.y = on_y;
//                 frame.origin.x = on_x;
//                 
//                 bannerView_.frame = frame;
//             }
//                             completion:^(BOOL finished)
//             {
//             }];
//        }
//        Banner on top
        {
            CGRect frame = bannerView_.frame;
            frame.origin.y = -frame.size.height;
            frame.origin.x = off_x;
            bannerView_.frame = frame;

            [UIView animateWithDuration:0.5
                                  delay:0.1
                                options: UIViewAnimationCurveEaseOut
                             animations:^
             {
                 CGRect frame = bannerView_.frame;
                 frame.origin.y = 0.0f;
                 frame.origin.x = off_x;
                 bannerView_.frame = frame;
             }
                             completion:^(BOOL finished)
             {


             }];
        }
        
    }
    
}


-(void)hideBannerView
{
    if (bannerView_)
    {
        [UIView animateWithDuration:0.5
                              delay:0.1
                            options: UIViewAnimationCurveEaseOut
                         animations:^
         {
             CGRect frame = bannerView_.frame;
             frame.origin.y = off_y;
             frame.origin.x = off_x;
             bannerView_.frame = frame;
         }
                         completion:^(BOOL finished)
         {
             
             
         }];
    }
}


-(void)dismissAdView
{
    if (bannerView_)
    {
        [UIView animateWithDuration:0.5
                              delay:0.1
                            options: UIViewAnimationCurveEaseOut
                         animations:^
         {
             
             CGRect frame = bannerView_.frame;
             frame.origin.y = frame.origin.y + frame.size.height ;
             frame.origin.x = (layerWidth/2.0f - frame.size.width/2.0f);
             bannerView_.frame = frame;
         }
                         completion:^(BOOL finished)
         {
             [bannerView_ setDelegate:nil];
             [bannerView_ removeFromSuperview];
             bannerView_ = nil;
             
         }];
    }
    
}
-(void)dealloc{
    dispatch_release(backgroundQueue);
    [super dealloc];
}
@end
