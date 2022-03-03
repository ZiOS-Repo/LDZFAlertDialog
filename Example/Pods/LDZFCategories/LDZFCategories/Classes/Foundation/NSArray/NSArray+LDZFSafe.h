

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (LdzfSafe)
- (nullable id)ldzf_objectWithIndex:(NSUInteger)index;

- (nullable NSString*)ldzf_stringWithIndex:(NSUInteger)index;

- (nullable NSNumber*)ldzf_numberWithIndex:(NSUInteger)index;

- (nullable NSDecimalNumber *)ldzf_decimalNumberWithIndex:(NSUInteger)index;

- (nullable NSArray*)ldzf_arrayWithIndex:(NSUInteger)index;

- (nullable NSDictionary*)ldzf_dictionaryWithIndex:(NSUInteger)index;

- (NSInteger)ldzf_integerWithIndex:(NSUInteger)index;

- (NSUInteger)ldzf_unsignedIntegerWithIndex:(NSUInteger)index;

- (BOOL)ldzf_boolWithIndex:(NSUInteger)index;

- (int16_t)ldzf_int16WithIndex:(NSUInteger)index;

- (int32_t)ldzf_int32WithIndex:(NSUInteger)index;

- (int64_t)ldzf_int64WithIndex:(NSUInteger)index;

- (char)ldzf_charWithIndex:(NSUInteger)index;

- (short)ldzf_shortWithIndex:(NSUInteger)index;

- (float)ldzf_floatWithIndex:(NSUInteger)index;

- (double)ldzf_doubleWithIndex:(NSUInteger)index;

- (nullable NSDate *)ldzf_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;
//CG
- (CGFloat)ldzf_CGFloatWithIndex:(NSUInteger)index;

- (CGPoint)ldzf_pointWithIndex:(NSUInteger)index;

- (CGSize)ldzf_sizeWithIndex:(NSUInteger)index;

- (CGRect)ldzf_rectWithIndex:(NSUInteger)index;
@end
NS_ASSUME_NONNULL_END
