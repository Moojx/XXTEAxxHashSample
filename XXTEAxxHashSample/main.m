//
//  main.m
//  XXTEAxxHashSample
//
//  Created by Minh Quy on 12/13/16.
//  Copyright © 2016 Minh Quy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EncryptionLib.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit";
        
        NSString *hash = [EncryptionLib hash:text];
        NSLog(@"hash: %@", hash);
        
        NSString *encryptedText = [EncryptionLib encrypt:text];
        NSLog(@"encrypt_data: %@", encryptedText);
        
        NSString *decryptedText = [EncryptionLib decrypt:encryptedText];
        NSLog(@"decrypt_data: %@", decryptedText);
    }
    return 0;
}
