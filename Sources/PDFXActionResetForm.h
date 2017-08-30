//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

#import <PDFXKit/PDFXPlatform.h>
#import <PDFXKit/PDFXAction.h>

NS_ASSUME_NONNULL_BEGIN

@interface PDFXActionResetForm : PDFXAction <NSCopying>

@property (nonatomic, copy, nullable) NSArray<NSString*> *fields PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;
@property (nonatomic) BOOL fieldsIncludedAreCleared PDFX_NOT_IMPLEMENTED_PRIORITY_UNKNOWN;

@end

NS_ASSUME_NONNULL_END
