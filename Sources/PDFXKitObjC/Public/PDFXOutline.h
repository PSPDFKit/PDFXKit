//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#if FRAMEWORK_BUILD
#import <PDFXKit/PDFXPlatform.h>
#else
#import "PDFXPlatform.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@class PDFXAction;
@class PDFXDestination;
@class PDFXDocument;

@interface PDFXOutline : NSObject

/// @name Initializing an Outline

- (instancetype)init PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Getting Information About an Outline

@property (nonatomic, readonly, weak, nullable) PDFXDocument *document;
@property (nonatomic, readonly, nullable) PDFXOutline *parent;

@property (nonatomic, readonly) NSUInteger numberOfChildren;
- (PDFXOutline *)childAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSUInteger index;

/// @name Managing Outline Labels

@property (nonatomic, copy, nullable) NSString *label PDFX_PARTIALLY_IMPLEMENTED_PRIORITY_UNKNOWN("Setting the label isn't supported yet.");

/// @name Managing Actions and Destinations

@property (nonatomic, strong, nullable) PDFXDestination *destination PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, strong, nullable) PDFXAction *action PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Changing an Outline Hierarchy

- (void)removeFromParent PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
- (void)insertChild:(PDFXOutline *)child atIndex:(NSUInteger)index PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

/// @name Managing the Disclosure of an Outline Object

@property (nonatomic) BOOL isOpen;

@end

NS_ASSUME_NONNULL_END
