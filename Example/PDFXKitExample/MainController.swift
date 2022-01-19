//
//  Copyright (c) 2017-2022 PSPDFKit GmbH. All rights reserved.
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
        NSLayoutConstraint.activate([
                    pdfView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    pdfView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    pdfView.topAnchor.constraint(equalTo: view.topAnchor),
                    pdfView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                ])

        let sampleDocumentURL = Bundle.main.url(forResource: "PSPDFKit 10 QuickStart Guide", withExtension: "pdf", subdirectory: "PDFs")!
        let sampleDocument = PDFDocument(url: sampleDocumentURL)
        pdfView.document = sampleDocument
    }

    // MARK: - Outlets

    private var pdfView = PDFView()
}
