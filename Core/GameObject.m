//
//  GameObject.m
//  DemoJumpPhysic
//
//  Created by Nam Nguyen on 3/1/14.
//  Copyright (c) 2014 Nam Nguyen. All rights reserved.
//

#import "GameObject.h"
#import "GameLayer.h"

@implementation GameObject
@synthesize vel_x, vel_y, pos_x, pos_y, acc_x, acc_y, speed, name = name_;

-(id)init{
    if(self = [super init]){
        // init object properties.
        
    }
    return self;
}

/*----------------------------------------------------------------------------
 Method:      <#method name#>   <#description#>
 -----------------------------------------------------------------------------*/
-(id)initWithGameLayer:(GameLayer *)aLayer{
    if(self = [super init]){
        gamelayer_ = aLayer;
        
    }
    return self;
}

/*----------------------------------------------------------------------------
 Method:      <#method name#>   <#description#>
 -----------------------------------------------------------------------------*/
-(void)update:(ccTime)delta{
}

/*----------------------------------------------------------------------------
 Method:
 -----------------------------------------------------------------------------*/
-(void)updateAcceleration:(UIAcceleration*)acceleration{

}

-(void)putOn{
    [gamelayer_ addChild:sprite_];
//    sprite_.position = ccp(pos_x, pos_y);
}

-(void)layerDidTouched:(UITouch*)aTouch{

}

-(void)name:(NSString*)aName{
    name_ = aName;
}
@end
