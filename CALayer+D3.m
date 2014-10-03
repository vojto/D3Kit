//
//  CALayer+D3.m
//  Zone
//
//  Created by Vojtech Rinik on 2/12/13.
//
//

#import "CALayer+D3.h"

@implementation CALayer (D3)

#pragma mark - Transitions

- (void)setTransitions:(NSArray *)keyPaths duration:(CGFloat)duration {
    NSMutableDictionary *actions = self.mutableActions;

    for (NSString *keyPath in keyPaths) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
        animation.duration = duration;
        actions[keyPath] = animation;
    }

    self.actions = actions;
}

#pragma mark - Order in/out animations

- (void)setOrderInAnimation:(NSDictionary *)animationDescription duration:(CGFloat)duration {
    CAAnimationGroup *group = [self animationGroupFromDescription:animationDescription withDuration:duration];

    NSMutableDictionary *actions = self.mutableActions;
    actions[kCAOnOrderIn] = group;
    self.actions = actions;
}

- (void)addAnimation:(NSDictionary *)animationDescription duration:(CGFloat)duration forKey:(NSString *)key {
    CAAnimationGroup *group = [self animationGroupFromDescription:animationDescription withDuration:duration];

    [self addAnimation:group forKey:key];
}

- (CAAnimationGroup *)animationGroupFromDescription:(NSDictionary *)animationDescription withDuration:(CGFloat)duration {
    NSMutableArray *animations = [NSMutableArray array];

    for (NSString *keyPath in animationDescription.allKeys) {
        NSArray *values = animationDescription[keyPath];
        NSNumber *fromValue = values[0];
        NSNumber *toValue = values[1];

        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
        animation.duration = duration;
        animation.fromValue = fromValue;
        animation.toValue = toValue;

        [animations addObject:animation];
    }

    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.duration = duration;
    group.animations = animations;

    return group;
}

#pragma mark - Helpers

- (NSMutableDictionary *)mutableActions {
    NSMutableDictionary *actions = [self.actions mutableCopy];
    if (!actions) actions = [NSMutableDictionary dictionary];
    return actions;
}


@end
