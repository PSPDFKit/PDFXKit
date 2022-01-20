//
//  Copyright (c) 2017-2020 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

import Foundation

#if SWIFT_PACKAGE
import PDFXKitObjC
#endif

// MARK: - Classes

public typealias PDFAction = PDFXAction
public typealias PDFActionGoTo = PDFXActionGoTo
public typealias PDFActionNamed = PDFXActionNamed
public typealias PDFActionResetForm = PDFXActionResetForm
public typealias PDFActionRemoteGoTo = PDFXActionRemoteGoTo
public typealias PDFActionURL = PDFXActionURL
public typealias PDFAnnotation = PDFXAnnotation
public typealias PDFAnnotationPopup = PDFXAnnotationPopup
public typealias PDFAppearanceCharacteristics = PDFXAppearanceCharacteristics
public typealias PDFBorder = PDFXBorder
public typealias PDFDestination = PDFXDestination
public typealias PDFDocument = PDFXDocument
public typealias PDFOutline = PDFXOutline
public typealias PDFPage = PDFXPage
public typealias PDFSelection = PDFXSelection
public typealias PDFThumbnailView = PDFXThumbnailView
public typealias PDFView = PDFXView

// MARK: - Protocols

public typealias PDFDocumentDelegate = PDFXDocumentDelegate
public typealias PDFViewDelegate = PDFXViewDelegate

// MARK: - Notifications

// Aliasing notification names produces name conflicts with PDFKit if both are
// imported within a project, even if you don't import both within a single
// Swift file. Might be a Swift bug?

//public extension Notification.Name {
//    static let PDFDocumentDidUnlock = Notification.Name.PDFXDocumentDidUnlock
//    static let PDFDocumentDidBeginFind = Notification.Name.PDFXDocumentDidBeginFind
//    static let PDFDocumentDidEndFind = Notification.Name.PDFXDocumentDidEndFind
//    static let PDFDocumentDidBeginPageFind = Notification.Name.PDFXDocumentDidBeginPageFind
//    static let PDFDocumentDidEndPageFind = Notification.Name.PDFXDocumentDidEndPageFind
//    static let PDFDocumentDidFindMatch = Notification.Name.PDFXDocumentDidFindMatch
//    static let PDFDocumentDidBeginWrite = Notification.Name.PDFXDocumentDidBeginWrite
//    static let PDFDocumentDidEndWrite = Notification.Name.PDFXDocumentDidEndWrite
//    static let PDFDocumentDidBeginPageWrite = Notification.Name.PDFXDocumentDidBeginPageWrite
//    static let PDFDocumentDidEndPageWrite = Notification.Name.PDFXDocumentDidEndPageWrite
//}
//
//public extension Notification.Name {
//    static let PDFThumbnailViewDocumentEdited = Notification.Name.PDFXThumbnailViewDocumentEdited
//}
//
//public extension Notification.Name {
//    static let PDFViewDocumentChanged = Notification.Name.PDFXViewDocumentChanged
//    static let PDFViewChangedHistory = Notification.Name.PDFXViewChangedHistory
//    static let PDFViewPageChanged = Notification.Name.PDFXViewPageChanged
//    static let PDFViewScaleChanged = Notification.Name.PDFXViewScaleChanged
//    static let PDFViewAnnotationHit = Notification.Name.PDFXViewAnnotationHit
//    static let PDFViewCopyPermission = Notification.Name.PDFXViewCopyPermission
//    static let PDFViewPrintPermission = Notification.Name.PDFXViewPrintPermission
//    static let PDFViewAnnotationWillHit = Notification.Name.PDFXViewAnnotationWillHit
//    static let PDFViewSelectionChanged = Notification.Name.PDFXViewSelectionChanged
//    static let PDFViewDisplayModeChanged = Notification.Name.PDFXViewDisplayModeChanged
//    static let PDFViewDisplayBoxChanged = Notification.Name.PDFXViewDisplayBoxChanged
//    static let PDFViewVisiblePagesChanged = Notification.Name.PDFXViewVisiblePagesChanged
//}

// MARK: - Other

let kPDFDestinationUnspecifiedValue = kPDFXDestinationUnspecifiedValue;
