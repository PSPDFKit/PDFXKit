//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#if FRAMEWORK_BUILD
#import <PDFXKit/PDFXDocument.h>
#else
#import "PDFXDocument.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface PDFXDocument ()

@property (nonatomic, readonly) NSInteger __swiftPageCount NS_SWIFT_NAME(pageCount);
- (nullable PDFXPage *)__swiftPageAtIndex:(NSInteger)index NS_SWIFT_NAME(page(at:));
- (NSInteger)__swiftIndexForPage:(PDFXPage *)page NS_SWIFT_NAME(index(for:));

- (void)__swiftInsertPage:(PDFXPage *)page atIndex:(NSInteger)index NS_SWIFT_NAME(insert(_:at:));
- (void)__swiftRemovePageAtIndex:(NSInteger)index  NS_SWIFT_NAME(removePage(at:));
- (void)__swiftExchangePageAtIndex:(NSInteger)indexOfPageToReplace withPageAtIndex:(NSInteger)indexOfReplacementPage NS_SWIFT_NAME(exchangePage(at:withPageAt:));

- (nullable PDFXSelection *)__swiftSelectionFromPage:(PDFXPage *)startPage atCharacterIndex:(NSInteger)startCharacter toPage:(PDFXPage *)endPage atCharacterIndex:(NSUInteger)endCharacter NS_SWIFT_NAME(selection(from:at:to:at:));

@end

NS_ASSUME_NONNULL_END
