//
//  DVMCard.m
//  DeckOfOneCard
//
//  Created by Jeremy Taylor on 12/1/20.
//

#import "DVMCard.h"

static NSString * const suitKey = @"suit";
static NSString * const valueKey = @"value";
static NSString * const imageKey = @"image";

@implementation DVMCard

- (instancetype)initWithSuit:(NSString *)suit value:(NSString *)value imageFromString:(NSString *)imageFromString
{
    self = [super init];
    if (self)
    {
        _suit = suit;
        _value = value;
        _imageFromString = imageFromString;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *suit = dictionary[suitKey];
    NSString *value = dictionary[valueKey];
    NSString *imageFromString = dictionary[imageKey];
    
    return [self initWithSuit:suit value:value imageFromString:imageFromString];
}

@end
