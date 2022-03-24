//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXDocument+PSPDFKit.h"
#import "PDFXDocument+Swift.h"

#import "PDFXOutline+PSPDFKit.h"
#import "PDFXSelection+PSPDFKit.h"

#import "PDFXPage+Private.h"
#import "PDFXSelection+Private.h"

#import "PDFXPlatform+Private.h"
#import "PSPDFKit+PDFXKit.h"

NSNotificationName const PDFXDocumentDidUnlockNotification = @"PDFXDocumentDidUnlock";
NSNotificationName const PDFXDocumentDidBeginFindNotification = @"PDFXDidBeginDocumentFind";
NSNotificationName const PDFXDocumentDidEndFindNotification = @"PDFXDidEndDocumentFind";
NSNotificationName const PDFXDocumentDidBeginPageFindNotification = @"PDFXDidBeginPageFind";
NSNotificationName const PDFXDocumentDidEndPageFindNotification = @"PDFXDidEndPageFind";
NSNotificationName const PDFXDocumentDidFindMatchNotification = @"PDFXDidFindMatch";
NSNotificationName const PDFXDocumentDidBeginWriteNotification = @"PDFXDidBeginDocumentWrite";
NSNotificationName const PDFXDocumentDidEndWriteNotification = @"PDFXDidEndDocumentWrite";
NSNotificationName const PDFXDocumentDidBeginPageWriteNotification = @"PDFXDidBeginPageWrite";
NSNotificationName const PDFXDocumentDidEndPageWriteNotification = @"PDFXDidEndPageWrite";

PDFXDocumentAttribute PDFXDocumentAuthorAttribute = @"Author";
PDFXDocumentAttribute PDFXDocumentCreationDateAttribute = @"CreationDate";
PDFXDocumentAttribute PDFXDocumentCreatorAttribute = @"Creator";
PDFXDocumentAttribute PDFXDocumentKeywordsAttribute = @"Keywords";
PDFXDocumentAttribute PDFXDocumentModificationDateAttribute = @"ModDate";
PDFXDocumentAttribute PDFXDocumentProducerAttribute = @"Producer";
PDFXDocumentAttribute PDFXDocumentSubjectAttribute = @"Subject";
PDFXDocumentAttribute PDFXDocumentTitleAttribute = @"Title";

PDFXDocumentWriteOption PDFXDocumentOwnerPasswordOption = @"PDFDocumentOwnerPasswordOption";
PDFXDocumentWriteOption PDFXDocumentUserPasswordOption = @"PDFDocumentUserPasswordOption";

@interface PDFXDocument () <PSPDFTextSearchDelegate>

@property (nonatomic, strong) NSArray<PDFXPage *> *pages;

@end

@implementation PDFXDocument

#pragma mark - Initializing Documents

- (instancetype)init {
    let pspdfDocument = [[PSPDFDocument alloc] init];
    return [self initWithPSPDFDocument:pspdfDocument];
}

- (nullable instancetype)initWithURL:(NSURL *)url {
    let pspdfDocument = [[PSPDFDocument alloc] initWithURL:url];
    return pspdfDocument ? [self initWithPSPDFDocument:pspdfDocument] : nil;
}

- (nullable instancetype)initWithData:(NSData *)data {
    let pspdfDocument = [[PSPDFDocument alloc] initWithDataProviders:@[[[PSPDFDataContainerProvider alloc] initWithData: data]]];
    return pspdfDocument ? [self initWithPSPDFDocument:pspdfDocument] : nil;
}

#pragma mark - Accessing Document Information

- (NSURL *)documentURL {
    return self.pspdfDocument.fileURL;
}

- (NSInteger)majorVersion {
    // TODO: implement.
    return 1;
}

- (NSInteger)minorVersion {
    // TODO: implement.
    return 0;
}

- (NSString *)string {
    // TODO: this is a brute force algorithm, make it faster.
    let pspdfDocument = self.pspdfDocument;
    let pageCount = pspdfDocument.pageCount;
    let string = [NSMutableString new];

    for (NSInteger pageIndex = 0; pageIndex < pageCount; pageIndex += 1) {
        let textParser = [pspdfDocument textParserForPageAtIndex:pageIndex];
        [string appendString:textParser.text];
    }

    return [string copy];
}

- (NSDictionary *)documentAttributes {
    let metadata = [[PSPDFDocumentPDFMetadata alloc] initWithDocument:self.pspdfDocument];
    let documentAttributes = [NSMutableDictionary new];

    let keys = @[
        PDFXDocumentAuthorAttribute,
        PDFXDocumentCreationDateAttribute,
        PDFXDocumentCreatorAttribute,
        PDFXDocumentKeywordsAttribute,
        PDFXDocumentModificationDateAttribute,
        PDFXDocumentProducerAttribute,
        PDFXDocumentSubjectAttribute,
        PDFXDocumentTitleAttribute
    ];

    for (NSString *key in keys) {
        id value = metadata[key];
        if (value != nil) {
            documentAttributes[key] = value;
        }
    }

    return [documentAttributes copy];
}

- (CGPDFDocumentRef)documentRef {
    // TODO: can we generate a CGPDFDocument here?
    return nil;
}

#pragma mark -  Working with the Document Outline

@synthesize outlineRoot = _outlineRoot;

- (PDFXOutline *)outlineRoot {
    if (_outlineRoot == nil) {
        let pspdfOutlineElement = self.pspdfDocument.documentProviders.firstObject.outlineParser.outline;
        if (pspdfOutlineElement) {
            _outlineRoot = [[PDFXOutline alloc] initWithPSPDFOutlineElement:pspdfOutlineElement index:0 parent:nil document:self];
        }
    }
    return _outlineRoot;
}

- (void)setOutlineRoot:(PDFXOutline *)outlineRoot {
    // TODO: implement.
}

- (nullable PDFXOutline *)outlineItemForSelection:(PDFXSelection *)selection {
    // TODO: implement.
    return nil;
}

#pragma mark - Managing Document Security

- (BOOL)isEncrypted {
    return self.pspdfDocument.isEncrypted;
}

- (BOOL)isLocked {
    return self.pspdfDocument.isLocked;
}

- (BOOL)unlockWithPassword:(NSString *)password {
    return [self.pspdfDocument unlockWithPassword:password];
}

- (BOOL)allowsPrinting {
    return self.pspdfDocument.permissions & PSPDFDocumentPermissionsPrinting;
}

- (BOOL)allowsCopying {
    return self.pspdfDocument.permissions & PSPDFDocumentPermissionsExtract;
}

-(BOOL)allowsDocumentChanges {
    return self.pspdfDocument.permissions & PSPDFDocumentPermissionsModification;
}

-(BOOL)allowsDocumentAssembly {
    return self.pspdfDocument.permissions & PSPDFDocumentPermissionsAssemble;
}

-(BOOL)allowsContentAccessibility {
    return self.pspdfDocument.permissions & PSPDFDocumentPermissionsExtractAccessibility;
}

-(BOOL)allowsCommenting {
    // TODO: implement.
    return NO;
}

-(BOOL)allowsFormFieldEntry {
    return self.pspdfDocument.permissions & PSPDFDocumentPermissionsFillForms;
}

- (PDFXDocumentPermissions)permissionStatus {
    // TODO: implement.
    return kPDFXDocumentPermissionsNone;
}

#pragma mark - Writing Out PDF Data

- (nullable NSData *)dataRepresentation {
    return [self dataRepresentationWithOptions:@{}];
}

- (nullable NSData *)dataRepresentationWithOptions:(NSDictionary *)options {
    // TODO: implement options support.
    return self.pspdfDocument.data;
}

- (BOOL)writeToFile:(NSString *)path {
    return [self writeToFile:path withOptions:nil];
}

- (BOOL)writeToFile:(NSString *)path withOptions:(nullable NSDictionary<PDFXDocumentWriteOption, id> *)options {
    return [self writeToURL:[NSURL URLWithString:path] withOptions:options];
}

- (BOOL)writeToURL:(NSURL *)url {
    return [self writeToURL:url withOptions:nil];
}

- (BOOL)writeToURL:(NSURL *)url withOptions:(nullable NSDictionary<PDFXDocumentWriteOption, id> *)options {
    options = options ?: @{};
    let data = [self dataRepresentationWithOptions:options];
    return [data writeToURL:url atomically:YES];
}

#pragma mark - Working with Pages

- (NSUInteger)pageCount {
    return self.pages.count;
}

- (nullable PDFXPage *)pageAtIndex:(NSUInteger)index {
    return [self.pages objectAtIndex:index];
}

- (NSUInteger)indexForPage:(PDFXPage *)page {
    return [self.pages indexOfObject:page];
}

- (void)insertPage:(PDFXPage *)page atIndex:(NSUInteger)index {
    // TODO: implement.
}

- (void)removePageAtIndex:(NSUInteger)index {
    // TODO: implement.
}

- (void)exchangePageAtIndex:(NSUInteger)indexOfPageToReplace withPageAtIndex:(NSUInteger)indexOfReplacementPage {
    // TODO: implement.
}

#pragma mark - Managing Find Operations

- (NSArray<PDFXSelection *> *)findString:(NSString *)string withOptions:(NSStringCompareOptions)options {
    // TODO: implement.
    return @[];
}

- (nullable PDFXSelection *)findString:(NSString *)string fromSelection:(nullable PDFXSelection *)selection withOptions:(NSStringCompareOptions)options {
    // TODO: implement.
    return nil;
}

- (void)beginFindString:(NSString *)string withOptions:(NSStringCompareOptions)options {
    [self cancelFindString];
    self.pspdfTextSearch = [[PSPDFTextSearch alloc] initWithDocument:self.pspdfDocument];
    self.pspdfTextSearch.compareOptions = options;
    self.pspdfTextSearch.delegate = self;
    [self.pspdfTextSearch searchForString:string];
}

- (void)beginFindStrings:(NSArray<NSString *> *)strings withOptions:(NSStringCompareOptions)options {
    // TODO: implement.
}

- (BOOL)isFinding {
    return self.pspdfTextSearch != nil;
}

- (void)cancelFindString {
    [self.pspdfTextSearch cancelAllOperationsAndWait];
    self.pspdfTextSearch.delegate = nil;
    self.pspdfTextSearch = nil;
}

#pragma mark - Working with Selections

- (nullable PDFXSelection *)selectionFromPage:(PDFXPage *)startPage atCharacterIndex:(NSUInteger)startCharacter toPage:(PDFXPage *)endPage atCharacterIndex:(NSUInteger)endCharacter {
    // TODO: implement.
    return nil;
}

- (nullable PDFXSelection *)selectionFromPage:(PDFXPage *)startPage atPoint:(PDFXPoint)startPoint toPage:(PDFXPage *)endPage atPoint:(PDFXPoint)endPoint {
    // TODO: implement.
    return nil;
}

// @property (nonatomic, readonly, nullable) PDFXSelection *selectionForEntireDocument;

#pragma mark - Determining the Page Class

- (Class)pageClass {
    return PDFXPage.class;
}

#pragma mark - Debugging

- (NSString *)description {
    let components = @[super.description, @"->", self.pspdfDocument.description];
    return [components componentsJoinedByString:@" "];
}

#pragma mark - NSCopying

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return [[self.class alloc] initWithPSPDFDocument:self.pspdfDocument.copy];
}

#pragma mark - PSPDFTextSearchDelegate

- (void)willStartSearch:(PSPDFTextSearch *)textSearch term:(NSString *)searchTerm isFullSearch:(BOOL)isFullSearch {

}

- (void)didUpdateSearch:(PSPDFTextSearch *)textSearch term:(NSString *)searchTerm newSearchResults:(NSArray<PSPDFSearchResult *> *)searchResults pageIndex:(NSUInteger)pageIndex {
    for (PSPDFSearchResult *searchResult in searchResults) {
        let selection = [[PDFXSelection alloc] initWithDocument:self PSPDFSearchResult:searchResult];
        [self.delegate didMatchString:selection];
    }
}

- (void)didFailSearch:(PSPDFTextSearch *)textSearch withError:(NSError *)error {
    [self cancelFindString];
}

- (void)didFinishSearch:(PSPDFTextSearch *)textSearch term:(NSString *)searchTerm searchResults:(NSArray<PSPDFSearchResult *> *)searchResults isFullSearch:(BOOL)isFullSearch pageTextFound:(BOOL)pageTextFound {

}

- (void)didCancelSearch:(PSPDFTextSearch *)textSearch term:(NSString *)searchTerm isFullSearch:(BOOL)isFullSearch {
    // Nothing to do.
}

#pragma mark - PSPDFKit

- (instancetype)initWithPSPDFDocument:(PSPDFDocument *)pspdfDocument {
    if ((self = [super init])) {
        _pspdfDocument = pspdfDocument;

        // OPTIMIZE: this is a quick & dirty brute force implementation
        // allocating a `PDFXPage` instance for each page at creation time.
        // This can be made more efficient by only allocating & caching the
        // pages currently needed or in use.
        _pages = [self makeAllPagesForPSPDFDocument:pspdfDocument];
    }
    return self;
}

// @private instantiates a PDFXPage for each page of the document.
- (NSArray *)makeAllPagesForPSPDFDocument:(PSPDFDocument *)pspdfDocument {
    let pageCount = pspdfDocument.pageCount;
    let pages = [NSMutableArray array];

    for (NSUInteger pageIndex = 0; pageIndex < pageCount; pageIndex += 1) {
        let page = [PDFXPage new];
        page.index = pageIndex;
        page.document = self;
        [pages addObject:page];
    }

    return pages;
}

#pragma mark - Swift

- (NSInteger)__swiftPageCount {
    return PDFXSwiftIndexFromObjCIndex(self.pageCount);
}

- (nullable PDFXPage *)__swiftPageAtIndex:(NSInteger)index {
    let indexObjC = PDFXObjCIndexFromSwiftIndex(index);
    return [self pageAtIndex:indexObjC];
}

- (NSInteger)__swiftIndexForPage:(PDFXPage *)page {
    return PDFXSwiftIndexFromObjCIndex([self indexForPage:page]);
}

- (void)__swiftInsertPage:(PDFXPage *)page atIndex:(NSInteger)index {
    let indexObjC = PDFXObjCIndexFromSwiftIndex(index);
    [self insertPage:page atIndex:indexObjC];
}

- (void)__swiftRemovePageAtIndex:(NSInteger)index {
    let indexObjC = PDFXObjCIndexFromSwiftIndex(index);
    [self removePageAtIndex:indexObjC];
}

- (void)__swiftExchangePageAtIndex:(NSInteger)indexOfPageToReplace withPageAtIndex:(NSInteger)indexOfReplacementPage {
    let indexOfPageToReplaceObjC = PDFXObjCIndexFromSwiftIndex(indexOfPageToReplace);
    let indexOfReplacementPageObjC = PDFXObjCIndexFromSwiftIndex(indexOfReplacementPage);
    [self exchangePageAtIndex:indexOfPageToReplaceObjC withPageAtIndex:indexOfReplacementPageObjC];
}

- (nullable PDFXSelection *)__swiftSelectionFromPage:(PDFXPage *)startPage atCharacterIndex:(NSInteger)startCharacter toPage:(PDFXPage *)endPage atCharacterIndex:(NSUInteger)endCharacter {
    let startCharacterObjC = PDFXObjCIndexFromSwiftIndex(startCharacter);
    let endCharacterObjC = PDFXObjCIndexFromSwiftIndex(endCharacter);
    return [self selectionFromPage:startPage atCharacterIndex:startCharacterObjC toPage:endPage atCharacterIndex:endCharacterObjC];
}

@end
