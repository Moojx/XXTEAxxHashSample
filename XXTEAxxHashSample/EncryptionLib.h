//
//  EncryptionLib.h
//
//  Created by Minh Quy on 12/13/16.
//  Copyright © 2016 Minh Quy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncryptionLib : NSObject

+ (NSString *)encrypt:(NSString *)str;

+ (NSString *)decrypt:(NSString *)str;

+ (NSString *)hash:(NSString *)str;

@end
