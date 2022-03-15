//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#if FRAMEWORK_BUILD
#import <PDFXKit/PDFXPlatform.h>
#import <PDFXKit/PDFXAnnotation.h>
#else
#import "PDFXPlatform.h"
#import "PDFXAnnotation.h"
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NSString* const PDFXAppearanceCharacteristicsKey NS_STRING_ENUM;

PDFX_EXTERN PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyBackgroundColor;
PDFX_EXTERN PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyBorderColor;
PDFX_EXTERN PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyCaption;
PDFX_EXTERN PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyDownCaption;
PDFX_EXTERN PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyRolloverCaption;
PDFX_EXTERN PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyRotation;

@interface PDFXAppearanceCharacteristics : NSObject <NSCopying>

@property (nonatomic) PDFXWidgetControlType controlType PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy, nullable) PDFXColor *backgroundColor PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, copy, nullable) PDFXColor *borderColor PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic) NSInteger rotation PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, copy, nullable) NSString *caption PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy, nullable) NSString *rolloverCaption PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, copy, nullable) NSString *downCaption PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, readonly, copy) NSDictionary *appearanceCharacteristicsKeyValues PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@end

NS_ASSUME_NONNULL_END
