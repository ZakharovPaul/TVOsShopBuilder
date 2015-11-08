//
//  ViewController.m
//  TvBuilderInterfaceEditor
//
//  Created by Pavel Zakharov on 11/7/15.
//  Copyright © 2015 Pavel Zakharov. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController()

@property (strong)  NSLayoutConstraint *leftToHeadTop;
@property (strong)  NSLayoutConstraint *superToHeadLead;
@property (strong)  NSLayoutConstraint *headToSuperTrail;
@property (strong)  NSLayoutConstraint *rightToHeadTop;
@property (strong)  NSLayoutConstraint *rightToFootBottom;
@property (strong)  NSLayoutConstraint *footToSuperTrail;
@property (strong)  NSLayoutConstraint *superToFootLead;
@property (strong)  NSLayoutConstraint *leftToFootBottom;

@property (strong)  NSLayoutConstraint *leftToSuperTop;
@property (strong)  NSLayoutConstraint *headToLeftLead;
@property (strong)  NSLayoutConstraint *headToRightTrail;
@property (strong)  NSLayoutConstraint *rightToSuperTop;
@property (strong)  NSLayoutConstraint *rightToSuperBottom;
@property (strong)  NSLayoutConstraint *footToRightTrail;
@property (strong)  NSLayoutConstraint *leftToFooterLead;
@property (strong)  NSLayoutConstraint *leftToSuperBottom;

@property (strong) NSLayoutConstraint *leftCollapsed;
@property (strong) NSLayoutConstraint *rightCollapsed;
@property (strong) NSLayoutConstraint *topCollapsed;
@property (strong) NSLayoutConstraint *bottomCollapsed;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initConstraints];
    [self setupDefaultConstraints];
    
    ((AppDelegate*)[NSApplication sharedApplication].delegate).layoutData = [[NSDictionary alloc]init];
    
    self.headerViewSelected = NO;
    self.leftViewSelected = NO;
    self.footerViewSelected = NO;
    self.centralViewSelected = NO;
    self.rightViewSelected = NO;
    
     [self.centralView setWantsLayer:YES];
     [self.leftView setWantsLayer:YES];
     [self.rightView setWantsLayer:YES];
     [self.headerView setWantsLayer:YES];
     [self.footerView setWantsLayer:YES];
    
    [self.centralView.layer setBackgroundColor:CGColorCreateGenericRGB(0.104, 0.53, 0.23, 0.203)];
    [self.leftView.layer setBackgroundColor:CGColorCreateGenericRGB(0.252, 0.255, 0.239, 0.203)];
    [self.rightView.layer setBackgroundColor:CGColorCreateGenericRGB(0.252, 0.255, 0.239, 0.203)];
    [self.footerView.layer setBackgroundColor:CGColorCreateGenericRGB(0.193, 0.216, 0.225, 0.203)];
    [self.headerView.layer setBackgroundColor:CGColorCreateGenericRGB(0.193, 0.216, 0.225, 0.203)];

    // Do any additional setup after loading the view.
}

- (void)setupDefaultConstraints{
    [self.view addConstraints:@[self.leftToHeadTop, self.superToHeadLead,self.headToSuperTrail,self.rightToHeadTop,self.rightToFootBottom,self.footToSuperTrail,self.superToFootLead,self.leftToFootBottom]];
}

- (void)initConstraints{
    NSView *left = self.leftView;
    NSView *right = self.rightView;
    NSView *footer = self.footerView;
    NSView *header = self.headerView;
    
    self.leftToHeadTop = [NSLayoutConstraint constraintWithItem:left
                                                      attribute:NSLayoutAttributeTop
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:header
                                                      attribute:NSLayoutAttributeBottom
                                                     multiplier:1.0
                                                       constant:0.0];
    
    self.superToHeadLead = [NSLayoutConstraint constraintWithItem:header
                                                      attribute:NSLayoutAttributeLeading
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self.view
                                                      attribute:NSLayoutAttributeLeading
                                                     multiplier:1.0
                                                       constant:0.0];
    
    self.headToSuperTrail = [NSLayoutConstraint constraintWithItem:self.view
                                                        attribute:NSLayoutAttributeTrailing
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:header
                                                        attribute:NSLayoutAttributeTrailing
                                                       multiplier:1.0
                                                         constant:0.0];
    
    self.rightToHeadTop = [NSLayoutConstraint constraintWithItem:right
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:header
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:0.0];
    
    self.rightToFootBottom = [NSLayoutConstraint constraintWithItem:footer
                                                       attribute:NSLayoutAttributeTop
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:right
                                                       attribute:NSLayoutAttributeBottom
                                                      multiplier:1.0
                                                        constant:0.0];

    self.footToSuperTrail = [NSLayoutConstraint constraintWithItem:self.view
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:footer
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:0.0];

    self.superToFootLead = [NSLayoutConstraint constraintWithItem:footer
                                                         attribute:NSLayoutAttributeLeading
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeLeading
                                                        multiplier:1.0
                                                          constant:0.0];

    self.leftToFootBottom = [NSLayoutConstraint constraintWithItem:footer
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:left
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0
                                                         constant:0.0];
    
    self.leftToSuperTop = [NSLayoutConstraint constraintWithItem:self.view
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:left
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:0.0];
    
    self.headToLeftLead = [NSLayoutConstraint constraintWithItem:header
                                                       attribute:NSLayoutAttributeLeading
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:left
                                                       attribute:NSLayoutAttributeTrailing
                                                      multiplier:1.0
                                                        constant:0.0];
    
    self.headToRightTrail = [NSLayoutConstraint constraintWithItem:right
                                                       attribute:NSLayoutAttributeLeading
                                                       relatedBy:NSLayoutRelationEqual
                                                          toItem:header
                                                       attribute:NSLayoutAttributeTrailing
                                                      multiplier:1.0
                                                        constant:0.0];


    self.rightToSuperTop = [NSLayoutConstraint constraintWithItem:right
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:0.0];
    
    self.rightToSuperBottom = [NSLayoutConstraint constraintWithItem:right
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                           toItem:self.view
                                                        attribute:NSLayoutAttributeBottom
                                                       multiplier:1.0
                                                         constant:0.0];
    
    self.footToRightTrail = [NSLayoutConstraint constraintWithItem:right
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:footer
                                                           attribute:NSLayoutAttributeTrailing
                                                          multiplier:1.0
                                                            constant:0.0];
    
    self.leftToFooterLead = [NSLayoutConstraint constraintWithItem:left
                                                         attribute:NSLayoutAttributeTrailing
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:footer
                                                         attribute:NSLayoutAttributeLeading
                                                        multiplier:1.0
                                                          constant:0.0];

    self.leftToSuperBottom = [NSLayoutConstraint constraintWithItem:left
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:0.0];
}

- (void)viewDidLayout{
    [self initLayoutData];
}

-(void)initLayoutData{
    NSMutableDictionary *data = [[NSMutableDictionary alloc]init];
    
    if(self.leftCollapsed == nil){
        NSMutableDictionary *leftDict = [NSMutableDictionary new];
        [leftDict setValue:@(self.leftViewConstraintWidth.constant*2)
         forKey:@"width"];
        [data setObject:leftDict forKey:@"left"];
        NSMutableDictionary *overBy  = [[NSMutableDictionary alloc]init
                                   ];
        if(!self.overlapTopLeftPanel){
            [overBy setValue:@"true" forKey:@"top"];
        } else{
            [overBy setValue:@"false" forKey:@"top"];
        }
        if(!self.overlapBottomLeftPanel){
            [overBy setValue:@"true" forKey:@"bottom"];
        } else {
            [overBy setValue:@"false" forKey:@"bottom"];
        }
        [leftDict setValue:overBy forKey:@"Overlapped By"];
    }
    
    if(self.rightCollapsed == nil){
        NSMutableDictionary *rightDict = [NSMutableDictionary new];
        [rightDict setValue:@(self.rightViewConstraintWidth.constant*2)
                    forKey:@"width"];
        [data setObject:rightDict forKey:@"right"];
        
        NSMutableDictionary *overBy  = [[NSMutableDictionary alloc]init
                                        ];
        if(!self.overlapTopRightPanel){
            [overBy setValue:@"true" forKey:@"top"];
        } else{
            [overBy setValue:@"false" forKey:@"top"];
        }
        if(!self.overlapTopRightPanel){
            [overBy setValue:@"true" forKey:@"bottom"];
        } else {
            [overBy setValue:@"false" forKey:@"bottom"];
        }
        [rightDict setValue:overBy forKey:@"Overlapped By"];
        
    }
    
    if(self.topCollapsed == nil){
        NSMutableDictionary *topDict = [NSMutableDictionary new];
        [topDict setValue:@(self.headerViewConstraintHeigth.constant*2)
                    forKey:@"height"];
        [data setObject:topDict forKey:@"top"];
        
        NSMutableDictionary *overBy  = [[NSMutableDictionary alloc]init
                                        ];
        if(!self.overlapTopLeftPanel){
            [overBy setValue:@"false" forKey:@"left"];
        } else{
            [overBy setValue:@"true" forKey:@"left"];
        }
        if(!self.overlapTopRightPanel){
            [overBy setValue:@"false" forKey:@"right"];
        } else {
            [overBy setValue:@"true" forKey:@"right"];
        }
        [topDict setValue:overBy forKey:@"Overlapped By"];

        
    }
    
    if(self.bottomCollapsed == nil){
        NSMutableDictionary *bottomDict = [NSMutableDictionary new];
        [bottomDict setValue:@(self.footerViewConstraintHeigth.constant*2)
                   forKey:@"height"];
        [data setObject:bottomDict forKey:@"bottom"];
        
        NSMutableDictionary *overBy  = [[NSMutableDictionary alloc]init
                                        ];
        if(!self.overlapBottomLeftPanel){
            [overBy setValue:@"false" forKey:@"left"];
        } else{
            [overBy setValue:@"true" forKey:@"left"];
        }
        if(!self.overlapBottomRightPanel){
            [overBy setValue:@"false" forKey:@"right"];
        } else {
            [overBy setValue:@"true" forKey:@"right"];
        }
        [bottomDict setValue:overBy forKey:@"Overlapped By"];
    }
    
    
    ((AppDelegate*)[NSApplication sharedApplication].delegate).layoutData = data;
}

- (IBAction)RightClickLeftView:(id)sender {
    NSMenu *theMenu = [[NSMenu alloc] initWithTitle:@"Contextual Menu"];
    NSMenuItem *OverlapTopItem= [[NSMenuItem alloc]initWithTitle:@"Overlap Top" action:@selector(overlapTopItems:) keyEquivalent:@""];
    self.overlapTopLeftPanel ? [OverlapTopItem setState:NSOnState] : [OverlapTopItem setState:NSOffState];
    
    NSMenuItem *OverlapBottomItem= [[NSMenuItem alloc]initWithTitle:@"Overlap Bottom" action:@selector(overlapBottomItems:)  keyEquivalent:@""];
    
    self.overlapBottomLeftPanel ? [OverlapTopItem setState:NSOnState] : [OverlapTopItem setState:NSOffState];

    NSMenuItem *DisplayItem= [[NSMenuItem alloc]initWithTitle:@"Display" action:@selector(setHidden:) keyEquivalent:@""];
    
    [theMenu insertItem:OverlapTopItem atIndex:0];
    [theMenu insertItem:OverlapBottomItem atIndex:0];
    [theMenu insertItem:DisplayItem atIndex:0];
    
    [theMenu popUpMenuPositioningItem:nil atLocation:[sender locationInView:self.centralView] inView:self.centralView];
    
}

-(void)setHidden:(NSView*)view{
    if (self.leftViewSelected)
    {
        self.leftCollapsed = [NSLayoutConstraint constraintWithItem:self.leftView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0.0];
        [self.leftView addConstraint:self.leftCollapsed];
    }
    if (self.rightViewSelected)
    {
        self.rightCollapsed = [NSLayoutConstraint constraintWithItem:self.rightView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0.0];
        [self.rightView addConstraint:self.rightCollapsed];
    }
    if (self.footerViewSelected)
    {
        self.bottomCollapsed = [NSLayoutConstraint constraintWithItem:self.footerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0.0];
        [self.footerView addConstraint: self.bottomCollapsed];
    }
    if (self.headerViewSelected)
    {
         self.bottomCollapsed = [NSLayoutConstraint constraintWithItem:self.headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0.0];
        [self.headerView addConstraint:self.bottomCollapsed];
    }


}


/* Set constraints */
-(void)overlapTopItems:(id)sender{
    if (self.leftViewSelected)
    {
        self.overlapTopLeftPanel = YES;
        [self removeConstraintsIfNeeded:@[self.leftToHeadTop, self.superToHeadLead]];
        [self addConstraintsIfNeeded:@[self.leftToSuperTop, self.headToLeftLead]];
    }
    else
    {
        self.overlapTopRightPanel = YES;
        [self removeConstraintsIfNeeded:@[self.rightToHeadTop, self.headToSuperTrail]];
        [self addConstraintsIfNeeded:@[self.rightToSuperTop, self.headToRightTrail]];

    }
    [self.view layoutSubtreeIfNeeded];
    
}

-(void)overlapBottomItems:(id)sender{
    if (self.leftViewSelected)
    {
        self.overlapBottomLeftPanel = YES;
        [self removeConstraintsIfNeeded:@[self.leftToFootBottom, self.superToFootLead]];
        [self addConstraintsIfNeeded:@[self.leftToSuperBottom, self.leftToFooterLead]];
    }
    else
    {
        self.overlapBottomRightPanel = YES;
        [self removeConstraintsIfNeeded:@[self.rightToFootBottom, self.footToSuperTrail]];
        [self addConstraintsIfNeeded:@[self.rightToSuperBottom, self.footToRightTrail]];
    }
    [self.view layoutSubtreeIfNeeded];
}

-(void)overlapRightItems:(id)sender{
    if (self.headerViewSelected)
    {
        self.overlapTopRightPanel = NO;
        [self removeConstraintsIfNeeded:@[self.headToRightTrail, self.rightToSuperTop]];
        [self addConstraintsIfNeeded:@[self.headToSuperTrail, self.rightToHeadTop]];
    }
    else
    {
        self.overlapBottomRightPanel = NO;
        [self removeConstraintsIfNeeded:@[self.footToRightTrail, self.rightToSuperBottom]];
        [self addConstraintsIfNeeded:@[self.footToSuperTrail, self.rightToFootBottom]];
    }
    [self.view layoutSubtreeIfNeeded];
}

-(void)overlapLeftItems:(id)sender{
    if (self.headerViewSelected)
    {
        self.overlapTopLeftPanel = NO;
        [self removeConstraintsIfNeeded:@[self.headToLeftLead, self.leftToSuperTop]];
        [self addConstraintsIfNeeded:@[self.superToHeadLead, self.leftToHeadTop]];
    }
    else{
        self.overlapBottomLeftPanel = NO;
        [self.view removeConstraints:@[self.leftToFooterLead, self.leftToSuperBottom]];
        [self addConstraintsIfNeeded:@[self.superToFootLead, self.leftToFootBottom]];
    }
    [self.view layoutSubtreeIfNeeded];
}

- (void)addConstraintsIfNeeded:(NSArray<NSLayoutConstraint*>*)constraints{
    for (NSLayoutConstraint* constrait in constraints) {
        if(![[self.view constraints] containsObject:constrait]){
            [self.view addConstraint:constrait];
        }
    }
}

- (void)removeConstraintsIfNeeded:(NSArray<NSLayoutConstraint*>*)constraints{
    for (NSLayoutConstraint* constrait in constraints) {
        if([[self.view constraints] containsObject:constrait]){
            [self.view removeConstraint:constrait];
        }
    }
}

- (IBAction)rightClickRightView:(id)sender {
    NSMenu *theMenu = [[NSMenu alloc] initWithTitle:@"Contextual Menu"];
    NSMenuItem *OverlapTopItem= [[NSMenuItem alloc]initWithTitle:@"Overlap Top" action:@selector(overlapTopItems:) keyEquivalent:@""];
    [OverlapTopItem setState:NSOnState];
    NSMenuItem *OverlapBottomItem= [[NSMenuItem alloc]initWithTitle:@"Overlap Bottom" action:@selector(overlapBottomItems:)  keyEquivalent:@""];
    [OverlapTopItem setState:NSOnState];
    
    NSMenuItem *DisplayItem= [[NSMenuItem alloc]initWithTitle:@"Display" action:@selector(setHidden:) keyEquivalent:@""];
    
    [theMenu insertItem:OverlapTopItem atIndex:0];
    [theMenu insertItem:OverlapBottomItem atIndex:0];
    [theMenu insertItem:DisplayItem atIndex:0];
    
    [theMenu popUpMenuPositioningItem:nil atLocation:[sender locationInView:self.centralView] inView:self.centralView];
}

- (IBAction)rightClickHeaderView:(id)sender {
    NSMenu *theMenu = [[NSMenu alloc] initWithTitle:@"Contextual Menu"];
    NSMenuItem *OverlapRightItem= [[NSMenuItem alloc]initWithTitle:@"Overlap Right" action:@selector(overlapRightItems:) keyEquivalent:@""];
    [OverlapRightItem setState:NSOnState];
    NSMenuItem *OverlapLeftItem= [[NSMenuItem alloc]initWithTitle:@"Overlap Left" action:@selector(overlapLeftItems:)  keyEquivalent:@""];
    [OverlapLeftItem setState:NSOnState];
    
    NSMenuItem *DisplayItem= [[NSMenuItem alloc]initWithTitle:@"Display" action:@selector(setHidden:) keyEquivalent:@""];
    
    [theMenu insertItem:OverlapRightItem atIndex:0];
    [theMenu insertItem:OverlapLeftItem atIndex:0];
    [theMenu insertItem:DisplayItem atIndex:0];
    
    [theMenu popUpMenuPositioningItem:nil atLocation:[sender locationInView:self.centralView] inView:self.centralView];
}

- (IBAction)rightClickFooterView:(id)sender {
    NSMenu *theMenu = [[NSMenu alloc] initWithTitle:@"Contextual Menu"];
    NSMenuItem *OverlapRightItem= [[NSMenuItem alloc]initWithTitle:@"Overlap Right" action:@selector(overlapRightItems:) keyEquivalent:@""];
    [OverlapRightItem setState:NSOnState];
    NSMenuItem *OverlapLeftItem= [[NSMenuItem alloc]initWithTitle:@"Overlap Left" action:@selector(overlapLeftItems:)  keyEquivalent:@""];
    [OverlapLeftItem setState:NSOnState];
    
    NSMenuItem *DisplayItem= [[NSMenuItem alloc]initWithTitle:@"Display" action:@selector(setHidden:) keyEquivalent:@""];
    
    [theMenu insertItem:OverlapRightItem atIndex:0];
    [theMenu insertItem:OverlapLeftItem atIndex:0];
    [theMenu insertItem:DisplayItem atIndex:0];
    
    [theMenu popUpMenuPositioningItem:nil atLocation:[sender locationInView:self.centralView] inView:self.centralView];
}

- (void)deselectAll{
    self.rightViewSelected = NO;
    self.leftViewSelected = NO;
    self.centralViewSelected = NO;
    self.headerViewSelected = NO;
    self.footerViewSelected = NO;
    
    [self.centralView.layer setBorderColor:self.centralView.layer.backgroundColor];
    [self.centralView.layer setBorderWidth:0];
    
    [self.leftView.layer setBorderColor:self.leftView.layer.backgroundColor];
    [self.leftView.layer setBorderWidth:0];
    
    [self.rightView.layer setBorderColor:self.rightView.layer.backgroundColor];
    [self.rightView.layer setBorderWidth:0];
    
    [self.headerView.layer setBorderColor:self.headerView.layer.backgroundColor];
    [self.headerView.layer setBorderWidth:0];
    
    [self.footerView.layer setBorderColor:self.footerView.layer.backgroundColor];
    [self.footerView.layer setBorderWidth:0];

}

- (IBAction)centralViewOnClick:(NSClickGestureRecognizer *)sender {
    
    if(!self.centralViewSelected){
    [self deselectAll];
    [self.centralView.layer setBorderColor:CGColorCreateGenericRGB(0.52, 0.54, 0.45, 0.803)];
    [self.centralView.layer setBorderWidth:3];
        self.centralViewSelected = YES;
    } else {
        [self.centralView.layer setBorderColor:self.centralView.layer.backgroundColor];
        [self.centralView.layer setBorderWidth:0];
        self.centralViewSelected = NO;
    }
}

- (IBAction)leftViewOnClick:(NSClickGestureRecognizer *)sender {
    if(!self.leftViewSelected){
        [self deselectAll];
        [self.leftView.layer setBorderColor:CGColorCreateGenericRGB(0.52, 0.54, 0.45, 0.803)];
        [self.leftView.layer setBorderWidth:3];
        self.leftViewSelected = YES;
    } else {
        [self.leftView.layer setBorderColor:self.centralView.layer.backgroundColor];
        [self.leftView.layer setBorderWidth:0];
        self.leftViewSelected = NO;
    }
}

- (IBAction)footerViewOnClick:(NSClickGestureRecognizer *)sender {
    if(!self.footerViewSelected){
        [self deselectAll];
        [self.footerView.layer setBorderColor:CGColorCreateGenericRGB(0.52, 0.54, 0.45, 0.803)];
        [self.footerView.layer setBorderWidth:3];
        self.footerViewSelected = YES;
    } else {
        [self.footerView.layer setBorderColor:self.centralView.layer.backgroundColor];
        [self.footerView.layer setBorderWidth:0];
        self.footerViewSelected = NO;
    }
}

- (IBAction)rightViewOnClick:(id)sender {
    if(!self.rightViewSelected){
        [self deselectAll];
        [self.rightView.layer setBorderColor:CGColorCreateGenericRGB(0.52, 0.54, 0.45, 0.803)];
        [self.rightView.layer setBorderWidth:3];
        self.rightViewSelected = YES;
    } else {
        [self.rightView.layer setBorderColor:self.centralView.layer.backgroundColor];
        [self.rightView.layer setBorderWidth:0];
        self.rightViewSelected = NO;
    }
}

- (IBAction)headerViewOnClick:(id)sender {
    if(!self.headerViewSelected){
        [self deselectAll];
        [self.headerView.layer setBorderColor:CGColorCreateGenericRGB(0.52, 0.54, 0.45, 0.803)];
        [self.headerView.layer setBorderWidth:3];
        self.headerViewSelected = YES;
    } else {
        [self.headerView.layer setBorderColor:self.centralView.layer.backgroundColor];
        [self.headerView.layer setBorderWidth:0];
        self.headerViewSelected = NO;
    }
}


//Pan Gesture

- (IBAction)FooterViewOnPan:(NSPanGestureRecognizer*)sender {
    if (!self.footerViewSelected) {
        return;
    }
    switch (sender.state) {
        case NSGestureRecognizerStateBegan:
        {

        }
            break;
        case NSGestureRecognizerStateChanged:
        {
           NSPoint velosity =  [sender velocityInView:self.footerView];
            self.footerViewConstraintHeigth.constant += velosity.y/100;
            
            [self.footerView setNeedsLayout:YES ];
            
        }
            break;
        default:
            break;
    }
    
}

- (IBAction)LeftViewOnPan:(NSPanGestureRecognizer*)sender {
    if (!self.leftViewSelected) {
        return;
    }
    switch (sender.state) {
        case NSGestureRecognizerStateBegan:
        {
            
        }
            break;
        case NSGestureRecognizerStateChanged:
        {
            NSPoint velosity =  [sender velocityInView:self.leftView];
            self.leftViewConstraintWidth.constant += velosity.x/100;
            
            [self.leftView setNeedsLayout:YES ];
            
        }
            break;
        default:
            break;
    }

}

- (IBAction)rightViewOnPan:(NSPanGestureRecognizer*)sender {
    if (!self.rightViewSelected) {
        return;
    }
    switch (sender.state) {
        case NSGestureRecognizerStateBegan:
        {
            
        }
            break;
        case NSGestureRecognizerStateChanged:
        {
            NSPoint velosity =  [sender velocityInView:self.rightView];
            self.rightViewConstraintWidth.constant -= velosity.x/100;
            
            [self.rightView setNeedsLayout:YES ];
            
        }
            break;
        default:
            break;
    }

}

- (IBAction)headerViewOnPan:(NSPanGestureRecognizer*)sender {
    if (!self.headerViewSelected) {
        return;
    }
    switch (sender.state) {
        case NSGestureRecognizerStateBegan:
        {
            
        }
            break;
        case NSGestureRecognizerStateChanged:
        {
            NSPoint velosity =  [sender velocityInView:self.headerView];
            self.headerViewConstraintHeigth.constant -= velosity.y/100;
            
            [self.headerView setNeedsLayout:YES ];
            
        }
            break;
        default:
            break;
    }

}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
