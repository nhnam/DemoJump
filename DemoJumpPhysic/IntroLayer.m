//
//  IntroLayer.m
//  DemoJumpPhysic
//
//  Created by Nam Nguyen on 3/1/14.
//  Copyright Nam Nguyen 2014. All rights reserved.
//


// Import the interfaces
#import "IntroLayer.h"
#import "HelloWorldLayer.h"
#import "GameController.h"

#pragma mark - IntroLayer

// HelloWorldLayer implementation
@implementation IntroLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	IntroLayer *layer = [IntroLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

/*----------------------------------------------------------------------------
 Method:      init   init
 -----------------------------------------------------------------------------*/
-(id) init
{
	if( (self=[super init])) {

		// ask director for the window size
		CGSize size = [Director winSize];
		CCSprite *background;
		if( IS_IPAD ) {
			background = SpriteWithFile(@"Default-Landscape~ipad.png");
		} else {
			background = SpriteWithFile(@"Default.png");
			background.rotation = 90;
		}
		background.position = ccp(size.width/2, size.height/2);
		// add the label as a child to this Layer
		[self addChild: background];
	}
	
	return self;
}

/*----------------------------------------------------------------------------
 Method:      onEnter   on Enter Game Layer
 -----------------------------------------------------------------------------*/
-(void) onEnter{
	[super onEnter];
	[controller replace:[HelloWorldLayer scene]];
}
@end
