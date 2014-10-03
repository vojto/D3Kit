//
//  D3Layer.m
//  Zone
//
//  Created by Vojtech Rinik on 2/12/13.
//
//

#import "D3Layer.h"

@implementation D3Layer

- (id)init {
    if ((self = [super init])) {
        self.layersForData = [NSMutableArray array];
        self.exit = ^(CALayer *layer) {
            [layer removeFromSuperlayer];
        };
    }

    return self;
}

- (void)setData:(NSArray *)data {
    for (int i = 0; i < data.count; i++) {
        NSDictionary *d = data[i];
        CALayer *layer;

        if (i < self.layersForData.count) {
            layer = [self.layersForData objectAtIndex:i];
        } else {
            layer = self.enter(d);
            [self.layersForData addObject:layer];
            [self addSublayer:layer];
        }

        self.update(d, layer, i);
    }

    NSMutableArray *layersToRemove = [NSMutableArray array];
    for (int i = data.count; i < self.layersForData.count; i++) {
        CALayer *layer = [self.layersForData objectAtIndex:i];
        [layersToRemove addObject:layer];
        self.exit(layer);
    }
    for (CALayer *layer in layersToRemove) {
        [self.layersForData removeObject:layer];
    }
}

@end
