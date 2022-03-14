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

@class PDFXView;
@class PDFXActionRemoteGoTo;

@protocol PDFXViewDelegate <NSObject>

@optional

- (void)PDFXViewOpenPDF:(PDFXView *)sender forRemoteGoToAction:(PDFXActionRemoteGoTo *)action;
- (void)PDFXViewPerformFind:(PDFXView *)sender;
- (void)PDFXViewPerformGoToPage:(PDFXView *)sender;
- (void)PDFXViewWillClickOnLink:(PDFXView *)sender withURL:(NSURL *)url;

@end
