//
//  GameObject.h
//  DemoJumpPhysic
//
//  Created by Nam Nguyen on 3/1/14.
//  Copyright (c) 2014 Nam Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GameLayer;

@interface GameObject : NSObject{
    CCSprite *sprite_;
    GameLayer *gamelayer_;
    NSString *name_;
    float pos_x, pos_y;
	float vel_x, vel_y;
	float acc_x, acc_y;
    float speed;
}
@property ( readwrite ) float pos_x;
@property ( readwrite ) float pos_y;
@property ( readwrite ) float vel_x; // van toc
@property ( readwrite ) float vel_y;
@property ( readwrite ) float acc_x; // gia toc 
@property ( readwrite ) float acc_y;
@property ( readwrite ) float speed;

@property(nonatomic, retain) NSString *name;

-(void)name:(NSString*)aName;

-(id)initWithGameLayer:(GameLayer *)aLayer;

-(void)update:(ccTime)delta;

-(void)updateAcceleration:(UIAcceleration*)acceleration;

-(void)putOn;

-(void)layerDidTouched:(UITouch*)aTouch;
@end
