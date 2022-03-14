//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#if FRAMEWORK_BUILD
#import <PDFXKit/PDFXPlatform.h>
#import <PDFXKit/PDFXViewDelegate.h>
#import <PDFXKit/PDFXDocument.h>
#import <PDFXKit/PDFXPage.h>
#else
#import "PDFXPlatform.h"
#import "PDFXViewDelegate.h"
#import "PDFXDocument.h"
#import "PDFXPage.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class PDFXDestination;
@class PDFXSelection;
@class PDFXAction;

typedef NS_ENUM(NSInteger, PDFXDisplayDirection) {
    kPDFXDisplayDirectionVertical = 0,
    kPDFXDisplayDirectionHorizontal = 1,
};

typedef NS_ENUM(NSInteger, PDFXDisplayMode) {
    kPDFXDisplaySinglePage = 0,
    kPDFXDisplaySinglePageContinuous = 1,
    kPDFXDisplayTwoUp = 2,
    kPDFXDisplayTwoUpContinuous = 3
};

typedef NS_ENUM(NSInteger, PDFXInterpolationQuality) {
    kPDFXInterpolationQualityNone = 0,
    kPDFXInterpolationQualityLow = 1,
    kPDFXInterpolationQualityHigh = 2
};

typedef NS_OPTIONS(NSInteger, PDFXAreaOfInterest) {
    kPDFXNoArea = 0,
    kPDFXPageArea = 1ul << 0,
    kPDFXTextArea = 1ul << 1,
    kPDFXAnnotationArea = 1ul << 2,
    kPDFXLinkArea = 1ul << 3,
    kPDFXControlArea = 1ul << 4,
    kPDFXTextFieldArea = 1ul << 5,
    kPDFXIconArea = 1ul << 6,
    kPDFXPopupArea = 1ul << 7,
    kPDFXImageArea = 1ul << 8
};

PDFX_EXTERN NSNotificationName const PDFXViewDocumentChangedNotification;
PDFX_EXTERN NSNotificationName const PDFXViewChangedHistoryNotification;
PDFX_EXTERN NSNotificationName const PDFXViewPageChangedNotification;
PDFX_EXTERN NSNotificationName const PDFXViewScaleChangedNotification;
PDFX_EXTERN NSNotificationName const PDFXViewAnnotationHitNotification;
PDFX_EXTERN NSNotificationName const PDFXViewCopyPermissionNotification;
PDFX_EXTERN NSNotificationName const PDFXViewPrintPermissionNotification;
PDFX_EXTERN NSNotificationName const PDFXViewAnnotationWillHitNotification;
PDFX_EXTERN NSNotificationName const PDFXViewSelectionChangedNotification;
PDFX_EXTERN NSNotificationName const PDFXViewDisplayModeChangedNotification;
PDFX_EXTERN NSNotificationName const PDFXViewDisplayBoxChangedNotification;
PDFX_EXTERN NSNotificationName const PDFXViewVisiblePagesChangedNotification;

@interface PDFXView :  PDFXPlatformView

/// @name Associating a Document

@property (nonatomic, retain, nullable) PDFXDocument *document;

/// @name Setting the Delegate

@property (nonatomic, weak, nullable) id<PDFXViewDelegate> delegate;

/// @name Navigating to Pages

@property (nonatomic, readonly, nullable) PDFXPage *currentPage PDFX_NOT_IMPLEMENTED_PRIORITY_HIGH;
- (void)goToPage:(PDFXPage *)page PDFX_NOT_IMPLEMENTED_PRIORITY_HIGH;

@property (nonatomic, readonly) BOOL canGoBack PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;
- (IBAction)goBack:(nullable id)sender PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

@property (nonatomic, readonly) BOOL canGoForward PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;
- (IBAction)goForward:(nullable id)sender PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

@property (nonatomic, readonly) BOOL canGoToNextPage PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;
- (IBAction)goToNextPage:(nullable id)sender PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

@property (nonatomic, readonly) BOOL canGoToPreviousPage PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;
- (IBAction)goToPreviousPage:(nullable id)sender PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

@property (nonatomic, readonly) BOOL canGoToFirstPage PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;
- (IBAction)goToFirstPage:(nullable id)sender PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

@property (nonatomic, readonly) BOOL canGoToLastPage PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;
- (IBAction)goToLastPage:(nullable id)sender PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

/// @name Navigating to Destinations

@property (nonatomic, readonly, nullable) PDFXDestination *currentDestination PDFX_PARTIALLY_IMPLEMENTED_PRIORITY_LOW("Only the current page is specified for the destination, point and zoom are set to kPDFXDestinationUnspecifiedValue");
- (void)goToDestination:(PDFXDestination *)destination PDFX_PARTIALLY_IMPLEMENTED_PRIORITY_LOW("The point and zoom properties ignored.");

/// @name Navigating to Selections & Rects

- (void)goToSelection:(PDFXSelection *)selection PDFX_PARTIALLY_IMPLEMENTED_PRIORITY_MEDIUM("Only selections returned by find calls are currently fully supported (otherwise this goes to the first page of the selection)");
- (void)goToRect:(PDFXRect)rect onPage:(PDFXPage *)page PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

/// @name Working with Display Modes and Characteristics

@property (nonatomic) PDFXDisplayBox displayBox PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;
@property (nonatomic) PDFXDisplayMode displayMode;
@property (nonatomic) PDFXDisplayDirection displayDirection;

@property (nonatomic) BOOL displaysPageBreaks PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;
@property (nonatomic) PDFXEdgeInsets pageBreakMargins PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;

@property (nonatomic) BOOL displaysAsBook;
@property (nonatomic) BOOL displaysRTL PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;

@property (nonatomic) PDFXInterpolationQuality interpolationQuality PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;
@property (nonatomic, strong) PDFXColor *backgroundColor;

/// @name Using Page View Controller

- (void)usePageViewController:(BOOL)enable withViewOptions:(nullable NSDictionary*)viewOptions PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;
@property (nonatomic, readonly) BOOL isUsingPageViewController PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;

/// @name Scaling the View

@property (nonatomic) BOOL autoScales PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

@property (nonatomic) CGFloat scaleFactor PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;
@property (nonatomic, readonly) CGFloat scaleFactorForSizeToFit PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

@property (nonatomic) CGFloat minScaleFactor PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;
@property (nonatomic) CGFloat maxScaleFactor PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

/// @name Zooming

@property (nonatomic, readonly) BOOL canZoomIn PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;
- (IBAction)zoomIn:(nullable id)sender PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

@property (nonatomic, readonly) BOOL canZoomOut PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;
- (IBAction)zoomOut:(nullable id)sender PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

/// @name Areas of Interest

- (PDFXAreaOfInterest)areaOfInterestForMouse:(PDFXEvent *)event PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;
- (PDFXAreaOfInterest)areaOfInterestForPoint:(PDFXPoint)cursorLocation PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;

/// @name Performing Actions

- (void)performAction:(PDFXAction *)action PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

/// @name Managing Selections

@property (nonatomic, strong, nullable) PDFXSelection *currentSelection PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;
- (void)setCurrentSelection:(nullable PDFXSelection *)selection animate:(BOOL)animate PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

- (void)clearSelection PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;
- (IBAction)selectAll:(nullable id)sender PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;
- (IBAction)scrollSelectionToVisible:(nullable id)sender PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

@property (nonatomic, copy, nullable) NSArray<PDFXSelection*> *highlightedSelections PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

/// @name Drawing

- (void)drawPage:(PDFXPage *)page toContext:(CGContextRef)context PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;
- (void)drawPagePost:(PDFXPage *)page toContext:(CGContextRef)context PDFX_NOT_IMPLEMENTED_PRIORITY_MEDIUM;

/// @name Copy & Paste

- (IBAction)copy:(nullable id)sender PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;

/// @name Conversion Methods for Subclasses

- (nullable PDFXPage *)pageForPoint:(PDFXPoint)point nearest:(BOOL)nearest PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;
- (PDFXPoint)convertPoint:(PDFXPoint)point toPage:(PDFXPage *)page PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;
- (PDFXRect)convertRect:(PDFXRect)rect toPage:(PDFXPage *)page PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;
- (PDFXPoint)convertPoint:(PDFXPoint)point fromPage:(PDFXPage *)page PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;
- (PDFXRect)convertRect:(PDFXRect)rect fromPage:(PDFXPage *)page PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;

/// @name Other Stuff

@property (nonatomic, readonly, nullable) UIView *documentView PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;
- (void)layoutDocumentView PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;

- (void)annotationsChangedOnPage:(PDFXPage *)page PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;
- (PDFXSize)rowSizeForPage:(PDFXPage *)page PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;

@property (nonatomic, readonly) NSArray<PDFXPage *> *visiblePages PDFX_NOT_IMPLEMENTED_PRIORITY_HIGH;
@property (nonatomic) BOOL enableDataDetectors PDFX_NOT_IMPLEMENTED_PRIORITY_LOW;

@end

NS_ASSUME_NONNULL_END
