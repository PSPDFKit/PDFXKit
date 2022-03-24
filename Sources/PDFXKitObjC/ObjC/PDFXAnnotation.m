//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXAnnotation+PSPDFKit.h"
#import "PDFXPlatform+Private.h"
#import "PSPDFKit+PDFXKit.h"

PDFXAnnotationKey PDFXAnnotationKeyAppearanceDictionary = @"/AP";
PDFXAnnotationKey PDFXAnnotationKeyAppearanceState = @"/AS";
PDFXAnnotationKey PDFXAnnotationKeyBorder = @"/Border";
PDFXAnnotationKey PDFXAnnotationKeyColor = @"/C";
PDFXAnnotationKey PDFXAnnotationKeyContents = @"/Contents";
PDFXAnnotationKey PDFXAnnotationKeyDate = @"/M";
PDFXAnnotationKey PDFXAnnotationKeyFlags = @"/F";
PDFXAnnotationKey PDFXAnnotationKeyName = @"/NM";
PDFXAnnotationKey PDFXAnnotationKeyPage = @"/P";
PDFXAnnotationKey PDFXAnnotationKeyRect = @"/Rect";
PDFXAnnotationKey PDFXAnnotationKeySubtype = @"/Subtype";

PDFXAnnotationKey PDFXAnnotationKeyAction = @"/A";
PDFXAnnotationKey PDFXAnnotationKeyAdditionalActions = @"/AA";
PDFXAnnotationKey PDFXAnnotationKeyBorderStyle = @"/BS";
PDFXAnnotationKey PDFXAnnotationKeyDefaultAppearance = @"/DA";
PDFXAnnotationKey PDFXAnnotationKeyDestination = @"/Dest";
PDFXAnnotationKey PDFXAnnotationKeyHighlightingMode = @"/H";
PDFXAnnotationKey PDFXAnnotationKeyIconName = @"/Name";
PDFXAnnotationKey PDFXAnnotationKeyInklist = @"/InkList";
PDFXAnnotationKey PDFXAnnotationKeyInteriorColor = @"/IC";
PDFXAnnotationKey PDFXAnnotationKeyLineEndingStyles = @"/LE";
PDFXAnnotationKey PDFXAnnotationKeyLinePoints = @"/L";
PDFXAnnotationKey PDFXAnnotationKeyOpen = @"/Open";
PDFXAnnotationKey PDFXAnnotationKeyParent = @"/Parent";
PDFXAnnotationKey PDFXAnnotationKeyPopup = @"/Popup";
PDFXAnnotationKey PDFXAnnotationKeyQuadding = @"/Q";
PDFXAnnotationKey PDFXAnnotationKeyQuadPoints = @"/QuadPoints";
PDFXAnnotationKey PDFXAnnotationKeyTextLabel = @"/T";

PDFXAnnotationKey PDFXAnnotationKeyWidgetAppearanceDictionary = @"/MK";
PDFXAnnotationKey PDFXAnnotationKeyWidgetBackgroundColor = @"/BG";
PDFXAnnotationKey PDFXAnnotationKeyWidgetBorderColor = @"/BC";
PDFXAnnotationKey PDFXAnnotationKeyWidgetCaption = @"/CA";
PDFXAnnotationKey PDFXAnnotationKeyWidgetDefaultValue = @"/DV";
PDFXAnnotationKey PDFXAnnotationKeyWidgetDownCaption = @"/AC";
PDFXAnnotationKey PDFXAnnotationKeyWidgetFieldFlags = @"/Ff";
PDFXAnnotationKey PDFXAnnotationKeyWidgetFieldType = @"/FT";
PDFXAnnotationKey PDFXAnnotationKeyWidgetMaxLen = @"/MaxLen";
PDFXAnnotationKey PDFXAnnotationKeyWidgetOptions = @"/Opt";
PDFXAnnotationKey PDFXAnnotationKeyWidgetRolloverCaption = @"/RC";
PDFXAnnotationKey PDFXAnnotationKeyWidgetRotation = @"/R";
PDFXAnnotationKey PDFXAnnotationKeyWidgetTextLabelUI = @"/TU";
PDFXAnnotationKey PDFXAnnotationKeyWidgetValue = @"/V";

PDFXAnnotationSubtype PDFXAnnotationSubtypeCircle = @"/Circle";
PDFXAnnotationSubtype PDFXAnnotationSubtypeFreeText = @"/FreeText";
PDFXAnnotationSubtype PDFXAnnotationSubtypeHighlight = @"/Highlight";
PDFXAnnotationSubtype PDFXAnnotationSubtypeInk = @"/Ink";
PDFXAnnotationSubtype PDFXAnnotationSubtypeLine = @"/Line";
PDFXAnnotationSubtype PDFXAnnotationSubtypeLink = @"/Link";
PDFXAnnotationSubtype PDFXAnnotationSubtypePopup = @"/Popup";
PDFXAnnotationSubtype PDFXAnnotationSubtypeSquare = @"/Square";
PDFXAnnotationSubtype PDFXAnnotationSubtypeStamp = @"/Stamp";
PDFXAnnotationSubtype PDFXAnnotationSubtypeStrikeOut = @"/StrikeOut";
PDFXAnnotationSubtype PDFXAnnotationSubtypeText = @"/Text";
PDFXAnnotationSubtype PDFXAnnotationSubtypeUnderline = @"/Underline";
PDFXAnnotationSubtype PDFXAnnotationSubtypeWidget = @"/Widget";

PDFXAnnotationWidgetSubtype PDFXAnnotationWidgetSubtypeButton = @"/Btn";
PDFXAnnotationWidgetSubtype PDFXAnnotationWidgetSubtypeChoice = @"/Ch";
PDFXAnnotationWidgetSubtype PDFXAnnotationWidgetSubtypeSignature = @"/Sig";
PDFXAnnotationWidgetSubtype PDFXAnnotationWidgetSubtypeText = @"/Tx";

PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleCircle = @"/Circle";
PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleClosedArrow = @"/ClosedArrow";
PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleDiamond = @"/Diamond";
PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleNone = @"/None";
PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleOpenArrow = @"/OpenArrow";
PDFXAnnotationLineEndingStyle PDFXAnnotationLineEndingStyleSquare = @"/Square";

PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeComment = @"/Comment";
PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeHelp = @"/Help";
PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeInsert = @"/Insert";
PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeKey = @"/Key";
PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeNewParagraph = @"/NewParagraph";
PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeNote = @"/Note";
PDFXAnnotationTextIconType PDFXAnnotationTextIconTypeParagraph = @"/Paragraph";

PDFXAnnotationHighlightingMode PDFXAnnotationHighlightingModeInvert = @"/I";
PDFXAnnotationHighlightingMode PDFXAnnotationHighlightingModeNone = @"/N";
PDFXAnnotationHighlightingMode PDFXAnnotationHighlightingModeOutline = @"/O";
PDFXAnnotationHighlightingMode PDFXAnnotationHighlightingModePush = @"/P";

@implementation PDFXAnnotation

#pragma mark - Initializing an Annotation

- (instancetype)initWithBounds:(PDFXRect)bounds forType:(PDFXAnnotationSubtype)annotationType withProperties:(nullable NSDictionary*)properties {
    if ((self = [super init])) {
        // TODO: implement.
    }
    return self;
}

#pragma mark - Accessing Information About an Annotation

// @property (nonatomic, weak, nullable) PDFXPage *page;
// @property (nonatomic, copy, nullable) NSString *userName;
//
// @property (nonatomic, copy, nullable) NSDate *modificationDate;
// @property (nonatomic, strong, nullable) PDFXAnnotationPopup *popup;
//
// @property (nonatomic, copy, nullable) NSString *type;

#pragma mark - Managing Annotation Display Characteristics

// @property (nonatomic) PDFXRect bounds;

- (BOOL)hasAppearanceStream {
    // TODO: implement.
    return NO;
}

// @property (nonatomic, strong, nullable) PDFXBorder *border;
// @property (nonatomic, copy) PDFXColor *color;

#pragma mark - Managing Annotation Drawing and Output

// @property (nonatomic) BOOL shouldDisplay;
// @property (nonatomic) BOOL shouldPrint;

- (void)drawWithBox:(PDFXDisplayBox)box inContext:(CGContextRef)context {
    // TODO: implement.
}

#pragma mark - Working With Attributes

// @property (nonatomic, readonly, copy) NSDictionary *annotationKeyValues;

- (BOOL)setBoolean:(BOOL)value forAnnotationKey:(PDFXAnnotationKey)key {
    // TODO: implement.
    return NO;
}

- (BOOL)setRect:(PDFXRect)value forAnnotationKey:(PDFXAnnotationKey)key {
    // TODO: implement.
    return NO;
}

- (nullable id)valueForAnnotationKey:(PDFXAnnotationKey)key {
    // TODO: implement.
    return nil;
}

- (BOOL)setValue:(id)value forAnnotationKey:(PDFXAnnotationKey)key {
    // TODO: implement.
    return NO;
}

- (void)removeValueForAnnotationKey:(PDFXAnnotationKey)key {
    // TODO: implement.
}

#pragma mark - Miscellaneous

// @property (nonatomic, copy, nullable) NSString *contents;
// @property (nonatomic, strong, nullable) PDFXAction *action;
// @property (nonatomic, getter = isHighlighted) BOOL highlighted;

#pragma mark - Utilities

// @property (nonatomic, copy, nullable) PDFXFont *font;
// @property (nonatomic, copy, nullable) PDFXColor *fontColor;

// @property (nonatomic) NSTextAlignment alignment;

// @property (nonatomic) PDFXPoint startPoint;
// @property (nonatomic) PDFXPoint endPoint;

// @property (nonatomic) PDFXLineStyle startLineStyle;
// @property (nonatomic) PDFXLineStyle endLineStyle;

+ (PDFXLineStyle)lineStyleFromName:(NSString *)name {
    // TODO: implement.
    return kPDFXLineStyleNone;
}

+ (NSString *)nameForLineStyle:(PDFXLineStyle)style {
    // TODO: implement.
    return @"";
}

// @property (nonatomic) PDFXTextAnnotationIconType iconType;
// @property (nonatomic, copy, nullable) NSArray<NSValue *> *quadrilateralPoints;

// @property (nonatomic) PDFXMarkupType markupType;
// @property (nonatomic, copy) PDFXAnnotationWidgetSubtype widgetFieldType;

// @property (nonatomic) PDFXWidgetControlType widgetControlType;
// @property (nonatomic, getter = isMultiline) BOOL multiline;

- (BOOL)isPasswordField {
    // TODO: implement.
    return NO;
}

// @property (nonatomic, getter = hasComb) BOOL comb;
// @property (nonatomic) NSInteger maximumLength;

// @property (nonatomic, copy, nullable) NSString *widgetStringValue;
// @property (nonatomic, copy, nullable) NSString *widgetDefaultStringValue;

// @property (nonatomic) BOOL allowsToggleToOff;
// @property (nonatomic) BOOL radiosInUnison;

// @property (nonatomic, getter = isReadOnly) BOOL readOnly;
// @property (nonatomic, getter = isListChoice) BOOL listChoice;

// @property (nonatomic, copy, nullable) NSArray<NSString *> *choices;
// @property (nonatomic, copy, nullable) NSArray<NSString *> *values;

// @property (nonatomic) PDFXWidgetCellState buttonWidgetState;
// @property (nonatomic, copy) NSString *buttonWidgetStateString;

// @property (nonatomic, getter = isOpen) BOOL open;

- (NSArray<PDFXBezierPath *> *)paths {
    // TODO: implement.
    return @[];
}

- (void)addBezierPath:(PDFXBezierPath *)path {
    // TODO: implement.
}

- (void)removeBezierPath:(PDFXBezierPath *)path {
    // TODO: implement.
}

// @property (nonatomic, strong, nullable) PDFXDestination *destination;
// @property (nonatomic, copy, nullable) NSURL *URL;

// @property (nonatomic, copy, nullable) NSString *fieldName;
// @property (nonatomic, copy, nullable) NSString *caption;

// @property (nonatomic, copy, nullable) PDFXColor *backgroundColor;

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    // TODO: implement.
    return  [self.class new];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    // TODO: implement.
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    // TODO: implement.
    return nil;
}

@end
