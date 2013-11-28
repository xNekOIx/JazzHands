//
//  IFTTTCenterAnimation.m
//  JazzHandsDemo
//
//  Created by Kostya Bychkov on 11/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTCenterAnimation.h"

@implementation IFTTTCenterAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;
    
    IFTTTAnimationFrame *animationFrame = [self animationFrameForTime:time];
    self.view.center = animationFrame.center;
}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    NSInteger startTime = startKeyFrame.time;
    NSInteger endTime = endKeyFrame.time;
    CGPoint startLocation = startKeyFrame.center;
    CGPoint endLocation = endKeyFrame.center;
    
    CGPoint center = self.view.center;
    center.x = [self tweenValueForStartTime:startTime endTime:endTime startValue:startLocation.x endValue:endLocation.x atTime:time];
    center.y = [self tweenValueForStartTime:startTime endTime:endTime startValue:startLocation.y endValue:endLocation.y atTime:time];
    
    IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
    animationFrame.center = center;
    
    return animationFrame;
}

@end
