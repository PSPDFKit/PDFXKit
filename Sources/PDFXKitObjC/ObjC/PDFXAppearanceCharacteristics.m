//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXAppearanceCharacteristics+PSPDFKit.h"
#import "PDFXPlatform+Private.h"
#import "PSPDFKit+PDFXKit.h"

PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyBackgroundColor = @"BG";
PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyBorderColor = @"BC";
PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyCaption = @"CA";
PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyDownCaption = @"AC";
PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyRolloverCaption = @"RC";
PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyRotation = @"R";

@implementation PDFXAppearanceCharacteristics

- (instancetype)init {
    if ((self = [super init])) {
        // TODO: implement.
    }
    return self;
}

// @property (nonatomic) PDFXWidgetControlType controlType;
// @property (nonatomic, copy, nullable) PDFXColor *backgroundColor;

// @property (nonatomic, copy, nullable) PDFXColor *borderColor;
// @property (nonatomic) NSInteger rotation;

// @property (nonatomic, copy, nullable) NSString *caption;
// @property (nonatomic, copy, nullable) NSString *rolloverCaption;

// @property (nonatomic, copy, nullable) NSString *downCaption;
// @property (nonatomic, readonly, copy) NSDictionary *appearanceCharacteristicsKeyValues;

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    // TODO: implement.
    return  [self.class new];
}

@end
