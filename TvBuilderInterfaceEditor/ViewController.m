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
    
    [self.centralView.layer setBackgroundColor:[NSColor cyanColor].CGColor];
    [self.leftView.layer setBackgroundColor:[NSColor lightGrayColor].CGColor];
    [self.rightView.layer setBackgroundColor:[NSColor lightGrayColor].CGColor];
    [self.footerView.layer setBackgroundColor:[NSColor greenColor].CGColor];
    [self.headerView.layer setBackgroundColor:[NSColor greenColor].CGColor];

    // Do any additional setup after loading the view.
}

- (IBAction)centralViewOnClick:(NSClickGestureRecognizer *)sender {
    if(!self.centralViewSelected){
    [self.centralView.layer setBorderColor:[NSColor blueColor].CGColor];
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
        [self.leftView.layer setBorderColor:[NSColor blueColor].CGColor];
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
        [self.footerView.layer setBorderColor:[NSColor blueColor].CGColor];
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
        [self.rightView.layer setBorderColor:[NSColor blueColor].CGColor];
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
        [self.headerView.layer setBorderColor:[NSColor blueColor].CGColor];
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
