//
//  playerScene.m
//  game5Test
//
//  Created by broy denty on 14-10-15.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "playerScene.h"

@implementation playerScene
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor whiteColor];
        self.scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        [self.scoreLabel setFontColor:[UIColor grayColor]];
        self.scoreLabel.text = @"0";
        self.scoreLabel.fontSize = 30;
        self.scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        self.scoreLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeTop;
        self.scoreLabel.position = CGPointMake(10, self.frame.size.height - 20);
        
        [self addChild:self.scoreLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
        [self addMonster];
    }
}

- (void)addMonster {
    
    // Create sprite
//    SKSpriteNode * monster = [SKSpriteNode spriteNodeWithImageNamed:@"monster"];
    SKSpriteNode * monster = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(100, 100)];
    
    
    // Determine where to spawn the monster along the Y axis
    int minY = monster.size.height / 2;
    int maxY = self.frame.size.height - monster.size.height / 2;
    int rangeY = maxY - minY;
    int actualY = (arc4random() % rangeY) + minY;
    
    // Create the monster slightly off-screen along the right edge,
    // and along a random position along the Y axis as calculated above
    monster.position = CGPointMake(self.frame.size.width + monster.size.width/2, actualY);
    [self addChild:monster];
    
    // Determine speed of the monster
    int minDuration = 2.0;
    int maxDuration = 4.0;
    int rangeDuration = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration;
    
    // Create the actions
    SKAction * actionMove = [SKAction moveTo:CGPointMake(-monster.size.width/2, actualY) duration:actualDuration];
    SKAction * actionMoveDone = [SKAction removeFromParent];
    [monster runAction:[SKAction sequence:@[actionMove, actionMoveDone]]];
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {

        [self addMonster];

}
@end
