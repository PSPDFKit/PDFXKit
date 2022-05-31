//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXView+PSPDFKit.h"
#import "PDFXDocument+PSPDFKit.h"
#import "PDFXSelection+PSPDFKit.h"
#import "PDFXDestination+PSPDFKit.h"

#import "PDFXPlatform+Private.h"
#import "PSPDFKit+PDFXKit.h"

NSNotificationName const PDFXViewDocumentChangedNotification = @"PDFXViewChangedDocument";
NSNotificationName const PDFXViewChangedHistoryNotification = @"PDFXViewChangedHistory";
NSNotificationName const PDFXViewPageChangedNotification = @"PDFXViewChangedPage";
NSNotificationName const PDFXViewScaleChangedNotification = @"PDFXViewScaleChanged";
NSNotificationName const PDFXViewAnnotationHitNotification = @"PDFXViewAnnotationHit";
NSNotificationName const PDFXViewCopyPermissionNotification = @"PDFXViewCopyPermission";
NSNotificationName const PDFXViewPrintPermissionNotification = @"PDFXViewPrintPermission";
NSNotificationName const PDFXViewAnnotationWillHitNotification = @"PDFXViewAnnotationWillHit";
NSNotificationName const PDFXViewSelectionChangedNotification = @"PDFXViewSelectionChanged";
NSNotificationName const PDFXViewDisplayModeChangedNotification = @"PDFXViewDisplayModeChanged";
NSNotificationName const PDFXViewDisplayBoxChangedNotification = @"PDFXViewDisplayBoxChanged";
NSNotificationName const PDFXViewVisiblePagesChangedNotification = @"PDFXViewVisiblePagesChanged";

// HACK: this is a private PSPDFKit notification which will be made public in
// the near future.
NSNotificationName const PSPDFViewControllerDidChangePageNotification = @"PSPDFViewControllerDidChangePageNotification";

@interface PDFXView ()

@property (nonatomic) BOOL shouldApplyHackToSupportStoryboardsAndXibs;

@end

@implementation PDFXView

#pragma mark - Nib Support

- (void)awakeFromNib {
    [super awakeFromNib];
    self.shouldApplyHackToSupportStoryboardsAndXibs = YES;
}

#pragma mark - Life-Cycle

- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self PDFXViewLoad];
    }
    return self;
}

// @private common init used used for regular initialization and NSCoding.
- (void)PDFXViewLoad {
    _pspdfViewController = [self makePSPDFViewController];
    _pspdfViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    _pspdfViewController.delegate = self;
    [self addSubview:_pspdfViewController.view];

    [_pspdfViewController.view.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [_pspdfViewController.view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [_pspdfViewController.view.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [_pspdfViewController.view.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;

    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(pspdfViewControllerDidChangePageNotification:) name:PSPDFViewControllerDidChangePageNotification object:_pspdfViewController];
}

#pragma mark - Associating a Document

- (void)setDocument:(PDFXDocument *)document {
    if (document != _document) {
        _document = document;
        self.pspdfViewController.document = document.pspdfDocument;
    }
}

#pragma mark - Navigating to Pages

- (PDFXPage *)currentPage {
    if (self.pspdfViewController.document == nil) { return nil; }
    if (self.pspdfViewController.document.pageCount == 0) { return nil; }

    let pageIndex = self.pspdfViewController.pageIndex;
    return [self.document pageAtIndex:pageIndex];
}

- (void)goToPage:(PDFXPage *)page {
    let index = [self.document indexForPage:page];
    if (index != NSNotFound) [self.pspdfViewController setPageIndex:index animated:NO];
}

- (BOOL)canGoBack {
    return NO;
}

- (IBAction)goBack:(nullable id)sender {
    // TODO: implement, see PSPDFBackForwardActionList.
}

- (BOOL)canGoForward {
    // TODO: implement.
    return NO;
}

- (IBAction)goForward:(nullable id)sender {
    // TODO: implement, see PSPDFBackForwardActionList.
}

- (BOOL)canGoToNextPage {
    // TODO: implement.
    return YES;
}

- (IBAction)goToNextPage:(nullable id)sender {
    [self.pspdfViewController.documentViewController scrollToNextSpreadAnimated:YES];
}

- (BOOL)canGoToPreviousPage {
    // TODO: implement.
    return YES;
}

- (IBAction)goToPreviousPage:(nullable id)sender {
    [self.pspdfViewController.documentViewController scrollToPreviousSpreadAnimated:YES];
}

- (BOOL)canGoToFirstPage {
    // TODO: implement.
    return YES;
}

- (IBAction)goToFirstPage:(nullable id)sender {
    let pageCount = self.document.pageCount;
    if (pageCount > 0) {
        [self.pspdfViewController setPageIndex:0 animated:YES];
    }
}

- (BOOL)canGoToLastPage {
    // TODO: implement.
    return YES;
}

- (IBAction)goToLastPage:(nullable id)sender {
    let pageCount = self.document.pageCount;
    if (pageCount > 0) {
        let indexOfLastPage = pageCount - 1;
        [self.pspdfViewController setPageIndex:indexOfLastPage animated:YES];
    }
}

// @private returns the index of the current page or `NSNotFound`.
- (NSUInteger)indexOfCurrentPage {
    let pspdfViewController = self.pspdfViewController;
    if (pspdfViewController == nil) { return NSNotFound; }

    let pspdfDocument = self.pspdfViewController.document;
    if (pspdfDocument == nil) { return NSNotFound; }

    return pspdfViewController.pageIndex;
}

// @private returns `YES` if index is a valid page, otherwise returns `NO`.
- (BOOL)canGoToPageAtIndex:(NSUInteger)index {
    let currentPageIndex = self.indexOfCurrentPage;
    if (currentPageIndex == NSNotFound) { return NO; }

    let pspdfDocument = self.pspdfDocument;
    if (pspdfDocument == nil) { return NO; }

    let pageCount = pspdfDocument.pageCount;
    return index < pageCount;
}

#pragma mark - Navigating to Destinations

- (PDFXDestination *)currentDestination {
    // TODO: specify exact point and zoom for the destination.
    return [[PDFXDestination alloc] initWithPage:self.currentPage atPoint:CGPointMake(kPDFXDestinationUnspecifiedValue, kPDFXDestinationUnspecifiedValue)];
}

- (void)goToDestination:(PDFXDestination *)destination {
    // TODO: implement support for point and zoom of destionation.
    [self goToPage:destination.page];
}

#pragma mark - Navigating to Selections & Rects

- (void)goToSelection:(PDFXSelection *)selection {
    let pspdfSearchResult = selection.pspdfSearchResult;
    let searchHighlightViewManager = self.pspdfViewController.searchHighlightViewManager;
    let firstPageOfSelection = selection.pages.firstObject;

    if (pspdfSearchResult) {
        let pageIndex = pspdfSearchResult.pageIndex;
        let page = [self.document pageAtIndex:pageIndex] ?: firstPageOfSelection;
        [self goToPage:page];
        [searchHighlightViewManager clearHighlightedSearchResultsAnimated:YES];
        [searchHighlightViewManager addHighlightSearchResults:@[pspdfSearchResult] animated:YES];
    } else {
        // TODO: implement this properly, we'll just show the page for now.
        [self goToPage:firstPageOfSelection];
    }
}

- (void)goToRect:(PDFXRect)rect onPage:(PDFXPage *)page {
    let pageIndex = [self.document indexForPage:page];
    if (pageIndex != NSNotFound) {
        [self.pspdfViewController.documentViewController zoomToPDFRect:rect forPageAtIndex:pageIndex animated:YES];
    }
}

#pragma mark - Configuring Display Options

- (PDFXDisplayBox)displayBox {
    // TODO: implement.
    return 0;
}

- (void)setDisplayBox:(PDFXDisplayBox)displayBox {
    // TODO: implement.
}

- (PDFXDisplayMode)displayMode {
    let pspdfConfiguration = self.pspdfViewController.configuration;
    if (!pspdfConfiguration) { return kPDFXDisplaySinglePage; }

    let pspdfPageMode = pspdfConfiguration.pageMode;
    let pspdfPageTransition = pspdfConfiguration.pageTransition;

    PDFXDisplayMode displayMode = 0;
    [self displayMode:&displayMode fromPSPDFPageMode:pspdfPageMode andPSPDFPageTransition:pspdfPageTransition];

    return displayMode;
}

- (void)setDisplayMode:(PDFXDisplayMode)displayMode {
    let pspdfViewController = self.pspdfViewController;
    if (pspdfViewController == nil) { return; }

    PSPDFPageMode pspdfPageMode = 0;
    PSPDFPageTransition pspdfPageTransition = 0;
    [self PSPDFPageMode:&pspdfPageMode andPSPDFPageTransition:&pspdfPageTransition fromDisplayMode:displayMode];

    [pspdfViewController updateConfigurationWithBuilder:^(PSPDFConfigurationBuilder *builder) {
        builder.pageMode = pspdfPageMode;
        builder.pageTransition = pspdfPageTransition;
    }];
}

- (PDFXDisplayDirection)displayDirection {
    let pspdfViewController = self.pspdfViewController;
    if (pspdfViewController == nil) { return kPDFXDisplayDirectionVertical; }

    let pspdfScrollDirection = pspdfViewController.configuration.scrollDirection;
    return [self displayDirectionFromPSPDFScrollDirection:pspdfScrollDirection];
}

- (void)setDisplayDirection:(PDFXDisplayDirection)displayDirection {
    let pspdfViewController = self.pspdfViewController;
    if (pspdfViewController == nil) { return; }

    [pspdfViewController updateConfigurationWithBuilder:^(PSPDFConfigurationBuilder *builder) {
        builder.scrollDirection = [self PSPDFScrollDirectionFromDisplayDirection:displayDirection];
    }];
}

- (BOOL)displaysPageBreaks {
    // TODO: implement.
    return NO;
}

- (void)setDisplaysPageBreaks:(BOOL)displaysPageBreaks {
    // TODO: implement.
}

- (PDFXEdgeInsets)pageBreakMargins {
    // TODO: implement.
    return PDFXEdgeInsetsZero;
}

- (void)setPageBreakMargins:(PDFXEdgeInsets)pageBreakMargins {
    // TODO: implement.
}

- (BOOL)displaysAsBook {
    return self.pspdfViewController.configuration.firstPageAlwaysSingle;
}

- (void)setDisplaysAsBook:(BOOL)displaysAsBook {
    [self.pspdfViewController updateConfigurationWithBuilder:^(PSPDFConfigurationBuilder *builder) {
        builder.firstPageAlwaysSingle = displaysAsBook;
    }];
}

- (BOOL)displaysRTL {
    // TODO: implement.
    return NO;
}

- (void)setDisplaysRTL:(BOOL)displaysRTL {
    // TODO: implement.
}

- (PDFXInterpolationQuality)interpolationQuality {
    // TODO: implement.
    return kPDFXInterpolationQualityNone;
}

- (void)setInterpolationQuality:(PDFXInterpolationQuality)interpolationQuality {
    // TODO: implement.
}

- (PDFXColor *)backgroundColor {
    return self.pspdfViewController.configuration.backgroundColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    [self.pspdfViewController updateConfigurationWithBuilder:^(PSPDFConfigurationBuilder *builder) {
        builder.backgroundColor = backgroundColor;
    }];
}

#pragma mark - Using Page View Controller

- (void)usePageViewController:(BOOL)enable withViewOptions:(nullable NSDictionary*)viewOptions {
    _isUsingPageViewController = enable;
}

#pragma mark - Configuring Scaling

- (BOOL)autoScales {
    let spreadFitting = self.pspdfViewController.configuration.spreadFitting;
    return spreadFitting == PSPDFConfigurationSpreadFittingFill || spreadFitting == PSPDFConfigurationSpreadFittingAdaptive;
}

- (void)setAutoScales:(BOOL)autoScales {
    // TODO: check if we need to massage this a bit more.
    [self.pspdfViewController updateConfigurationWithBuilder:^(PSPDFConfigurationBuilder *builder) {
        builder.spreadFitting = autoScales ? PSPDFConfigurationSpreadFittingAdaptive : PSPDFConfigurationSpreadFittingFit;
    }];
}

- (CGFloat)scaleFactor {
    // TODO: implement.
    return 1.0;
}

- (void)setScaleFactor:(CGFloat)scaleFactor {
    // TODO: implement.
}

- (CGFloat)scaleFactorForSizeToFit {
    // TODO: implement.
    return 1.0;
}

- (CGFloat)minScaleFactor {
    // TODO: implement.
    return 1.0;
}

- (void)setMinScaleFactor:(CGFloat)minScaleFactor {
    // TODO: implement.
}

- (CGFloat)maxScaleFactor {
    // TODO: implement.
    return 1.0;
}

- (void)setMaxScaleFactor:(CGFloat)maxScaleFactor {
    // TODO: implement.
}

#pragma mark - Zooming

- (BOOL)canZoomIn {
    // TODO: implement.
    return NO;
}

- (IBAction)zoomIn:(nullable id)sender {
    // TODO: implement.
}

- (BOOL)canZoomOut {
    // TODO: implement.
    return NO;
}

- (IBAction)zoomOut:(nullable id)sender {
    // TODO: implement.
}

#pragma mark - Areas of Interest

- (PDFXAreaOfInterest)areaOfInterestForMouse:(PDFXEvent *)event {
    // TODO: implement.
    return kPDFXNoArea;
}

- (PDFXAreaOfInterest)areaOfInterestForPoint:(PDFXPoint)cursorLocation {
    // TODO: implement.
    return kPDFXNoArea;
}

#pragma mark - Performing Actions

- (void)performAction:(PDFXAction *)action {
    // TODO: implement.
}

#pragma mark - Managing Selections

- (PDFXSelection *)currentSelection {
    // TODO: implement.
    return nil;
}

- (void)setCurrentSelection:(PDFXSelection *)currentSelection {
    // TODO: implement.
}

- (void)setCurrentSelection:(nullable PDFXSelection *)selection animate:(BOOL)animate {
    // TODO: implement.
}

- (void)clearSelection {
    // TODO: implement.
}

- (IBAction)selectAll:(nullable id)sender {
    // TODO: implement.
}

- (IBAction)scrollSelectionToVisible:(nullable id)sender {
    // TODO: implement.
}

- (NSArray<PDFXSelection*> *)highlightedSelections {
    // TODO: implement.
    return @[];
}

#pragma mark - Drawing

- (void)drawPage:(PDFXPage *)page toContext:(CGContextRef)context {
    // TODO: implement.
}

- (void)drawPagePost:(PDFXPage *)page toContext:(CGContextRef)context {
    // TODO: implement.
}

#pragma mark - Copy & Paste

- (IBAction)copy:(nullable id)sender {
    // TODO: implement.
}

#pragma mark - Converting Points & Rects

- (nullable PDFXPage *)pageForPoint:(PDFXPoint)point nearest:(BOOL)nearest {
    // TODO: implement.
    return nil;
}

- (PDFXPoint)convertPoint:(PDFXPoint)point toPage:(PDFXPage *)page {
    // TODO: implement.
    return PDFXPointZero;
}

- (PDFXRect)convertRect:(PDFXRect)rect toPage:(PDFXPage *)page {
    // TODO: implement.
    return PDFXRectZero;
}

- (PDFXPoint)convertPoint:(PDFXPoint)point fromPage:(PDFXPage *)page {
    // TODO: implement.
    return PDFXPointZero;
}

- (PDFXRect)convertRect:(PDFXRect)rect fromPage:(PDFXPage *)page {
    // TODO: implement.
    return PDFXRectZero;
}

#pragma mark - Other Stuff

- (UIView *)documentView {
    // TODO: implement.
    return nil;
}

- (void)layoutDocumentView {
    // TODO: implement.
}

- (void)annotationsChangedOnPage:(PDFXPage *)page {
    // TODO: implement.
}

- (PDFXSize)rowSizeForPage:(PDFXPage *)page {
    // TODO: implement.
    return PDFXSizeZero;
}

- (NSArray<PDFXPage *> *)visiblePages {
    // TODO: implement.
    return @[];
}

#pragma mark - Bridging PSPDFKit

- (PSPDFDocument *)pspdfDocument {
    return self.pspdfViewController.document;
}

- (PSPDFViewController *)makePSPDFViewController {
    let configuration = [PSPDFConfiguration configurationWithBuilder:^(PSPDFConfigurationBuilder *builder) {
        builder.backgroundColor = UIColor.grayColor;
        builder.pageMode = PSPDFPageModeSingle;
        builder.pageTransition = PSPDFPageTransitionScrollContinuous;
        builder.scrollDirection = PSPDFScrollDirectionVertical;
        builder.userInterfaceViewMode = PSPDFUserInterfaceViewModeAutomatic;
        builder.thumbnailBarMode = PSPDFThumbnailBarModeNone;
        builder.documentLabelEnabled = NO;
        builder.pageLabelEnabled = NO;
    }];

    return [[PSPDFViewController alloc] initWithDocument:nil configuration:configuration];
}

#pragma mark - Bridging PSPDFKit | Converting Stuff

// @private determines `PSPDFPageMode` and `PSPDFPageTransition` based on display mode.
- (void)PSPDFPageMode:(PSPDFPageMode *)pspdfPageMode andPSPDFPageTransition:(PSPDFPageTransition *)pspdfPageTransition fromDisplayMode:(PDFXDisplayMode)displayMode {
    if (displayMode == kPDFXDisplaySinglePage) {
        *pspdfPageMode = PSPDFPageModeSingle;
        *pspdfPageTransition = PSPDFPageTransitionScrollPerSpread;
        return;
    }

    if (displayMode == kPDFXDisplaySinglePageContinuous) {
        *pspdfPageMode = PSPDFPageModeSingle;
        *pspdfPageTransition = PSPDFPageTransitionScrollContinuous;
        return;
    }

    if (displayMode == kPDFXDisplayTwoUp) {
        *pspdfPageMode = PSPDFPageModeDouble;
        *pspdfPageTransition = PSPDFPageTransitionScrollPerSpread;
        return;
    }

    if (displayMode == kPDFXDisplayTwoUpContinuous) {
        *pspdfPageMode = PSPDFPageModeDouble;
        *pspdfPageTransition = PSPDFPageTransitionScrollContinuous;
        return;
    }

    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"Unhandled bridging display mode %@ to PSPDF page mode and page transition.", @(displayMode)] userInfo:nil];
}

// @private determines display mode based on `PSPDFPageMode` and `PSPDFPageTransition`.
- (void)displayMode:(PDFXDisplayMode *)displayMode fromPSPDFPageMode:(PSPDFPageMode)pspdfPageMode andPSPDFPageTransition:(PSPDFPageTransition)pspdfPageTransition {
    BOOL const isSinglePlage = pspdfPageMode == PSPDFPageModeSingle || pspdfPageMode == PSPDFPageModeAutomatic;
    BOOL const isContinuous = pspdfPageTransition == PSPDFPageTransitionScrollContinuous;

    if (isSinglePlage && !isContinuous) {
        *displayMode = kPDFXDisplaySinglePage;
    }

    if (isSinglePlage && isContinuous) {
        *displayMode = kPDFXDisplaySinglePageContinuous;
    }

    if (!isSinglePlage && !isContinuous) {
        *displayMode = kPDFXDisplayTwoUp;
    }

    if (!isSinglePlage && isContinuous) {
        *displayMode = kPDFXDisplayTwoUpContinuous;
    }

    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"Unhandled briding PDFX display mode from PSPDF page mode %@ and page transition %@", @(pspdfPageMode), @(pspdfPageTransition)] userInfo:nil];
}

// @private returns display direction for `PSPDFScrollDirection`.
- (PDFXDisplayDirection)displayDirectionFromPSPDFScrollDirection:(PSPDFScrollDirection)scrollDirection {
    switch (scrollDirection) {
        case PSPDFScrollDirectionVertical: return kPDFXDisplayDirectionVertical;
        case PSPDFScrollDirectionHorizontal: return kPDFXDisplayDirectionHorizontal;
    }
}

// @private returns `PSPDFScrollDirection` for display direction.
- (PSPDFScrollDirection)PSPDFScrollDirectionFromDisplayDirection:(PDFXDisplayDirection)displayDirection {
    switch (displayDirection) {
        case kPDFXDisplayDirectionVertical: return PSPDFScrollDirectionVertical;
        case kPDFXDisplayDirectionHorizontal: return PSPDFScrollDirectionHorizontal;
    }
}

#pragma mark - Observing Notifications

- (void)pspdfViewControllerDidChangePageNotification:(NSNotification *)notification {
    [NSNotificationCenter.defaultCenter postNotificationName:PDFXViewPageChangedNotification object:self];
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder {
    if ((self = [super initWithCoder:coder])) {
        [self PDFXViewLoad];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
}

#pragma mark - PSPDFViewControllerDelegate

// Nothing here yet.

#pragma mark - Managing View Hierarchy

- (void)didMoveToWindow {
    [super didMoveToWindow];
    if (self.window != nil && self.shouldApplyHackToSupportStoryboardsAndXibs) {
        // HACK: quick and dirty hack to workaround missing viewWill/DidAppear
        // calls for PSPDFViewController when instantiated from a storyboard or
        // xib.
        //
        // TODO: patch the view controller hierarchy and hook up the
        // PSPDFViewController. So far it works without.
        [self.pspdfViewController beginAppearanceTransition:YES animated:NO];
        [self.pspdfViewController endAppearanceTransition];
        self.shouldApplyHackToSupportStoryboardsAndXibs = NO;
    }
}

@end
