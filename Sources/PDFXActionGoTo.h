//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import <PDFXKit/PDFXPlatform.h>
#import <PDFXKit/PDFXAction.h>

NS_ASSUME_NONNULL_BEGIN

@class PDFXDestination;

@interface PDFXActionGoTo : PDFXAction <NSCopying>

- (instancetype)initWithDestination:(PDFXDestination *)destination PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@property (nonatomic, strong) PDFXDestination *destination PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@end

NS_ASSUME_NONNULL_END
