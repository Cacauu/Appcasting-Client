//
//  ACCXMLModel.m
//  Appcasting-Client
//
//  Created by Yannik Achternbosch on 08/03/14.
//  Copyright (c) 2014 Yannik Achternbosch. All rights reserved.
//

#import "ACCXMLModel.h"

@implementation ACCXMLModel

+(NSXMLElement *)createReleaseWithContent:(NSDictionary *)content {
    NSXMLElement *root = [NSXMLNode elementWithName:@"item"];
    NSXMLDocument *XMLDoc = [[NSXMLDocument alloc] initWithRootElement:root];
    [XMLDoc setVersion:@"1.0"];
    [XMLDoc setCharacterEncoding:@"UTF-8"];
    [root addChild:[NSXMLNode elementWithName:@"title" stringValue:[content valueForKey:@"title"]]];
    [root addChild:[NSXMLNode elementWithName:@"sparkle:releaseNotesLink" stringValue:[content valueForKey:@"releaseNotes"]]]; //TODO: Check if provided string is link
    [root addChild:[NSXMLNode elementWithName:@"pubDate" stringValue:[self RFC822Date]]];
    if ([content valueForKey:@"description"]) {
        [root addChild:[NSXMLNode elementWithName:@"description" stringValue:[content valueForKey:@"description"]]];
    }
    if ([content valueForKey:@"minimumOS"]) {
        [root addChild:[NSXMLNode elementWithName:@"sparkle:minimumSystemVersion" stringValue:[content valueForKey:@"minimumOS"]]];
    }
    NSXMLNode *url = [[NSXMLNode alloc] initWithKind:NSXMLAttributeKind];
    [url setName:@"url"];
    [url setStringValue:[content valueForKey:@"enclosureURL"]];
    NSXMLNode *version = [[NSXMLNode alloc] initWithKind:NSXMLAttributeKind];
    [version setName:@"sparkle:version"];
    [version setStringValue:[content valueForKey:@"enclosureVersion"]];
    NSXMLNode *length = [[NSXMLNode alloc] initWithKind:NSXMLAttributeKind];
    [length setName:@"length"];
    [length setStringValue:[content valueForKey:@"enclosureLength"]];
    NSXMLNode *type = [[NSXMLNode alloc] initWithKind:NSXMLAttributeKind];
    [type setName:@"type"];
    [type setStringValue:@"application/octet-stream"];
    if ([content valueForKey:@"enclosureDSA"]) {
        NSXMLNode *dsaSignature = [[NSXMLNode alloc] initWithKind:NSXMLAttributeKind];
        [dsaSignature setName:@"sparkle:dsaSignature"];
        [dsaSignature setStringValue:[content valueForKey:@"enclosureDSA"]];
        NSArray *attributes = [[NSArray alloc] initWithObjects:url, version, dsaSignature, length, type, nil];
        [root addChild:[NSXMLNode elementWithName:@"enclosure" children:nil attributes:attributes]];
    }
    else {
        NSArray *attributes = [[NSArray alloc] initWithObjects:url, version, length, type, nil];
        [root addChild:[NSXMLNode elementWithName:@"enclosure" children:nil attributes:attributes]];
    }
    return root;
}

+(NSString *)RFC822Date {
    NSDateFormatter* DateFormatter = [[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
    [DateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSString* theDate = [DateFormatter stringFromDate:[NSDate date]];
    return theDate;
}

@end
