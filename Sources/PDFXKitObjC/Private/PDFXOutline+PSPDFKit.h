//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXOutline.h"

NS_ASSUME_NONNULL_BEGIN

@class PSPDFOutlineElement;

@interface PDFXOutline ()

@property (nonatomic, strong) PSPDFOutlineElement *pspdfOutlineElement;

- (instancetype)initWithPSPDFOutlineElement:(PSPDFOutlineElement *)pspdfOutlineElement index:(NSUInteger)index parent:(nullable PDFXOutline *)parent document:(PDFXDocument *)document;

@end

NS_ASSUME_NONNULL_END
