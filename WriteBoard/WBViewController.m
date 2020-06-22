//
//  WBViewController.m
//  WriteBoard
//
//  Created by zglee on 6/22/20.
//  Copyright © 2020 zglee. All rights reserved.
//

#import "WBViewController.h"

@interface WBView:UIView

@property UIColor *color;
@property NSInteger writemode;
@property NSMutableArray *sigarr;       // 笔迹
@property NSMutableArray *cursigpoints; // 笔迹位置

@end

@implementation WBView

- (void)setwritecolor:(UIColor *)color {
    self.color = color;
}

- (void)setwritecmode:(NSInteger )writemode {
    self.writemode = writemode;
}

- (void)redo {
    
}

- (void)undo {
//    [self.layer.sublayers ];
    
    CALayer *lastlayer;
    [lastlayer removeFromSuperlayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {}

- (void)addlayer {
    CGSize finalSize = CGSizeMake(200, 400);
    CGFloat layerHeight = finalSize.height * 0.2;
    CAShapeLayer *bottomCurveLayer = [[CAShapeLayer alloc]init];
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(0, finalSize.height - layerHeight)];
    [path addLineToPoint:CGPointMake(0, finalSize.height - 1)];
    [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - 1)];
    [path addLineToPoint:CGPointMake(finalSize.width, finalSize.height - layerHeight)];
    [path addQuadCurveToPoint:CGPointMake(0, finalSize.height - layerHeight) controlPoint:CGPointMake(finalSize.width / 2, (finalSize.height - layerHeight) - 40)];

    bottomCurveLayer.backgroundColor  = [UIColor redColor].CGColor;
    bottomCurveLayer.strokeColor = [UIColor orangeColor].CGColor;
    bottomCurveLayer.path = path.CGPath;
    
    [self.layer addSublayer:bottomCurveLayer];
}


@end

@interface WBViewController ()
@property IBOutlet WBView *board;
@end

@implementation WBViewController


+ (UINib *)nib
{
    return [UINib nibWithNibName:NSStringFromClass([WBViewController class])
                          bundle:[NSBundle bundleForClass:[WBViewController class]]];
}

+ (instancetype)writeboardViewController
{
    return [[[self class] alloc] initWithNibName:NSStringFromClass([WBViewController class])
                                          bundle:[NSBundle bundleForClass:[WBViewController class]]];
}

+ (void)initialize {
    [super initialize];
    if (self == [WBViewController self]) {
//        JSQInstallWorkaroundForSheetPresentationIssue26295020();
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[[self class] nib] instantiateWithOwner:self options:nil];
    [self.board addlayer];
}

- (IBAction)pickstyle:(id)sender {
    
}
- (IBAction)pickcolor:(id)sender {
//    self.board
}

- (IBAction)undo:(id)sender {}
- (IBAction)redo:(id)sender {}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
