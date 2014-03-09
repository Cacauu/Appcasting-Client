//
//  ACCXMLModel.h
//  Appcasting-Client
//
//  Created by Yannik Achternbosch on 08/03/14.
//  Copyright (c) 2014 Yannik Achternbosch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACCXMLModel : NSObject

+(NSXMLElement *)createReleaseWithContent:(NSDictionary *)content;
+(NSString *)RFC822Date;

@end
