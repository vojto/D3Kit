//
//  CALayer+D3.h
//  Zone
//
//  Created by Vojtech Rinik on 2/12/13.
//
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (D3)

#pragma mark - Transitions
- (void)setTransitions:(NSArray *)keyPaths duration:(CGFloat)duration;

#pragma mark - Animations
- (void)setOrderInAnimation:(NSDictionary *)animationDescription duration:(CGFloat)duration;
- (void)addAnimation:(NSDictionary *)animationDescription duration:(CGFloat)duration forKey:(NSString *)key;
- (CAAnimationGroup *)animationGroupFromDescription:(NSDictionary *)animationDescription withDuration:(CGFloat)duration;

@end
