//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXAction+PSPDFKit.h"
#import "PDFXPlatform+Private.h"
#import "PSPDFKit+PDFXKit.h"

@implementation PDFXAction

- (instancetype)init {
    if ((self = [super init])) {
        // TODO: implement.
    }
    return self;
}

// @property (nonatomic, readonly) NSString *type;

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    // TODO: implement.
    return  [self.class new];
}

@end
