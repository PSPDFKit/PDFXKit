//
//  Copyright (c) 2017-2018 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from
//  this file.
//

import UIKit
import PDFXKit

class MainController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)

        pdfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pdfView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        let sampleDocumentURL = Bundle.main.url(forResource: "PSPDFKit 7 QuickStart Guide", withExtension: "pdf", subdirectory: "PDFs")!
        let sampleDocument = PDFDocument(url: sampleDocumentURL)

        pdfView.document = sampleDocument
    }

    // MARK: - Outlets

    private var pdfView = PDFView()
}
