//
//
//  Created by Konstantin Bender on 10.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
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
