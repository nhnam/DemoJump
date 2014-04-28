//
//  GameController.m
//  DemoJumpPhysic
//
//  Created by Nam Nguyen on 3/1/14.
//  Copyright (c) 2014 Nam Nguyen. All rights reserved.
//

#import "GameController.h"
#import "IntroLayer.h"
#import "SpriteSheetManager.h"

#define  spriteManager [SpriteSheetManager sharedInstance]

@implementation GameController

@synthesize  width = _backingWidth, height = _backingHeight;

static GameController *sharedInstance = nil;

/*----------------------------------------------------------------------------
 Method:      <#method name#>   <#description#>
 -----------------------------------------------------------------------------*/
+(GameController*)shareInstance{
    @synchronized(self){
        if(!sharedInstance){
            sharedInstance = [[self alloc] init];
        }
        return sharedInstance;
    }
}

/*----------------------------------------------------------------------------
 Method:      <#method name#>   <#description#>
 -----------------------------------------------------------------------------*/
-(id)init{
    if(self = [super init]){
        glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &_backingWidth);
        glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, &_backingHeight);
        [self loadSprites];
    }
    return self;
}

/*----------------------------------------------------------------------------
 Method:      <#method name#>   <#description#>
 -----------------------------------------------------------------------------*/
-(void)startWithDirector:(CCDirector *)director{
    _director = director;
}

/*----------------------------------------------------------------------------
 Method:      startScence   Init and return the first scene of app
 -----------------------------------------------------------------------------*/
-(CCScene*)startScene{
    CCScene *scene = [CCScene node];
    IntroLayer *introLayerNode = [IntroLayer node];
    [scene addChild:introLayerNode];
    return scene;
}

-(void) replace:(CCScene*)aScene{
    [_director replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:aScene]];
}

#pragma mark - Resources
-(void)loadSprites{
    [spriteManager addSpriteSheetWithFile:@"sprites.plist"
                         andTextureFormat:@"png"];
}

-(CCSprite*)getMeSprite:(NSString*)aFrameName{
    return [spriteManager spriteWithFileOrFrame:aFrameName];
}
@end
