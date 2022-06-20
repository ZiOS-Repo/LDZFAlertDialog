

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (LdzfSafe)
- (nullable id)qnm_objectWithIndex:(NSUInteger)index;

- (nullable NSString*)qnm_stringWithIndex:(NSUInteger)index;

- (nullable NSNumber*)qnm_numberWithIndex:(NSUInteger)index;

- (nullable NSDecimalNumber *)qnm_decimalNumberWithIndex:(NSUInteger)index;

- (nullable NSArray*)qnm_arrayWithIndex:(NSUInteger)index;

- (nullable NSDictionary*)qnm_dictionaryWithIndex:(NSUInteger)index;

- (NSInteger)qnm_integerWithIndex:(NSUInteger)index;

- (NSUInteger)qnm_unsignedIntegerWithIndex:(NSUInteger)index;

- (BOOL)qnm_boolWithIndex:(NSUInteger)index;

- (int16_t)qnm_int16WithIndex:(NSUInteger)index;

- (int32_t)qnm_int32WithIndex:(NSUInteger)index;

- (int64_t)qnm_int64WithIndex:(NSUInteger)index;

- (char)qnm_charWithIndex:(NSUInteger)index;

- (short)qnm_shortWithIndex:(NSUInteger)index;

- (float)qnm_floatWithIndex:(NSUInteger)index;

- (double)qnm_doubleWithIndex:(NSUInteger)index;

- (nullable NSDate *)qnm_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;
//CG
- (CGFloat)qnm_CGFloatWithIndex:(NSUInteger)index;

- (CGPoint)qnm_pointWithIndex:(NSUInteger)index;

- (CGSize)qnm_sizeWithIndex:(NSUInteger)index;

- (CGRect)qnm_rectWithIndex:(NSUInteger)index;
@end
NS_ASSUME_NONNULL_END
