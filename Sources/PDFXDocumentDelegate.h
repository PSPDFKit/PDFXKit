//
//
//  Created by Konstantin Bender on 12.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
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
