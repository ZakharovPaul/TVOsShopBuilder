//
//  AppDelegate.m
//  TvBuilderInterfaceEditor
//
//  Created by Pavel Zakharov on 11/7/15.
//  Copyright © 2015 Pavel Zakharov. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (IBAction)saveAssButtonPressed:(id)sender {
    NSSavePanel* panel = [NSSavePanel savePanel];
    [panel beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
                // create a file namaner and grab the save panel's returned URL
            //    NSFileManager *manager = [NSFileManager defaultManager];
                NSURL *saveURL = [panel URL];
            
            NSData *jsonData=[NSJSONSerialization dataWithJSONObject:self.layoutData options:NSJSONWritingPrettyPrinted error:NULL];
            [jsonData writeToURL:saveURL atomically:YES];
        
                // then copy a previous file to the new location
            }
        }];
    
            }

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
