//
//  DVMCardController.m
//  DeckOfOneCard
//
//  Created by Jeremy Taylor on 12/1/20.
//

#import "DVMCardController.h"
#import "DVMCard.h"

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/";
static NSString * const drawComponent = @"draw/";
static NSString * const countQueryString = @"count";
static NSString * const cardsArray = @"cards";

@implementation DVMCardController

+ (void)drawNewCard:(NSNumber *)numberOfCards completion:(void (^)(NSArray<DVMCard *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *drawURL = [baseURL URLByAppendingPathComponent:drawComponent];
    NSString *cardCount = [numberOfCards stringValue];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:countQueryString value:cardCount];
    
    urlComponents.queryItems = @[queryItem];
    
    NSURL *finalURL = urlComponents.URL;
    
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"Error no data returned");
            completion(nil);
            return;
        }
        
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (![jsonDict isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Unable to create dictionary from data");
            completion(nil);
            return;
        }
        
        NSArray *myCardsArray = jsonDict[cardsArray];
        
        NSMutableArray *temporaryCardsArray = [NSMutableArray array];
        
        for (NSDictionary *cardDict in myCardsArray)
        {
            DVMCard *card = [[DVMCard alloc] initWithDictionary:cardDict];
            [temporaryCardsArray addObject:card];
        }
        completion(temporaryCardsArray);
    }]resume];
}

+ (void)fetchCardImage:(DVMCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.imageFromString];
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
        }
        if (!data)
        {
            NSLog(@"No data returned from task");
            completion(nil);
        }
        
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);
        
    }]resume];
}
@end
