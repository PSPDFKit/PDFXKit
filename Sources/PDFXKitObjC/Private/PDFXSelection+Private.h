//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXSelection.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDFXSelection ()

/**
 Quick & dirty init method to create a simple selection for displaying search
 results. Will be revised soonish.
 */
- (instancetype)initWithDocument:(PDFXDocument *)document page:(nullable PDFXPage *)page range:(NSRange)range string:(nullable NSString *)string;

@end

NS_ASSUME_NONNULL_END
