//
//  ViewController.h
//  TvBuilderInterfaceEditor
//
//  Created by Pavel Zakharov on 11/7/15.
//  Copyright © 2015 Pavel Zakharov. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ViewController : NSViewController

@property (weak) IBOutlet NSView *headerView;
@property (assign) bool headerViewSelected;

@property (weak) IBOutlet NSView *leftView;
@property (assign) bool leftViewSelected;

@property (weak) IBOutlet NSView *footerView;
@property (assign) bool footerViewSelected;

@property (weak) IBOutlet NSView *centralView;
@property (assign) bool centralViewSelected;

@property (weak) IBOutlet NSView *rightView;
@property (assign) bool rightViewSelected;
@property (weak) IBOutlet NSLayoutConstraint *footerViewConstraintHeigth;
@property (weak) IBOutlet NSLayoutConstraint *leftViewConstraintWidth;
@property (weak) IBOutlet NSLayoutConstraint *rightViewConstraintWidth;
@property (weak) IBOutlet NSLayoutConstraint *headerViewConstraintHeigth;

@end

