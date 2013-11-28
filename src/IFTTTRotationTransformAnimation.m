//
//  IFTTTRotationTransformAnimation.m
//  JazzHandsDemo
//
//  Created by Kostya Bychkov on 11/28/13.
//  Copyright (c) 2013 IFTTT Inc. All rights reserved.
//

#import "IFTTTRotationTransformAnimation.h"

@implementation IFTTTRotationTransformAnimation

- (void)animate:(NSInteger)time
{
    if (self.keyFrames.count <= 1) return;
    
    IFTTTAnimationFrame *animationFrame = [self animationFrameForTime:time];
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    self.view.transform = CGAffineTransformRotate(transform, animationFrame.rotationAngle);
}

- (IFTTTAnimationFrame *)frameForTime:(NSInteger)time
                        startKeyFrame:(IFTTTAnimationKeyFrame *)startKeyFrame
                          endKeyFrame:(IFTTTAnimationKeyFrame *)endKeyFrame
{
    NSInteger startTime = startKeyFrame.time;
    NSInteger endTime = endKeyFrame.time;
    double startLocation = startKeyFrame.rotationAngle;
    double endLocation = endKeyFrame.rotationAngle;
    
    double angle = [self tweenValueForStartTime:startTime endTime:endTime startValue:startLocation endValue:endLocation atTime:time];
    
    IFTTTAnimationFrame *animationFrame = [IFTTTAnimationFrame new];
    animationFrame.rotationAngle = angle;
    
    return animationFrame;
}

@end
