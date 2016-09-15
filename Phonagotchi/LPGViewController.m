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
@property (nonatomic) UILabel     *appTitle;

@property (assign) int numberOfTaps;

@property (nonatomic, weak) NSLayoutConstraint *    bucketImageViewBottom;
@property (nonatomic, weak) NSLayoutConstraint *    bucketImageViewLeft;
@property (nonatomic, weak) NSLayoutConstraint *    bucketImageViewWidth;
@property (nonatomic, weak) NSLayoutConstraint *    bucketImageViewHeight;

@property (nonatomic, weak) NSLayoutConstraint *    appleBottom;
@property (nonatomic, weak) NSLayoutConstraint *    appleLeft;
@property (nonatomic, weak) NSLayoutConstraint *    appleWidth;
@property (nonatomic, weak) NSLayoutConstraint *    appleHeight;

@property (nonatomic, weak) NSLayoutConstraint *    appTitleX;
@property (nonatomic, weak) NSLayoutConstraint *    appTitleY;
@property (nonatomic, weak) NSLayoutConstraint *    appTitleWidth;
@property (nonatomic, weak) NSLayoutConstraint *    appTitleHeight;

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
                                                           constant:-100.0]];
    
    UILabel *appTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    
    appTitle.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:appTitle];
    
    appTitle.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *appTitleX = [NSLayoutConstraint constraintWithItem:appTitle
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1
                                                                  constant:0];
    
    NSLayoutConstraint *appTitleY = [NSLayoutConstraint constraintWithItem:appTitle
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1
                                                                  constant:-220];
    
    NSLayoutConstraint *appTitleWidth = [NSLayoutConstraint constraintWithItem:appTitle
                                                                     attribute:NSLayoutAttributeWidth
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1
                                                                      constant:250];
    
    NSLayoutConstraint *appTitleHeight = [NSLayoutConstraint constraintWithItem:appTitle
                                                                      attribute:NSLayoutAttributeHeight
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:nil
                                                                      attribute:NSLayoutAttributeNotAnAttribute
                                                                     multiplier:1
                                                                       constant:50];
    
    
    [self.view addConstraint:appTitleX];
    [self.view addConstraint:appTitleY];
    [self.view addConstraint:appTitleWidth];
    [self.view addConstraint:appTitleHeight];
    
    
    [appTitle setText:@"PHONAGOTCHI"];
    [appTitle setFont:[UIFont fontWithName:@"helvetica neue" size:25]];
    [appTitle setFont:[UIFont boldSystemFontOfSize:25]];
    
    appTitle.textColor = [UIColor whiteColor];
    
    
    self.bucketImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    self.bucketImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.bucketImageView.image = [UIImage imageNamed:@"bucket.png"];
    
    [self.view addSubview:self.bucketImageView];
    
    NSLayoutConstraint *bucketImageViewY = [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                                             attribute:NSLayoutAttributeCenterY
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.view
                                                                             attribute:NSLayoutAttributeCenterY
                                                                            multiplier:1.0
                                                                              constant:200.0];
    
    NSLayoutConstraint *bucketImageViewX = [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                                           attribute:NSLayoutAttributeCenterX
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.view
                                                                           attribute:NSLayoutAttributeCenterX
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
    
    [self.view addConstraint:bucketImageViewX];
    [self.view addConstraint:bucketImageViewY];
    [self.view addConstraint:bucketImageViewHeight];
    [self.view addConstraint:bucketImageViewWidth];
    
    
    /************** GESTURE RECOGNIZERS!! **************/
    
    
    UIPinchGestureRecognizer *pickUpApple = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pickUpApple:)];
    
    [self.view addGestureRecognizer:pickUpApple];
    
    UIPanGestureRecognizer *dragApple = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragApple:)];
    
    dragApple.minimumNumberOfTouches = 1;
    
    [self.apple addGestureRecognizer:dragApple];
    
    [self.view addGestureRecognizer:dragApple];
    
    UITapGestureRecognizer *tapPet = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPet:)];
    
    tapPet.numberOfTouchesRequired = 1;
    tapPet.numberOfTapsRequired = 1;
    
    [self.petImageView addGestureRecognizer:tapPet];
    
    self.petImageView.userInteractionEnabled = YES;
    
    
}

- (void) generateAppleImageView {
    
    UIImage *appleImage = [UIImage imageNamed:@"apple.png"];
    
    if (self.apple != nil) {
        self.apple.image = appleImage;
        return;
    }
    
    
    UIImageView *apple = [[UIImageView alloc] initWithFrame:CGRectZero];
    apple.translatesAutoresizingMaskIntoConstraints = NO;
    self.apple = apple;
    self.apple.image = appleImage;
    [self.view addSubview:self.apple];
    
    
//   ******** NEW WAY OF WRITING CONSTRAINTS *******
//    
//    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-(10)-[apple(width)]-(100)-[basket]-(10)-|" options:(NSLayoutFormatAlignAllCenterY) metrics:@{@"width": @(30)} views:@{
//                                                                                                                                                                                                               @"apple" : self.apple,
//                                                                                                                                                                                                               @"basket" : self.bucketImageView
//                                                                                                                                                                                                               }];
//    
//    [self.view addConstraints:horizontalConstraints];
//
    
//    NSLayoutConstraint *centerX = [self.apple.centerXAnchor constraintEqualToAnchor:self.bucketImageView.centerXAnchor];
//    
//    [self.view addConstraint:centerX];
    
    
//    [self.apple.centerXAnchor constraintEqualToAnchor:self.bucketImageView.centerXAnchor].active = YES;
    
    
    NSLayoutConstraint *appleX = [NSLayoutConstraint constraintWithItem:self.apple
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.bucketImageView
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1.0
                                                                    constant:0.0];
    
    NSLayoutConstraint *appleY = [NSLayoutConstraint constraintWithItem:self.apple
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.bucketImageView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:0.0];
    
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
    
    [self.view addConstraint:appleX];
    [self.view addConstraint:appleY];
    [self.view addConstraint:appleWidth];
    [self.view addConstraint:appleHeight];
    
    [UIView animateWithDuration:1.5 delay:0.0
                        options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         self.apple.transform = CGAffineTransformMakeTranslation(10, 0);}
                     completion:^(BOOL end){
                     }];

    
    
}

- (IBAction)pickUpApple:(UIPinchGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        
        [self generateAppleImageView];
    }
    
    
}

- (IBAction)dragApple:(UIPanGestureRecognizer *)sender {
    
    CGRect originalFrame = CGRectMake(140, 465, 40, 40);
    
    if (sender.state == UIGestureRecognizerStateChanged) {
        
      // put here animation for floating
        
        self.apple.center = [sender locationInView:self.apple.superview];
        
        
    }
    
    else if (sender.state == UIGestureRecognizerStateEnded) {
        
        if (CGRectContainsRect(self.petImageView.frame, self.apple.frame)) {
            
            self.apple.image = nil;
            
        } else {
            
            [UIView animateWithDuration:1.25 animations:^{
                
                self.apple.frame = originalFrame;
            }];
            
        }
    }
}


- (IBAction)tapPet:(UITapGestureRecognizer *)sender {
    
    
    if (sender.state == UIGestureRecognizerStateEnded){
        
        self.numberOfTaps ++;
        
        if (self.numberOfTaps == 5){
            
            self.petImageView.image = [UIImage imageNamed:@"grumpy.png"];
            
            self.numberOfTaps = 0;
            
            [self performSelector:@selector(resetPetImage) withObject:nil afterDelay:1];
            
        }
        
        
    }
    
}

-(void)resetPetImage{
    
    self.petImageView.image = [UIImage imageNamed:@"default.png"];
    
}

@end
