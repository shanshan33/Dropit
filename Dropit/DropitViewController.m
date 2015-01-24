//
//  DropitViewController.m
//  Dropit
//
//  Created by Shanshan ZHAO on 14-1-14.
//  Copyright (c) 2014年 Shanshan ZHAO. All rights reserved.
//

#import "DropitViewController.h"

@interface DropitViewController ()

@property (weak, nonatomic)   IBOutlet UIView *gameView;
@property (strong, nonatomic) UIDynamicAnimator * animator ;
@property (strong, nonatomic) UIGravityBehavior * gravity;
@property (strong, nonatomic) UICollisionBehavior * collider;

@end

@implementation DropitViewController

static const CGSize DROP_SIZE = {40,  40};


- (UIDynamicAnimator *)animator
{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView: self.gameView];
    }
    
    return _animator;
}

- (UIGravityBehavior *)gravity
{
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 0.9;
        [self.animator addBehavior:_gravity];
    }
    return  _gravity;
}

- (UICollisionBehavior *)collider
{
    if (!_collider) {
        _collider = [[UICollisionBehavior alloc] init];
        
        _collider.translatesReferenceBoundsIntoBoundary = YES;
        
        [self.animator addBehavior:_collider];
        
    }
    return  _collider;
}

- (IBAction)tap:(UITapGestureRecognizer *)sender
{
    [self drop];
}

-(void)drop
{
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROP_SIZE;
    int x = (arc4random()%(int)self.gameView.bounds.size.width) / DROP_SIZE.width;
    frame.origin.x = x * DROP_SIZE.width;
    
    UIView * dropView = [[UIView alloc] initWithFrame:frame];
    dropView.backgroundColor = [UIColor blackColor];
    [self.gameView addSubview:dropView];
    
    [self.gravity addItem:dropView];
    [self.collider addItem:dropView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
