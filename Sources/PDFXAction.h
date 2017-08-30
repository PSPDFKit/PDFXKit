//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import <PDFXKit/PDFXPlatform.h>

NS_ASSUME_NONNULL_BEGIN

@interface PDFXAction : NSObject <NSCopying>

@property (nonatomic, readonly) NSString *type PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@end

NS_ASSUME_NONNULL_END
