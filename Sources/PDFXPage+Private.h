//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import "PDFXPage.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDFXPage ()

// This property is only allowed to be set by the document.
@property (nonatomic, readwrite, weak, nullable) PDFXDocument *document;
@property (nonatomic) NSUInteger index;

@end

NS_ASSUME_NONNULL_END
