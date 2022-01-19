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

    // MARK: - Outlets

    private var pdfView = PDFView()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        pdfView.displayDirection = .vertical
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)

        NSLayoutConstraint.activate([
            pdfView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pdfView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pdfView.topAnchor.constraint(equalTo: view.topAnchor),
            pdfView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        let sampleDocumentURL = Bundle.main.url(forResource: "PSPDFKit 10 QuickStart Guide", withExtension: "pdf")!
        let sampleDocument = PDFDocument(url: sampleDocumentURL)
        pdfView.document = sampleDocument

        let thumbnailView = PDFThumbnailView(frame: .zero)
        thumbnailView.layoutMode = .horizontal
        thumbnailView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(thumbnailView)
        NSLayoutConstraint.activate([
            thumbnailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            thumbnailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            thumbnailView.heightAnchor.constraint(equalToConstant: 100),
            thumbnailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        thumbnailView.pdfView = pdfView
    }
}
