//
//
//  Created by Konstantin Bender on 09.08.17.
//  Copyright © 2017 PSPDFKit GmbH. All rights reserved.
//

import UIKit
// import PDFKit
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

        let sampleDocumentURL = Bundle.main.url(forResource: "PSPDFKit-6-QuickStart-Guide", withExtension: "pdf", subdirectory: "PDFs")!
        let sampleDocument = PDFDocument(url: sampleDocumentURL)

        pdfView.document = sampleDocument
    }

    // MARK: - Outlets

    private var pdfView = PDFView()
}
