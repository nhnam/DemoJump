//
//  HelloWorldLayer.h
//  DemoJumpPhysic
//
//  Created by Nam Nguyen on 3/1/14.
//  Copyright Nam Nguyen 2014. All rights reserved.
//


#import <GameKit/GameKit.h>
#import "GameLayer.h"
// HelloWorldLayer
@interface HelloWorldLayer : GameLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
