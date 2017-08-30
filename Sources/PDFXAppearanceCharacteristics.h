//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import <PDFXKit/PDFXPlatform.h>
#import <PDFXKit/PDFXAnnotation.h>

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
