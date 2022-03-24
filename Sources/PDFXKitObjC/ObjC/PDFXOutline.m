//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

#import "PDFXOutline+PSPDFKit.h"
#import "PDFXDocument+PSPDFKit.h"
#import "PDFXDestination+PSPDFKit.h"

#import "PDFXPlatform+Private.h"
#import "PSPDFKit+PDFXKit.h"

@interface PDFXOutline ()

@property (nonatomic, strong, readwrite) NSArray<PDFXOutline *> *children;

@end

@implementation PDFXOutline

- (instancetype)init {
    if ((self = [super init])) {
        // TODO: implement.
    }
    return self;
}

#pragma mark - Getting Information About an Outline

- (NSUInteger)numberOfChildren {
    return self.children.count;
}

- (PDFXOutline *)childAtIndex:(NSUInteger)index {
    return [self.children objectAtIndex:index];
}

#pragma mark - Managing Outline Labels

- (NSString *)label {
    return self.pspdfOutlineElement.title;
}

- (void)setLabel:(NSString *)label {
    // TODO: implement.
}

#pragma mark - Managing Actions and Destinations

- (PDFXDestination *)destination {
    // TODO: can we get the exact point and zoom for the destination here?
    let pageIndex = self.pspdfOutlineElement.pageIndex;
    let page = [self.document pageAtIndex:pageIndex];
    return [[PDFXDestination alloc] initWithPage:page atPoint:CGPointMake(kPDFXDestinationUnspecifiedValue, kPDFXDestinationUnspecifiedValue)];
}

// @property (nonatomic, strong, nullable) PDFXAction *action;

#pragma mark - Changing an Outline Hierarchy

- (void)removeFromParent {
    // TODO: implement.
}

- (void)insertChild:(PDFXOutline *)child atIndex:(NSUInteger)index {
    // TODO: implement.
}

#pragma mark - Managing the Disclosure of an Outline Object

- (BOOL)isOpen {
    return self.pspdfOutlineElement.expanded;
}

- (void)setIsOpen:(BOOL)isOpen {
    self.pspdfOutlineElement.expanded = isOpen;
}

#pragma mark - PSPDFKit

- (instancetype)initWithPSPDFOutlineElement:(PSPDFOutlineElement *)pspdfOutlineElement index:(NSUInteger)index parent:(nullable PDFXOutline *)parent document:(PDFXDocument *)document {
    if ((self = [super init])) {
        _index = index;
        _parent = parent;
        _document = document;
        _pspdfOutlineElement = pspdfOutlineElement;

        // OPTIMIZE: this is a quick & dirty brute force implementation
        // allocating a `PDFXOutline` instance for each outline object in the
        // outline hierarchy at creation time. This can be made more efficient
        // by only allocating & caching the outline objects currently needed or
        // in use.
        let children = [NSMutableArray<PDFXOutline *> new];
        [pspdfOutlineElement.children enumerateObjectsUsingBlock:^(PSPDFOutlineElement *pspdfChild, NSUInteger index, BOOL *stop) {
            let child = [[PDFXOutline alloc] initWithPSPDFOutlineElement:pspdfChild index:index parent:self document:document];
            [children addObject:child];
        }];

        self.children = children;
    }
    return self;
}

@end
