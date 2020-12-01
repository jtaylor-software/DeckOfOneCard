//
//  DVMCard.h
//  DeckOfOneCard
//
//  Created by Jeremy Taylor on 12/1/20.
//

#import <Foundation/Foundation.h>

@interface DVMCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *value;
@property (nonatomic, copy, readonly) NSString *imageFromString;

- (instancetype)initWithSuit:(NSString *)suit
                value:(NSString *)value
                imageFromString:(NSString *)imageFromString;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end


