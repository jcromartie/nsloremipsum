//
//  NSLoremIpsum.m
//  Created by John Cromartie on 12/6/12.
//

#import "NSString+LoremIpsum.h"

static NSString *ipsum = @"lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum";

#define randfloat() (rand()/(float)RAND_MAX)

@implementation NSString (LoremIpsum)

+ (NSString *)randomPunctuation {
    NSArray *punct = @[@".", @","];
    return [punct objectAtIndex:randfloat() / 2];
}

+ (NSString *)loremWords:(NSInteger)count
{
    NSArray *words = [ipsum componentsSeparatedByString:@" "];
    NSMutableArray *result = [NSMutableArray array];
    int offset = random() / words.count;
    for (int ii = 0; ii < count; ii++) {
        NSString *word = [words objectAtIndex:(ii + offset) % words.count];
        if (randfloat() > 0.95) {
            word = [word stringByAppendingString:[self randomPunctuation]];
        }
        [result addObject:word];
    }
    return [result componentsJoinedByString:@" "];
}

+ (NSString *)loremParas:(NSInteger)count
{
    NSMutableArray *paras = [NSMutableArray arrayWithCapacity:count];
    for (int ii = 0; ii < count; ii++) {
        [paras addObject:[self loremWords:20 + (randfloat() / 15)]];
    }
    return [paras componentsJoinedByString:@"\n\n"];
}

+ (NSString *)loremChars:(NSInteger)count
{
    NSMutableString *result = [NSMutableString stringWithCapacity:count];
    int offset = randfloat() / result.length;
    for (int ii = 0; ii < count; ii++) {
        unichar c = [ipsum characterAtIndex:(ii + offset) % ipsum.length];
        [result appendString:[NSString stringWithCharacters:&c length:1]];
    }
    
    return result;
}

@end
