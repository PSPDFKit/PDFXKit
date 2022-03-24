//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#if FRAMEWORK_BUILD
#import <PDFXKit/PDFXPlatform.h>
#import <PDFXKit/PDFXDocumentDelegate.h>
#else
#import "PDFXPlatform.h"
#import "PDFXDocumentDelegate.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class PDFXOutline;
@class PDFXPage;

typedef NS_ENUM(NSInteger, PDFXDocumentPermissions) {
    kPDFXDocumentPermissionsNone = 0,
    kPDFXDocumentPermissionsUser = 1,
    kPDFXDocumentPermissionsOwner = 2
};

PDFX_EXTERN NSNotificationName const PDFXDocumentDidUnlockNotification;
PDFX_EXTERN NSNotificationName const PDFXDocumentDidBeginFindNotification;
PDFX_EXTERN NSNotificationName const PDFXDocumentDidEndFindNotification;
PDFX_EXTERN NSNotificationName const PDFXDocumentDidBeginPageFindNotification;
PDFX_EXTERN NSNotificationName const PDFXDocumentDidEndPageFindNotification;
PDFX_EXTERN NSNotificationName const PDFXDocumentDidFindMatchNotification;
PDFX_EXTERN NSNotificationName const PDFXDocumentDidBeginWriteNotification;
PDFX_EXTERN NSNotificationName const PDFXDocumentDidEndWriteNotification;
PDFX_EXTERN NSNotificationName const PDFXDocumentDidBeginPageWriteNotification;
PDFX_EXTERN NSNotificationName const PDFXDocumentDidEndPageWriteNotification;

typedef NSString *const PDFXDocumentAttribute NS_STRING_ENUM;
typedef NSString *const PDFXDocumentWriteOption NS_STRING_ENUM;

PDFX_EXTERN PDFXDocumentAttribute PDFXDocumentAuthorAttribute;
PDFX_EXTERN PDFXDocumentAttribute PDFXDocumentCreationDateAttribute;
PDFX_EXTERN PDFXDocumentAttribute PDFXDocumentCreatorAttribute;
PDFX_EXTERN PDFXDocumentAttribute PDFXDocumentKeywordsAttribute;
PDFX_EXTERN PDFXDocumentAttribute PDFXDocumentModificationDateAttribute;
PDFX_EXTERN PDFXDocumentAttribute PDFXDocumentProducerAttribute;
PDFX_EXTERN PDFXDocumentAttribute PDFXDocumentSubjectAttribute;
PDFX_EXTERN PDFXDocumentAttribute PDFXDocumentTitleAttribute;

PDFX_EXTERN PDFXDocumentWriteOption PDFXDocumentOwnerPasswordOption;
PDFX_EXTERN PDFXDocumentWriteOption PDFXDocumentUserPasswordOption;

@interface PDFXDocument : NSObject <NSCopying>

/// @name Initializing Documents

- (nullable instancetype)initWithData:(NSData *)data;
- (nullable instancetype)initWithURL:(NSURL *)url;

/// @name Accessing Document Information

@property (nonatomic, readonly, nullable) NSURL *documentURL;

@property (nonatomic, readonly) NSInteger majorVersion;
@property (nonatomic, readonly) NSInteger minorVersion;

@property (nonatomic, readonly, nullable) NSString *string;
@property (nonatomic, copy, nullable) NSDictionary *documentAttributes;

@property (nonatomic, readonly, nullable) CGPDFDocumentRef documentRef;

/// @name  Working with the Document Outline

@property (nonatomic, strong, nullable) PDFXOutline *outlineRoot PDFX_PARTIALLY_IMPLEMENTED_PRIORITY_UNKNOWN("Setting the outline root is not supported yet.");
- (nullable PDFXOutline *)outlineItemForSelection:(PDFXSelection *)selection;

/// @name Managing Document Security

@property (nonatomic, readonly) BOOL isEncrypted;
@property (nonatomic, readonly) BOOL isLocked;

- (BOOL)unlockWithPassword:(NSString *)password;

@property (nonatomic, readonly) BOOL allowsPrinting;
@property (nonatomic, readonly) BOOL allowsCopying;

@property (nonatomic, readonly) BOOL allowsDocumentChanges;
@property (nonatomic, readonly) BOOL allowsDocumentAssembly;
@property (nonatomic, readonly) BOOL allowsContentAccessibility;
@property (nonatomic, readonly) BOOL allowsCommenting;
@property (nonatomic, readonly) BOOL allowsFormFieldEntry;

@property (nonatomic, readonly) PDFXDocumentPermissions permissionStatus;

/// @name Writing Out PDF Data

- (nullable NSData *)dataRepresentation;
- (nullable NSData *)dataRepresentationWithOptions:(NSDictionary *)options;

- (BOOL)writeToFile:(NSString *)path;
- (BOOL)writeToFile:(NSString *)path withOptions:(nullable NSDictionary<PDFXDocumentWriteOption, id> *)options;
- (BOOL)writeToURL:(NSURL *)url;
- (BOOL)writeToURL:(NSURL *)url withOptions:(nullable NSDictionary<PDFXDocumentWriteOption, id> *)options;

/// @name Working with Pages

@property (nonatomic, readonly) NSUInteger pageCount PDFX_OBJC_ONLY;

- (nullable PDFXPage *)pageAtIndex:(NSUInteger)index PDFX_OBJC_ONLY;
- (NSUInteger)indexForPage:(PDFXPage *)page PDFX_OBJC_ONLY;

- (void)insertPage:(PDFXPage *)page atIndex:(NSUInteger)index PDFX_OBJC_ONLY;
- (void)removePageAtIndex:(NSUInteger)index PDFX_OBJC_ONLY;
- (void)exchangePageAtIndex:(NSUInteger)indexOfPageToReplace withPageAtIndex:(NSUInteger)indexOfReplacementPage PDFX_OBJC_ONLY;

/// @name Managing Find Operations

- (NSArray<PDFXSelection *> *)findString:(NSString *)string withOptions:(NSStringCompareOptions)options;
- (nullable PDFXSelection *)findString:(NSString *)string fromSelection:(nullable PDFXSelection *)selection withOptions:(NSStringCompareOptions)options;

- (void)beginFindString:(NSString *)string withOptions:(NSStringCompareOptions)options NS_SWIFT_NAME(beginFindString(_:withOptions:));
- (void)beginFindStrings:(NSArray<NSString *> *)strings withOptions:(NSStringCompareOptions)options NS_SWIFT_NAME(beginFindString(_:withOptions:));

@property (nonatomic, readonly) BOOL isFinding;
- (void)cancelFindString;

/// @name Working with Selections

- (nullable PDFXSelection *)selectionFromPage:(PDFXPage *)startPage atCharacterIndex:(NSUInteger)startCharacter toPage:(PDFXPage *)endPage atCharacterIndex:(NSUInteger)endCharacter PDFX_OBJC_ONLY;
- (nullable PDFXSelection *)selectionFromPage:(PDFXPage *)startPage atPoint:(PDFXPoint)startPoint toPage:(PDFXPage *)endPage atPoint:(PDFXPoint)endPoint;
@property (nonatomic, readonly, nullable) PDFXSelection *selectionForEntireDocument;

/// @name Setting the Delegate

@property (nonatomic, weak, nullable) id<PDFXDocumentDelegate> delegate;

/// @name Determining the Page Class

@property (nonatomic, readonly) Class pageClass;

@end

NS_ASSUME_NONNULL_END
