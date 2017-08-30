//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import <PDFXKit/PDFXPlatform.h>
#import <PDFXKit/PDFXAction.h>

NS_ASSUME_NONNULL_BEGIN

@interface PDFXActionRemoteGoTo : PDFXAction <NSCopying>

- (instancetype)initWithPageIndex:(NSUInteger)pageIndex atPoint:(PDFXPoint)point fileURL:(NSURL *)url PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic) NSUInteger pageIndex PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic) PDFXPoint point PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic, copy) NSURL *URL PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@end

NS_ASSUME_NONNULL_END
