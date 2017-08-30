//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import "PDFXSelection.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDFXSelection ()

/**
 Quick & dirty init method to create a simple selection for displaying search
 results. Will be revised soonish.
 */
- (instancetype)initWithDocument:(PDFXDocument *)document page:(nullable PDFXPage *)page range:(NSRange)range string:(nullable NSString *)string;

@end

NS_ASSUME_NONNULL_END
