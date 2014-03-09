//
//  ACCMainViewController.m
//  Appcasting-Client
//
//  Created by Yannik Achternbosch on 08/03/14.
//  Copyright (c) 2014 Yannik Achternbosch. All rights reserved.
//

#import "ACCMainViewController.h"
#import "ACCXMLModel.h"

@implementation ACCMainViewController

- (IBAction)createRelease:(id)sender {
    NSMutableDictionary *content = [[NSMutableDictionary alloc] init];
    [content setObject:[_titleField stringValue] forKey:@"title"];
    [content setObject:[_releaseNotesField stringValue] forKey:@"releaseNotes"];
    if ([[_descriptionField stringValue] isNotEqualTo:@""]) {
        [content setObject:[_descriptionField stringValue] forKey:@"description"];
    }
    [content setObject:[_enclosureURLField stringValue] forKey:@"enclosureURL"];
    [content setObject:[_enclosureVersionField stringValue] forKey:@"enclosureVersion"];
    if ([[_enclosureDSAField stringValue] isNotEqualTo:@""]) {
        [content setObject:[_enclosureDSAField stringValue] forKey:@"enclosureDSA"];
    }
    [content setObject:[_enclosureLengthField stringValue] forKey:@"enclosureLength"];
    NSXMLElement *releaseItem = [ACCXMLModel createReleaseWithContent:content];
    NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
    NSString *releaseString = [NSString stringWithFormat:@"%@", releaseItem];
    [pasteboard clearContents];
    BOOL writePasteboard = [pasteboard writeObjects:[NSArray arrayWithObject:releaseString]];
    if (writePasteboard == FALSE) {
        NSAlert *errorAlert = [[NSAlert alloc] init];
        [errorAlert setAlertStyle:NSWarningAlertStyle];
        [errorAlert setMessageText:@"Failed to copy release"];
        [errorAlert setInformativeText:@"Failed to copy the release to clipboard"];
        [errorAlert runModal];
    }
}
@end
