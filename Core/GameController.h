//
//  GameController.h
//  DemoJumpPhysic
//
//  Created by Nam Nguyen on 3/1/14.
//  Copyright (c) 2014 Nam Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject
{
    CCDirector *_director;
    GLint _backingWidth;
    GLint _backingHeight;
}

@property (nonatomic, assign) GLint width;
@property (nonatomic, assign) GLint height;

+(GameController*)shareInstance;

#pragma mark - Scenes
-(void)startWithDirector:(CCDirector*)director;
-(CCScene*)startScene;
-(void) replace:(CCScene*)aScene;

#pragma mark - Resources
-(void)loadSprites;
-(CCSprite*)getMeSprite:(NSString*)aFrameName;

#pragma mark - Audio
@end
