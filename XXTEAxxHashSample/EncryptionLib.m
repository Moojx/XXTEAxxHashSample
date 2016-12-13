//
//  EncryptionLib.m
//
//  Created by Minh Quy on 12/13/16.
//  Copyright © 2016 Minh Quy. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#import "base64.h"
#import "xxtea.h"
#import "xxhash.h"
#import "EncryptionLib.h"

const NSString *KEY = @"123456";

@implementation EncryptionLib

+ (NSString *)encrypt:(NSString *)str {
    size_t out_len;
    NSData *keyData = [KEY dataUsingEncoding:NSUTF8StringEncoding];
    NSData *strData = [str dataUsingEncoding:NSUTF8StringEncoding];
    void *encryptBytes = xxtea_encrypt(strData.bytes, strData.length, keyData.bytes, &out_len);
    NSData *encryptData = [NSData dataWithBytesNoCopy:encryptBytes length:out_len freeWhenDone:YES];
    return [encryptData base64EncodedStringWithOptions:0];
}

+ (NSString *)decrypt:(NSString *)str {
    size_t out_len;
    NSData *keyData = [KEY dataUsingEncoding:NSUTF8StringEncoding];
    NSData *base64Data = [[NSData alloc] initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    void *decryptBytes = xxtea_decrypt(base64Data.bytes, base64Data.length, keyData.bytes, &out_len);
    NSData *decryptData = [NSData dataWithBytesNoCopy:decryptBytes length:out_len freeWhenDone:YES];
    return [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
}

+ (NSString *)hash:(NSString *)str {
    const char *strChar = [str UTF8String];
    unsigned int sum = XXH32(strChar, strlen(strChar), 0);
    return [NSString stringWithFormat:@"%08x", sum];
}

@end
