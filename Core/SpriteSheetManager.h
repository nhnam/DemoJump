//
//  SpriteSheetManager.h
//  DemoJumpPhysic
//
//  Created by Nam Nguyen on 3/1/14.
//  Copyright (c) 2014 Nam Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpriteSheetManager : NSObject
{
    NSMutableDictionary *spriteSheets;
    int currentTag;
}

#pragma mark - Singleton Methods
+ (SpriteSheetManager *) sharedInstance;

#pragma mark - Public Methods
-(void) addSpriteSheetWithFile:(NSString*)spriteSheetFilename andTextureFormat:(NSString*)textureFormat;
-(CCSprite*) spriteWithFileOrFrame:(NSString*)filename;
-(CCSprite*) addSpriteWithFileOrFrame:(NSString*)filename toNode:(CCNode*)parentNode autoBatching:(BOOL)autoBatching;
-(CCSprite*) addSpriteWithFileOrFrame:(NSString*)filename toNode:(CCNode*)parentNode z:(int)z autoBatching:(BOOL)autoBatching;

@end
