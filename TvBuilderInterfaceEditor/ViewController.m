//
//  ViewController.m
//  TvBuilderInterfaceEditor
//
//  Created by Pavel Zakharov on 11/7/15.
//  Copyright © 2015 Pavel Zakharov. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

- (IBAction)centralViewOnClick:(NSClickGestureRecognizer *)sender {
    if(!self.centralViewSelected){
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
