//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXPage.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDFXPage ()

// This property is only allowed to be set by the document.
@property (nonatomic, readwrite, weak, nullable) PDFXDocument *document;
@property (nonatomic) NSUInteger index;

@end

NS_ASSUME_NONNULL_END
