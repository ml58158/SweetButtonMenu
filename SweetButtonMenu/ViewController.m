//
//  ViewController.m
//  SweetButtonMenu
//
//  Created by Matt Larkin on 3/19/15.
//  Copyright (c) 2015 Matt Larkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIButton *mainButton;
@property UIButton *menuButtonOne;
@property UIButton *menuButtonTwo;
@property UIButton *menuButtonThree;
@property UIDynamicAnimator *dynamicAnimator;
@property BOOL areButtonsFanned;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuButtonOne = [self createButtonWithTitle:@"1"];
    self.menuButtonTwo = [self createButtonWithTitle:@"2"];
    self.menuButtonThree = [self createButtonWithTitle:@"3"];
    self.mainButton = [self createButtonWithTitle:@"P"];

    [self.mainButton addTarget:self action:@selector(fanButtons:) forControlEvents: UIControlEventTouchUpInside];

    self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    self.areButtonsFanned = NO;
}


-(UIButton *)createButtonWithTitle:(NSString *)title
{
    CGRect frame = self.view.frame;

    UIButton *button= [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width - 50, frame.size.height
                        - 50, 50, 50)];
    button.layer.cornerRadius = button.bounds.size.width / 2;
    button.layer.borderWidth = 1.0;
    button.backgroundColor = [UIColor whiteColor];
    button.layer.borderColor = self.mainButton.titleLabel.textColor.CGColor;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [self.view addSubview:button];

    return button;
}

-(void)fanButtons:(id)sender {

    if (self.areButtonsFanned) {
        [self fanIn];
    } else {
        [self fanOut];
    }
    self.areButtonsFanned = !self.areButtonsFanned;
    
}


-(void)fanOut {
    CGPoint point;
    UISnapBehavior *snapBehavior;

    point = CGPointMake(self.mainButton.frame.origin.x - 50, self.mainButton.frame.origin.y + 20);
    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButtonOne snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

    point = CGPointMake(self.mainButton.frame.origin.x - 45, self.mainButton.frame.origin.y - 45);
    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButtonTwo snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];

    point = CGPointMake(self.mainButton.frame.origin.x + 20, self.mainButton.frame.origin.y - 50);
    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButtonThree snapToPoint:point];
    [self.dynamicAnimator addBehavior:snapBehavior];
}

-(void)fanIn {
    UISnapBehavior *snapBehavior;

    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButtonOne snapToPoint:self.mainButton. center];
     [self.dynamicAnimator addBehavior:snapBehavior];

    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButtonTwo snapToPoint:self.mainButton. center];
    [self.dynamicAnimator addBehavior:snapBehavior];

    snapBehavior = [[UISnapBehavior alloc] initWithItem:self.menuButtonThree snapToPoint:self.mainButton. center];
    [self.dynamicAnimator addBehavior:snapBehavior];
}




@end
