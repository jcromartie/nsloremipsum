//
//  NSLoremIpsum.h
//  Created by John Cromartie on 12/6/12.
//
//  P.S. I hope this makes you happy Beelsebob
//

#import <Foundation/Foundation.h>

@interface NSString (LoremIpsum)

+ (NSString *)loremWords:(NSInteger)count;
+ (NSString *)loremParas:(NSInteger)count;
+ (NSString *)loremChars:(NSInteger)count;

@end
