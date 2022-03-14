//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#if FRAMEWORK_BUILD
#import <PDFXKit/PDFXPlatform.h>
#else
#import "PDFXPlatform.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface PDFXAction : NSObject <NSCopying>

@property (nonatomic, readonly) NSString *type PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@end

NS_ASSUME_NONNULL_END
