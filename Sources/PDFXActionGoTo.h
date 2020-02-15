//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import <PDFXKit/PDFXPlatform.h>
#import <PDFXKit/PDFXAction.h>

NS_ASSUME_NONNULL_BEGIN

@class PDFXDestination;

@interface PDFXActionGoTo : PDFXAction <NSCopying>

- (instancetype)initWithDestination:(PDFXDestination *)destination PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, strong) PDFXDestination *destination PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@end

NS_ASSUME_NONNULL_END
