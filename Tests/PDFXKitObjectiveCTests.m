//
//
//  Created by Konstantin Bender on 11.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <PDFKit/PDFKit.h>

static NSString *PDFXReplacePrefixPDFWithPDFX(NSString *string);

@interface PDFXKitObjectiveCTests : XCTestCase

@end

@implementation PDFXKitObjectiveCTests

- (void)setUp {
    [super setUp];
    // Nothing to do yet.
}

- (void)tearDown {
    // Nothing to do yet.
    [super tearDown];
}

#pragma mark - Printing String Definitions

// This isn't a test but a simple script to PDFXKit definitions for PDFKit
// strings. Simply remove `DISABLED` and copy the console output into the
// appropriate implementation files.

- (void)testPrintStringDefinitions {
    [self printAnnotationStringDefinitions];
    [self printBorderStringDefinitions];
    [self printDocumentStringDefinitions];
    [self printAppearanceCharacteristicsStringDefinitions];
    [self printThumbnailViewStringDefinitions];
    [self printPDFViewStringDefinitions];
}

- (void)printAnnotationStringDefinitions {
    NSLog(@"// ------------------------- <PDFXAnnotation> -----------------------------");
    NSLog(@"");
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyAppearanceDictionary = @\"%@\";", PDFAnnotationKeyAppearanceDictionary);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyAppearanceState = @\"%@\";", PDFAnnotationKeyAppearanceState);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyBorder = @\"%@\";", PDFAnnotationKeyBorder);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyColor = @\"%@\";", PDFAnnotationKeyColor);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyContents = @\"%@\";", PDFAnnotationKeyContents);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyDate = @\"%@\";", PDFAnnotationKeyDate);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyFlags = @\"%@\";", PDFAnnotationKeyFlags);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyName = @\"%@\";", PDFAnnotationKeyName);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyPage = @\"%@\";", PDFAnnotationKeyPage);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyRect = @\"%@\";", PDFAnnotationKeyRect);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeySubtype = @\"%@\";", PDFAnnotationKeySubtype);
    NSLog(@"");
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyAction = @\"%@\";", PDFAnnotationKeyAction);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyAdditionalActions = @\"%@\";", PDFAnnotationKeyAdditionalActions);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyBorderStyle = @\"%@\";", PDFAnnotationKeyBorderStyle);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyDefaultAppearance = @\"%@\";", PDFAnnotationKeyDefaultAppearance);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyDestination = @\"%@\";", PDFAnnotationKeyDestination);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyHighlightingMode = @\"%@\";", PDFAnnotationKeyHighlightingMode);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyIconName = @\"%@\";", PDFAnnotationKeyIconName);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyInklist = @\"%@\";", PDFAnnotationKeyInklist);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyInteriorColor = @\"%@\";", PDFAnnotationKeyInteriorColor);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyLineEndingStyles = @\"%@\";", PDFAnnotationKeyLineEndingStyles);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyLinePoints = @\"%@\";", PDFAnnotationKeyLinePoints);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyOpen = @\"%@\";", PDFAnnotationKeyOpen);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyParent = @\"%@\";", PDFAnnotationKeyParent);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyPopup = @\"%@\";", PDFAnnotationKeyPopup);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyQuadding = @\"%@\";", PDFAnnotationKeyQuadding);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyQuadPoints = @\"%@\";", PDFAnnotationKeyQuadPoints);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyTextLabel = @\"%@\";", PDFAnnotationKeyTextLabel);
    NSLog(@"");
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyWidgetAppearanceDictionary = @\"%@\";", PDFAnnotationKeyWidgetAppearanceDictionary);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyWidgetBackgroundColor = @\"%@\";", PDFAnnotationKeyWidgetBackgroundColor);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyWidgetBorderColor = @\"%@\";", PDFAnnotationKeyWidgetBorderColor);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyWidgetCaption = @\"%@\";", PDFAnnotationKeyWidgetCaption);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyWidgetDefaultValue = @\"%@\";", PDFAnnotationKeyWidgetDefaultValue);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyWidgetDownCaption = @\"%@\";", PDFAnnotationKeyWidgetDownCaption);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyWidgetFieldFlags = @\"%@\";", PDFAnnotationKeyWidgetFieldFlags);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyWidgetFieldType = @\"%@\";", PDFAnnotationKeyWidgetFieldType);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyWidgetMaxLen = @\"%@\";", PDFAnnotationKeyWidgetMaxLen);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyWidgetOptions = @\"%@\";", PDFAnnotationKeyWidgetOptions);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyWidgetRolloverCaption = @\"%@\";", PDFAnnotationKeyWidgetRolloverCaption);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyWidgetRotation = @\"%@\";", PDFAnnotationKeyWidgetRotation);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyWidgetTextLabelUI = @\"%@\";", PDFAnnotationKeyWidgetTextLabelUI);
    NSLog(@"PDFXAnnotationKey PDFXAnnotationKeyWidgetValue = @\"%@\";", PDFAnnotationKeyWidgetValue);
    NSLog(@"");
    NSLog(@"PDFXAnnotationSubtype PDFXAnnotationSubtypeCircle = @\"%@\";", PDFAnnotationSubtypeCircle);
    NSLog(@"PDFXAnnotationSubtype PDFXAnnotationSubtypeFreeText = @\"%@\";", PDFAnnotationSubtypeFreeText);
    NSLog(@"PDFXAnnotationSubtype PDFXAnnotationSubtypeHighlight = @\"%@\";", PDFAnnotationSubtypeHighlight);
    NSLog(@"PDFXAnnotationSubtype PDFXAnnotationSubtypeInk = @\"%@\";", PDFAnnotationSubtypeInk);
    NSLog(@"PDFXAnnotationSubtype PDFXAnnotationSubtypeLine = @\"%@\";", PDFAnnotationSubtypeLine);
    NSLog(@"PDFXAnnotationSubtype PDFXAnnotationSubtypeLink = @\"%@\";", PDFAnnotationSubtypeLink);
    NSLog(@"PDFXAnnotationSubtype PDFXAnnotationSubtypePopup = @\"%@\";", PDFAnnotationSubtypePopup);
    NSLog(@"PDFXAnnotationSubtype PDFXAnnotationSubtypeSquare = @\"%@\";", PDFAnnotationSubtypeSquare);
    NSLog(@"PDFXAnnotationSubtype PDFXAnnotationSubtypeStamp = @\"%@\";", PDFAnnotationSubtypeStamp);
    NSLog(@"PDFXAnnotationSubtype PDFXAnnotationSubtypeStrikeOut = @\"%@\";", PDFAnnotationSubtypeStrikeOut);
    NSLog(@"PDFXAnnotationSubtype PDFXAnnotationSubtypeText = @\"%@\";", PDFAnnotationSubtypeText);
    NSLog(@"PDFXAnnotationSubtype PDFXAnnotationSubtypeUnderline = @\"%@\";", PDFAnnotationSubtypeUnderline);
    NSLog(@"PDFXAnnotationSubtype PDFXAnnotationSubtypeWidget = @\"%@\";", PDFAnnotationSubtypeWidget);
    NSLog(@"");
    NSLog(@"PDFXAnnotationWidgetSubtype PDFXAnnotationWidgetSubtypeButton = @\"%@\";", PDFAnnotationWidgetSubtypeButton);
    NSLog(@"PDFXAnnotationWidgetSubtype PDFXAnnotationWidgetSubtypeChoice = @\"%@\";", PDFAnnotationWidgetSubtypeChoice);
    NSLog(@"PDFXAnnotationWidgetSubtype PDFXAnnotationWidgetSubtypeSignature = @\"%@\";", PDFAnnotationWidgetSubtypeSignature);
    NSLog(@"PDFXAnnotationWidgetSubtype PDFXAnnotationWidgetSubtypeText = @\"%@\";", PDFAnnotationWidgetSubtypeText);
    NSLog(@"");
    NSLog(@"PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleCircle = @\"%@\";", PDFAnnotationLineEndingStyleCircle);
    NSLog(@"PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleClosedArrow = @\"%@\";", PDFAnnotationLineEndingStyleClosedArrow);
    NSLog(@"PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleDiamond = @\"%@\";", PDFAnnotationLineEndingStyleDiamond);
    NSLog(@"PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleNone = @\"%@\";", PDFAnnotationLineEndingStyleNone);
    NSLog(@"PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleOpenArrow = @\"%@\";", PDFAnnotationLineEndingStyleOpenArrow);
    NSLog(@"PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleSquare = @\"%@\";", PDFAnnotationLineEndingStyleSquare);
    NSLog(@"");
    NSLog(@"PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeComment = @\"%@\";", PDFAnnotationTextIconTypeComment);
    NSLog(@"PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeHelp = @\"%@\";", PDFAnnotationTextIconTypeHelp);
    NSLog(@"PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeInsert = @\"%@\";", PDFAnnotationTextIconTypeInsert);
    NSLog(@"PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeKey = @\"%@\";", PDFAnnotationTextIconTypeKey);
    NSLog(@"PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeNewParagraph = @\"%@\";", PDFAnnotationTextIconTypeNewParagraph);
    NSLog(@"PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeNote = @\"%@\";", PDFAnnotationTextIconTypeNote);
    NSLog(@"PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeParagraph = @\"%@\";", PDFAnnotationTextIconTypeParagraph);
    NSLog(@"");
    NSLog(@"PDFXAnnotationHighlightingMode PDFXAnnotationHighlightingModeInvert = @\"%@\";", PDFAnnotationHighlightingModeInvert);
    NSLog(@"PDFXAnnotationHighlightingMode PDFXAnnotationHighlightingModeNone = @\"%@\";", PDFAnnotationHighlightingModeNone);
    NSLog(@"PDFXAnnotationHighlightingMode PDFXAnnotationHighlightingModeOutline = @\"%@\";", PDFAnnotationHighlightingModeOutline);
    NSLog(@"PDFXAnnotationHighlightingMode PDFXAnnotationHighlightingModePush = @\"%@\";", PDFAnnotationHighlightingModePush);
    NSLog(@"// ------------------------- </PDFXAnnotation> -----------------------------");
}

- (void)printBorderStringDefinitions {
    NSLog(@"// ------------------------- <PDFXBorder> -----------------------------");
    NSLog(@"PDFXBorderKey PDFXBorderKeyDashPattern = @\"%@\";", PDFBorderKeyDashPattern);
    NSLog(@"PDFXBorderKey PDFXBorderKeyLineWidth = @\"%@\";", PDFBorderKeyLineWidth);
    NSLog(@"PDFXBorderKey PDFXBorderKeyStyle = @\"%@\";", PDFBorderKeyStyle);
    NSLog(@"// ------------------------- </PDFXBorder> -----------------------------");
}

- (void)printDocumentStringDefinitions {
    NSLog(@"// ------------------------- <PDFXDocument> -----------------------------");
    NSLog(@"NSNotificationName const PDFXDocumentDidUnlockNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFDocumentDidUnlockNotification));
    NSLog(@"NSNotificationName const PDFXDocumentDidBeginFindNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFDocumentDidBeginFindNotification));
    NSLog(@"NSNotificationName const PDFXDocumentDidEndFindNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFDocumentDidEndFindNotification));
    NSLog(@"NSNotificationName const PDFXDocumentDidBeginPageFindNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFDocumentDidBeginPageFindNotification));
    NSLog(@"NSNotificationName const PDFXDocumentDidEndPageFindNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFDocumentDidEndPageFindNotification));
    NSLog(@"NSNotificationName const PDFXDocumentDidFindMatchNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFDocumentDidFindMatchNotification));
    NSLog(@"NSNotificationName const PDFXDocumentDidBeginWriteNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFDocumentDidBeginWriteNotification));
    NSLog(@"NSNotificationName const PDFXDocumentDidEndWriteNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFDocumentDidEndWriteNotification));
    NSLog(@"NSNotificationName const PDFXDocumentDidBeginPageWriteNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFDocumentDidBeginPageWriteNotification));
    NSLog(@"NSNotificationName const PDFXDocumentDidEndPageWriteNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFDocumentDidEndPageWriteNotification));
    NSLog(@"");
    NSLog(@"PDFXDocumentAttribute PDFXDocumentAuthorAttribute = @\"%@\";", PDFDocumentAuthorAttribute);
    NSLog(@"PDFXDocumentAttribute PDFXDocumentCreationDateAttribute = @\"%@\";", PDFDocumentCreationDateAttribute);
    NSLog(@"PDFXDocumentAttribute PDFXDocumentCreatorAttribute = @\"%@\";", PDFDocumentCreatorAttribute);
    NSLog(@"PDFXDocumentAttribute PDFXDocumentKeywordsAttribute = @\"%@\";", PDFDocumentKeywordsAttribute);
    NSLog(@"PDFXDocumentAttribute PDFXDocumentModificationDateAttribute = @\"%@\";", PDFDocumentModificationDateAttribute);
    NSLog(@"PDFXDocumentAttribute PDFXDocumentProducerAttribute = @\"%@\";", PDFDocumentProducerAttribute);
    NSLog(@"PDFXDocumentAttribute PDFXDocumentSubjectAttribute = @\"%@\";", PDFDocumentSubjectAttribute);
    NSLog(@"PDFXDocumentAttribute PDFXDocumentTitleAttribute = @\"%@\";", PDFDocumentTitleAttribute);
    NSLog(@"");
    NSLog(@"PDFXDocumentWriteOption PDFXDocumentOwnerPasswordOption = @\"%@\";", PDFDocumentOwnerPasswordOption);
    NSLog(@"PDFXDocumentWriteOption PDFXDocumentUserPasswordOption = @\"%@\";", PDFDocumentUserPasswordOption);
    NSLog(@"// ------------------------- </PDFXDocument> -----------------------------");
}

- (void)printAppearanceCharacteristicsStringDefinitions {
    NSLog(@"// ------------------------- <PDFXAppearanceCharacteristics> -----------------------------");
    NSLog(@"PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyBackgroundColor = @\"%@\";", PDFAppearanceCharacteristicsKeyBackgroundColor);
    NSLog(@"PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyBorderColor = @\"%@\";", PDFAppearanceCharacteristicsKeyBorderColor);
    NSLog(@"PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyCaption = @\"%@\";", PDFAppearanceCharacteristicsKeyCaption);
    NSLog(@"PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyDownCaption = @\"%@\";", PDFAppearanceCharacteristicsKeyDownCaption);
    NSLog(@"PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyRolloverCaption = @\"%@\";", PDFAppearanceCharacteristicsKeyRolloverCaption);
    NSLog(@"PDFXAppearanceCharacteristicsKey PDFXAppearanceCharacteristicsKeyRotation = @\"%@\";", PDFAppearanceCharacteristicsKeyRotation);
    NSLog(@"// ------------------------- </PDFXAppearanceCharacteristics> -----------------------------");
}

- (void)printThumbnailViewStringDefinitions {
    NSLog(@"// ------------------------- <PDFXThumbnailView> -----------------------------");
    NSLog(@"NSNotificationName const PDFXThumbnailViewDocumentEditedNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFThumbnailViewDocumentEditedNotification));
    NSLog(@"// ------------------------- </PDFXThumbnailView> -----------------------------");
}

- (void)printPDFViewStringDefinitions {
    NSLog(@"// ------------------------- <PDFXView> -----------------------------");
    NSLog(@"NSNotificationName const PDFXViewDocumentChangedNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFViewDocumentChangedNotification));
    NSLog(@"NSNotificationName const PDFXViewChangedHistoryNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFViewChangedHistoryNotification));
    NSLog(@"NSNotificationName const PDFXViewPageChangedNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFViewPageChangedNotification));
    NSLog(@"NSNotificationName const PDFXViewScaleChangedNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFViewScaleChangedNotification));
    NSLog(@"NSNotificationName const PDFXViewAnnotationHitNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFViewAnnotationHitNotification));
    NSLog(@"NSNotificationName const PDFXViewCopyPermissionNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFViewCopyPermissionNotification));
    NSLog(@"NSNotificationName const PDFXViewPrintPermissionNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFViewPrintPermissionNotification));
    NSLog(@"NSNotificationName const PDFXViewAnnotationWillHitNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFViewAnnotationWillHitNotification));
    NSLog(@"NSNotificationName const PDFXViewSelectionChangedNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFViewSelectionChangedNotification));
    NSLog(@"NSNotificationName const PDFXViewDisplayModeChangedNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFViewDisplayModeChangedNotification));
    NSLog(@"NSNotificationName const PDFXViewDisplayBoxChangedNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFViewDisplayBoxChangedNotification));
    NSLog(@"NSNotificationName const PDFXViewVisiblePagesChangedNotification = @\"%@\";", PDFXReplacePrefixPDFWithPDFX(PDFViewVisiblePagesChangedNotification));
    NSLog(@"// ------------------------- </PDFXView> -----------------------------");
}

@end

static NSString *PDFXReplacePrefixPDFWithPDFX(NSString *string) {
    if ([string hasPrefix:@"PDF"]) {
        return [string stringByReplacingCharactersInRange:NSMakeRange(0, 3) withString:@"PDFX"];
    } else {
        return [@"PDFX" stringByAppendingString:string];
    }
}
