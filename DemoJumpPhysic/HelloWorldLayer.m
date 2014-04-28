//
//  HelloWorldLayer.m
//  DemoJumpPhysic
//
//  Created by Nam Nguyen on 3/1/14.
//  Copyright Nam Nguyen 2014. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "Hero.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	HelloWorldLayer *layer = [HelloWorldLayer node];
	[scene addChild: layer];
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
		CCSprite *bg = [CCSprite spriteWithFile:@"background.png"];
        [self addChild:bg];
        bg.position = ccp(layerWidth/2, layerHeight/2);
        Hero *hero = [[Hero alloc] initWithGameLayer:self];
        [sprites addObject:hero];
        [hero putOn];
        [hero release];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

//-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    
//}
//-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
////    Hero *hero = [[Hero alloc] initWithGameLayer:self];
////    [sprites addObject:hero];
////    [hero putOn];
////    [hero setPos_x:[super convertTouchToNodeSpace:touch].x];
////    [hero setPos_y:[super convertTouchToNodeSpace:touch].y];
////    [hero release];
//    
//}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
