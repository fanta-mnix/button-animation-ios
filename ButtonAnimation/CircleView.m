//
//  CircleView.m
//  ButtonAnimation
//
//  Created by Rafael Fantini da Costa on 9/16/15.
//  Copyright © 2015 Rafael Fantini da Costa. All rights reserved.
//

#import "CircleView.h"

@interface CircleView ()

@property (nonatomic, readonly) CAShapeLayer *shapeLayer;

@end

@implementation CircleView

@dynamic shapeLayer;

+ (Class)layerClass {
    return [CAShapeLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLayer];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupLayer];
    }
    return self;
}

- (void)setupLayer {
    self.shapeLayer.lineWidth = 1.0f;
    self.shapeLayer.fillColor = self.fillColor.CGColor;
    self.shapeLayer.strokeColor = self.strokeColor.CGColor;
    self.shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
    self.shapeLayer.masksToBounds = NO;
    self.shapeLayer.shouldRasterize = NO;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
}

- (CAShapeLayer *)shapeLayer {
    return (CAShapeLayer *)self.layer;
}

- (void)setFillColor:(UIColor *)fillColor {
    [self willChangeValueForKey:NSStringFromSelector(@selector(fillColor))];
    self.shapeLayer.fillColor = fillColor.CGColor;
    [self didChangeValueForKey:NSStringFromSelector(@selector(fillColor))];
}

- (UIColor *)fillColor {
    return [UIColor colorWithCGColor:self.shapeLayer.fillColor];
}

- (void)setStrokeColor:(UIColor *)strokeColor {
    [self willChangeValueForKey:NSStringFromSelector(@selector(strokeColor))];
    self.shapeLayer.strokeColor = strokeColor.CGColor;
    [self didChangeValueForKey:NSStringFromSelector(@selector(strokeColor))];
}

- (UIColor *)strokeColor {
    return [UIColor colorWithCGColor:self.shapeLayer.strokeColor];
}

@end
