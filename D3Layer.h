//
//  D3Layer.h
//  Zone
//
//  Created by Vojtech Rinik on 2/12/13.
//
//

#import <QuartzCore/QuartzCore.h>

@interface D3Layer : CALayer

typedef CALayer * (^D3EnterBlock)(id d);
typedef void (^D3ExitBlock)(CALayer *layer);
typedef void (^D3UpdateBlock)(id d, CALayer *layer, NSInteger i);

// Public

@property (copy) D3EnterBlock enter;
@property (copy) D3ExitBlock exit;
@property (copy) D3UpdateBlock update;

#pragma mark - Binding data
- (void)setData:(NSArray *)data;

// Private

@property (strong) NSMutableArray *layersForData;

@end
