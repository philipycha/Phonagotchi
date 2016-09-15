//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "LPGPet.h"

@interface LPGViewController ()

@property (nonatomic) UIImageView *petImageView;

@property (nonatomic) UIImageView *bucketImageView;
@property (nonatomic) UIImageView *apple;

@property (nonatomic, weak) NSLayoutConstraint *    bucketImageViewBottom;
@property (nonatomic, weak) NSLayoutConstraint *    bucketImageViewLeft;
@property (nonatomic, weak) NSLayoutConstraint *    bucketImageViewWidth;
@property (nonatomic, weak) NSLayoutConstraint *    bucketImageViewHeight;

@property (nonatomic, weak) NSLayoutConstraint *    appleBottom;
@property (nonatomic, weak) NSLayoutConstraint *    appleLeft;
@property (nonatomic, weak) NSLayoutConstraint *    appleWidth;
@property (nonatomic, weak) NSLayoutConstraint *    appleHeight;

@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.petImageView.image = [UIImage imageNamed:@"default"];
    
    [self.view addSubview:self.petImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    
    self.bucketImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    self.bucketImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.bucketImageView.image = [UIImage imageNamed:@"bucket.png"];
    
    [self.view addSubview:self.bucketImageView];
    
    NSLayoutConstraint *bucketImageViewBottom = [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                                             attribute:NSLayoutAttributeBottom
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.view
                                                                             attribute:NSLayoutAttributeBottom
                                                                            multiplier:1.0
                                                                              constant:0.0];
    
    NSLayoutConstraint *bucketImageViewLeft = [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                                           attribute:NSLayoutAttributeLeft
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeLeft
                                                                          multiplier:1.0
                                                                            constant:0.0];
    
    NSLayoutConstraint *bucketImageViewWidth = [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                                            attribute:NSLayoutAttributeWidth
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0
                                                                             constant:150];
    
    NSLayoutConstraint *bucketImageViewHeight = [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                                             attribute:NSLayoutAttributeHeight
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:nil
                                                                             attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0
                                                                              constant:150];
    
    [self.view addConstraint:bucketImageViewLeft];
    [self.view addConstraint:bucketImageViewBottom];
    [self.view addConstraint:bucketImageViewHeight];
    [self.view addConstraint:bucketImageViewWidth];
    
    
    UIPinchGestureRecognizer *pickUpApple = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pickUpApple:)];
    
    [self.view addGestureRecognizer:pickUpApple];
    
    UIPanGestureRecognizer *dragApple = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragApple:)];
    
    dragApple.minimumNumberOfTouches = 1;
    
    [self.apple addGestureRecognizer:dragApple];
    
    [self.view addGestureRecognizer:dragApple];
    
    
}

- (void) generateAppleImageView {
    
    UIImageView *apple = [[UIImageView alloc] initWithFrame:CGRectZero];
    apple.translatesAutoresizingMaskIntoConstraints = NO;
    apple.image = [UIImage imageNamed:@"apple.png"];
    
    self.apple = apple;
    
    [self.view addSubview:apple];
    
    NSLayoutConstraint *appleBottom = [NSLayoutConstraint constraintWithItem:self.apple
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.bucketImageView
                                                                   attribute:NSLayoutAttributeTop
                                                                  multiplier:1.0
                                                                    constant:100.0];
    
    NSLayoutConstraint *appleLeft = [NSLayoutConstraint constraintWithItem:self.apple
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.bucketImageView
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1.0
                                                                  constant:45.0];
    
    NSLayoutConstraint *appleWidth = [NSLayoutConstraint constraintWithItem:self.apple
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1.0
                                                                   constant:40.0];
    
    NSLayoutConstraint *appleHeight = [NSLayoutConstraint constraintWithItem:self.apple
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:40.0];
    
    [self.view addConstraint:appleBottom];
    [self.view addConstraint:appleLeft];
    [self.view addConstraint:appleWidth];
    [self.view addConstraint:appleHeight];
}

- (IBAction)pickUpApple:(UIPinchGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        [self generateAppleImageView];
    }
    
    
}

- (IBAction)dragApple:(UIPanGestureRecognizer *)sender {
    
    self.apple.center = [sender locationInView:self.apple.superview];
        
        
    }





@end
