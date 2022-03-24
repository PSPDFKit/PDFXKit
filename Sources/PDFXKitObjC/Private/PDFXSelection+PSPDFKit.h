//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXSelection.h"

NS_ASSUME_NONNULL_BEGIN

@class PSPDFSearchResult;

@interface PDFXSelection ()

/**
 Only set if the selection was created from a PSPDF search result, otherwise
this property is `nil`.
 */
@property (nonatomic, nullable) PSPDFSearchResult *pspdfSearchResult;

/**
 Use this to create selections from search results, the search result is then
 retained and accessed for PSDPFKit interoperability.
 */
- (nullable instancetype)initWithDocument:(PDFXDocument *)document PSPDFSearchResult:(PSPDFSearchResult *)pspdfSearchResult;

@end

NS_ASSUME_NONNULL_END
