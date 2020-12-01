//
//  DVMCardController.h
//  DeckOfOneCard
//
//  Created by Jeremy Taylor on 12/1/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DVMCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface DVMCardController : NSObject

+ (void)drawNewCard:(NSNumber *)numberOfCards completion:(void(^) (NSArray<DVMCard *> *_Nullable cards))completion;

+ (void)fetchCardImage:(DVMCard *)card completion:(void(^) (UIImage *_Nullable image))completion;

@end

NS_ASSUME_NONNULL_END
