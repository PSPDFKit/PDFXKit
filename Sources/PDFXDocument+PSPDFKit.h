//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import "PDFXDocument.h"
#import "PSPDFKit+PDFXKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDFXDocument ()

@property (nonatomic) PSPDFDocument *pspdfDocument;
@property (nonatomic, nullable) PSPDFTextSearch *pspdfTextSearch;

- (instancetype)initWithPSPDFDocument:(PSPDFDocument *)pspdfDocument NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
