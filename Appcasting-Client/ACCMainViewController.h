//
//  ACCMainViewController.h
//  Appcasting-Client
//
//  Created by Yannik Achternbosch on 08/03/14.
//  Copyright (c) 2014 Yannik Achternbosch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACCMainViewController : NSObject

// Text Fields
@property (weak) IBOutlet NSTextField *titleField;
@property (weak) IBOutlet NSTextField *releaseNotesField;
@property (weak) IBOutlet NSTextField *descriptionField;
@property (weak) IBOutlet NSTextField *minimumOSField;
@property (weak) IBOutlet NSTextField *enclosureURLField;
@property (weak) IBOutlet NSTextField *enclosureVersionField;
@property (weak) IBOutlet NSTextField *enclosureDSAField;
@property (weak) IBOutlet NSTextField *enclosureLengthField;

// Buttons
- (IBAction)createRelease:(id)sender;
@property (weak) IBOutlet NSButton *createReleaseButton;


@end
