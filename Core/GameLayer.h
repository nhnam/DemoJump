//
//  GameLayer.h
//  DemoJumpPhysic
//
//  Created by Nam Nguyen on 3/1/14.
//  Copyright (c) 2014 Nam Nguyen. All rights reserved.
//

#import "CCLayer.h"
@interface GameLayer : CCLayer{
    NSMutableArray *sprites;
    GLint width_;
    GLint height_;
}
//@property (nonatomic, assign) GLint width;
//@property (nonatomic, assign) GLint height;

-(void)update:(ccTime)delta;
@end
