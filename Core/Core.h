//
//  Core.h
//  DemoJumpPhysic
//
//  Created by Nam Nguyen on 3/1/14.
//  Copyright (c) 2014 Nam Nguyen. All rights reserved.
//

#ifndef DemoJumpPhysic_Core_h
#define DemoJumpPhysic_Core_h

#import "GameController.h"

#define controller [GameController shareInstance]
#define DLog(...) CCLOG(@"%s(line %d) %@", __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568) ? NO:YES)
#define IS_RETINA ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))
#define layerWidth [[CCDirector sharedDirector] winSize].width
#define layerHeight [[CCDirector sharedDirector] winSize].height
#define Director [CCDirector sharedDirector]
#define SpriteWithFile(s) [CCSprite spriteWithFile:s];
#endif
