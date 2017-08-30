//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import "PDFXOutline.h"

NS_ASSUME_NONNULL_BEGIN

@class PSPDFOutlineElement;

@interface PDFXOutline ()

@property (nonatomic, strong) PSPDFOutlineElement *pspdfOutlineElement;

- (instancetype)initWithPSPDFOutlineElement:(PSPDFOutlineElement *)pspdfOutlineElement index:(NSUInteger)index parent:(nullable PDFXOutline *)parent document:(PDFXDocument *)document;

@end

NS_ASSUME_NONNULL_END
