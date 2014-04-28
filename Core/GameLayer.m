//
//  GameLayer.m
//  DemoJumpPhysic
//
//  Created by Nam Nguyen on 3/1/14.
//  Copyright (c) 2014 Nam Nguyen. All rights reserved.
//

#import "GameLayer.h"
#import "GameObject.h"

@interface GameLayer(Private)<UIAccelerometerDelegate>

@end

@implementation GameLayer
#pragma mark - synthersize
//@synthesize width = width_, height = height_;

#pragma mark - Init
-(id)init{
    if(self = [super init]){
        [self setUpEnviroment];
        [self schedule:@selector(update:)];
    }
    return self;
}

-(void)setUpEnviroment{
    sprites  = [[NSMutableArray alloc] init];
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}
#pragma mark Accelerometer delegate
- (void)accelerometer:(UIAccelerometer*)accelerometer
        didAccelerate:(UIAcceleration*)acceleration {
    [sprites enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([obj isKindOfClass:[GameObject class]]){
            [(GameObject*)obj updateAcceleration:acceleration];
        }
    }];
    
}
#pragma mark - Touch handler
-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    [sprites enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([obj isKindOfClass:[GameObject class]]){
            [(GameObject*)obj layerDidTouched:touch];
        }
    }];
    return YES;
}
#pragma mark  - timer
/*----------------------------------------------------------------------------
 Method:      update   update screen each interval
 -----------------------------------------------------------------------------*/
-(void)update:(ccTime)delta{
    [sprites enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if([obj isKindOfClass:[GameObject class]]){
            [(GameObject*)obj update:delta];
        }
    }];
}
// convenience methods which take a UITouch instead of CGPoint

#ifdef __CC_PLATFORM_IOS

/*----------------------------------------------------------------------------
 Method:      <#method name#>   <#description#>
 -----------------------------------------------------------------------------*/
- (CGPoint)convertTouchToNodeSpace:(UITouch *)touch
{
	CGPoint point = [touch locationInView: [touch view]];
	point = [[CCDirector sharedDirector] convertToGL: point];
	return [self convertToNodeSpace:point];
}

/*----------------------------------------------------------------------------
 Method:      <#method name#>   <#description#>
 -----------------------------------------------------------------------------*/
- (CGPoint)convertTouchToNodeSpaceAR:(UITouch *)touch
{
	CGPoint point = [touch locationInView: [touch view]];
	point = [[CCDirector sharedDirector] convertToGL: point];
	return [self convertToNodeSpaceAR:point];
}

#endif // __CC_PLATFORM_IOS
@end
