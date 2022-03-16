//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#if FRAMEWORK_BUILD
#import <PDFXKit/PDFXPlatform.h>
#import <PDFXKit/PDFXPage.h>
#else
#import "PDFXPlatform.h"
#import "PDFXPage.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class PDFXAction;
@class PDFXAnnotationPopup;
@class PDFXBorder;
@class PDFXDestination;

typedef NS_ENUM(NSInteger, PDFXLineStyle) {
    kPDFXLineStyleNone = 0,
    kPDFXLineStyleSquare = 1,
    kPDFXLineStyleCircle = 2,
    kPDFXLineStyleDiamond = 3,
    kPDFXLineStyleOpenArrow = 4,
    kPDFXLineStyleClosedArrow = 5
};

typedef NS_ENUM(NSInteger, PDFXMarkupType) {
    kPDFXMarkupTypeHighlight = 0,
    kPDFXMarkupTypeStrikeOut = 1,
    kPDFXMarkupTypeUnderline = 2
};

typedef NS_ENUM(NSInteger, PDFXTextAnnotationIconType) {
    kPDFXTextAnnotationIconComment = 0,
    kPDFXTextAnnotationIconKey = 1,
    kPDFXTextAnnotationIconNote = 2,
    kPDFXTextAnnotationIconHelp = 3,
    kPDFXTextAnnotationIconNewParagraph = 4,
    kPDFXTextAnnotationIconParagraph = 5,
    kPDFXTextAnnotationIconInsert = 6
};

typedef NS_ENUM(NSInteger, PDFXWidgetCellState) {
    kPDFXWidgetMixedState = -1,
    kPDFXWidgetOffState = 0,
    kPDFXWidgetOnState = 1,
};

typedef NS_ENUM(NSInteger, PDFXWidgetControlType) {
    kPDFXWidgetUnknownControl = -1,
    kPDFXWidgetPushButtonControl = 0,
    kPDFXWidgetRadioButtonControl = 1,
    kPDFXWidgetCheckBoxControl = 2
};

typedef NSString *const PDFXAnnotationKey NS_STRING_ENUM;
typedef NSString *const PDFXAnnotationSubtype NS_STRING_ENUM;
typedef NSString *const PDFXAnnotationWidgetSubtype NS_STRING_ENUM;
typedef NSString *const PDFXAnnotationLineEndingStyle NS_STRING_ENUM;
typedef NSString *const PDFXAnnotationTextIconType NS_STRING_ENUM;
typedef NSString *const PDFXAnnotationHighlightingMode NS_STRING_ENUM;

PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyAppearanceDictionary;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyAppearanceState;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyBorder;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyColor;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyContents;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyDate;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyFlags;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyName;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyPage;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyRect;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeySubtype;

PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyAction;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyAdditionalActions;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyBorderStyle;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyDefaultAppearance;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyDestination;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyHighlightingMode;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyIconName;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyInklist;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyInteriorColor;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyLineEndingStyles;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyLinePoints;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyOpen;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyParent;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyPopup;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyQuadding;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyQuadPoints;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyTextLabel;

PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyWidgetAppearanceDictionary;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyWidgetBackgroundColor;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyWidgetBorderColor;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyWidgetCaption;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyWidgetDefaultValue;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyWidgetDownCaption;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyWidgetFieldFlags;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyWidgetFieldType;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyWidgetMaxLen;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyWidgetOptions;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyWidgetRolloverCaption;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyWidgetRotation;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyWidgetTextLabelUI;
PDFX_EXTERN PDFXAnnotationKey PDFXAnnotationKeyWidgetValue;

PDFX_EXTERN PDFXAnnotationSubtype PDFXAnnotationSubtypeCircle;
PDFX_EXTERN PDFXAnnotationSubtype PDFXAnnotationSubtypeFreeText;
PDFX_EXTERN PDFXAnnotationSubtype PDFXAnnotationSubtypeHighlight;
PDFX_EXTERN PDFXAnnotationSubtype PDFXAnnotationSubtypeInk;
PDFX_EXTERN PDFXAnnotationSubtype PDFXAnnotationSubtypeLine;
PDFX_EXTERN PDFXAnnotationSubtype PDFXAnnotationSubtypeLink;
PDFX_EXTERN PDFXAnnotationSubtype PDFXAnnotationSubtypePopup;
PDFX_EXTERN PDFXAnnotationSubtype PDFXAnnotationSubtypeSquare;
PDFX_EXTERN PDFXAnnotationSubtype PDFXAnnotationSubtypeStamp;
PDFX_EXTERN PDFXAnnotationSubtype PDFXAnnotationSubtypeStrikeOut;
PDFX_EXTERN PDFXAnnotationSubtype PDFXAnnotationSubtypeText;
PDFX_EXTERN PDFXAnnotationSubtype PDFXAnnotationSubtypeUnderline;
PDFX_EXTERN PDFXAnnotationSubtype PDFXAnnotationSubtypeWidget;

PDFX_EXTERN PDFXAnnotationWidgetSubtype PDFXAnnotationWidgetSubtypeButton;
PDFX_EXTERN PDFXAnnotationWidgetSubtype PDFXAnnotationWidgetSubtypeChoice;
PDFX_EXTERN PDFXAnnotationWidgetSubtype PDFXAnnotationWidgetSubtypeSignature;
PDFX_EXTERN PDFXAnnotationWidgetSubtype PDFXAnnotationWidgetSubtypeText;

PDFX_EXTERN PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleCircle;
PDFX_EXTERN PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleClosedArrow;
PDFX_EXTERN PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleDiamond;
PDFX_EXTERN PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleNone;
PDFX_EXTERN PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleOpenArrow;
PDFX_EXTERN PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleSquare;

PDFX_EXTERN PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeComment;
PDFX_EXTERN PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeHelp;
PDFX_EXTERN PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeInsert;
PDFX_EXTERN PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeKey;
PDFX_EXTERN PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeNewParagraph;
PDFX_EXTERN PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeNote;
PDFX_EXTERN PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeParagraph;

PDFX_EXTERN PDFXAnnotationHighlightingMode PDFXAnnotationHighlightingModeInvert;
PDFX_EXTERN PDFXAnnotationHighlightingMode PDFXAnnotationHighlightingModeNone;
PDFX_EXTERN PDFXAnnotationHighlightingMode PDFXAnnotationHighlightingModeOutline;
PDFX_EXTERN PDFXAnnotationHighlightingMode PDFXAnnotationHighlightingModePush;

@interface PDFXAnnotation : NSObject <NSCopying, NSCoding>

/// @name Initializing an Annotation

- (instancetype)initWithBounds:(PDFXRect)bounds forType:(PDFXAnnotationSubtype)annotationType withProperties:(nullable NSDictionary*)properties PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Accessing Information About an Annotation

@property (nonatomic, weak, nullable) PDFXPage *page PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy, nullable) NSString *userName PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, copy, nullable) NSDate *modificationDate PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, strong, nullable) PDFXAnnotationPopup *popup PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, copy, nullable) NSString *type PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Managing Annotation Display Characteristics

@property (nonatomic) PDFXRect bounds PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, readonly) BOOL hasAppearanceStream PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, strong, nullable) PDFXBorder *border PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy) PDFXColor *color PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Managing Annotation Drawing and Output

@property (nonatomic) BOOL shouldDisplay PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic) BOOL shouldPrint PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (void)drawWithBox:(PDFXDisplayBox)box inContext:(CGContextRef)context PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Working With Attributes

@property (nonatomic, readonly, copy) NSDictionary *annotationKeyValues PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (BOOL)setBoolean:(BOOL)value forAnnotationKey:(PDFXAnnotationKey)key PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (BOOL)setRect:(PDFXRect)value forAnnotationKey:(PDFXAnnotationKey)key PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (nullable id)valueForAnnotationKey:(PDFXAnnotationKey)key PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (BOOL)setValue:(id)value forAnnotationKey:(PDFXAnnotationKey)key PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (void)removeValueForAnnotationKey:(PDFXAnnotationKey)key PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Miscellaneous

@property (nonatomic, copy, nullable) NSString *contents PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, strong, nullable) PDFXAction *action PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, getter = isHighlighted) BOOL highlighted PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Utilities

@property (nonatomic, copy, nullable) PDFXFont *font PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy, nullable) PDFXColor *fontColor PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic) NSTextAlignment alignment PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic) PDFXPoint startPoint PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic) PDFXPoint endPoint PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic) PDFXLineStyle startLineStyle PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic) PDFXLineStyle endLineStyle PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

+ (PDFXLineStyle)lineStyleFromName:(NSString *)name PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
+ (NSString *)nameForLineStyle:(PDFXLineStyle)style PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic) PDFXTextAnnotationIconType iconType PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy, nullable) NSArray<NSValue *> *quadrilateralPoints PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic) PDFXMarkupType markupType PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy) PDFXAnnotationWidgetSubtype widgetFieldType PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic) PDFXWidgetControlType widgetControlType PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, getter = isMultiline) BOOL multiline PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, readonly) BOOL isPasswordField PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, getter = hasComb) BOOL comb PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic) NSInteger maximumLength PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, copy, nullable) NSString *widgetStringValue PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy, nullable) NSString *widgetDefaultStringValue PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic) BOOL allowsToggleToOff PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic) BOOL radiosInUnison PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, getter = isReadOnly) BOOL readOnly PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, getter = isListChoice) BOOL listChoice PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, copy, nullable) NSArray<NSString *> *choices PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy, nullable) NSArray<NSString *> *values PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic) PDFXWidgetCellState buttonWidgetState PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy) NSString *buttonWidgetStateString PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, getter = isOpen) BOOL open PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, readonly, nullable) NSArray<PDFXBezierPath *> *paths PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

- (void)addBezierPath:(PDFXBezierPath *)path PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (void)removeBezierPath:(PDFXBezierPath *)path PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, strong, nullable) PDFXDestination *destination PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy, nullable) NSURL *URL PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, copy, nullable) NSString *fieldName PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy, nullable) NSString *caption PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, copy, nullable) PDFXColor *backgroundColor PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@end

NS_ASSUME_NONNULL_END
