//
//  Hero.m
//  DemoJumpPhysic
//
//  Created by Nam Nguyen on 3/1/14.
//  Copyright (c) 2014 Nam Nguyen. All rights reserved.
//

#import "Hero.h"
#import "JFRandom.h"

@implementation Hero

-(id)initWithGameLayer:(GameLayer *)aLayer{
    if(self = [super  initWithGameLayer:aLayer]){
        sprite_ = [controller getMeSprite:@"boss-3-1.png"];
        pos_x = layerWidth / 2;
        pos_y = layerHeight / 2;
        vel_x = 0;
        vel_y = 200;
        acc_x = 0;
        acc_y = -370.0f;
    }
    return self;
}
/*----------------------------------------------------------------------------
 Method:      <#method name#>   <#description#>
 -----------------------------------------------------------------------------*/
-(void)update:(ccTime)delta{
    //  pos_x += vel_x * delta;
    pos_x = ((int)pos_x + (int)layerWidth) % (int)layerWidth;
    vel_y += acc_y * delta;
    pos_y += vel_y * delta;
    pos_x += vel_x * delta;
    if(pos_y<=100){
        vel_y = 200 + fabsf(vel_x);
    }else{
        
    }
    [sprite_ setPosition:ccp(pos_x, pos_y)];
}
/*----------------------------------------------------------------------------
 Method:
 -----------------------------------------------------------------------------*/
-(void)updateAcceleration:(UIAcceleration*)acceleration{
    vel_x = vel_x * 0.05f + acceleration.x * 340.0f;
}
-(void)layerDidTouched:(UITouch*)aTouch{
    vel_y = 200;
    DLog(@"Touch");
}
-(void)putOn{
    [super putOn];
    sprite_.position = ccp(arc4random() % (int)layerWidth, arc4random() % (int)layerHeight);
    name_ = [JFRandom generateRandomStringOfLength:10];
}
@end
