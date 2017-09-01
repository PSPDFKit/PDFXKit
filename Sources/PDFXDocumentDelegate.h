//
//  Copyright (c) 2017 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import <PDFXKit/PDFXPlatform.h>

@class PDFXDocument;
@class PDFXSelection;

@protocol PDFXDocumentDelegate <NSObject>

@optional

#pragma mark - General Notifications

- (void)documentDidUnlock:(NSNotification *)notification;
- (void)documentDidBeginDocumentFind:(NSNotification *)notification;
- (void)documentDidEndDocumentFind:(NSNotification *)notification;
- (void)documentDidBeginPageFind:(NSNotification *)notification;
- (void)documentDidEndPageFind:(NSNotification *)notification;
- (void)documentDidFindMatch:(NSNotification *)notification;

#pragma mark - Search Notifications

- (void)didMatchString:(PDFXSelection *)instance;

#pragma mark - Customizing Classes

- (Class)classForPage;
- (Class)classForAnnotationType:(NSString *)annotationType;

@end
