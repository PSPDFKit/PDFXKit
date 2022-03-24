//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXDocument.h"
#import "PSPDFKit+PDFXKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDFXDocument ()

@property (nonatomic) PSPDFDocument *pspdfDocument;
@property (nonatomic, nullable) PSPDFTextSearch *pspdfTextSearch;

- (instancetype)initWithPSPDFDocument:(PSPDFDocument *)pspdfDocument NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
