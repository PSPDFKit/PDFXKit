//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import <PDFXKit/PDFXPlatform.h>

@class PDFXView;
@class PDFXActionRemoteGoTo;

@protocol PDFXViewDelegate <NSObject>

@optional

- (void)PDFXViewOpenPDF:(PDFXView *)sender forRemoteGoToAction:(PDFXActionRemoteGoTo *)action;
- (void)PDFXViewPerformFind:(PDFXView *)sender;
- (void)PDFXViewPerformGoToPage:(PDFXView *)sender;
- (void)PDFXViewWillClickOnLink:(PDFXView *)sender withURL:(NSURL *)url;

@end
