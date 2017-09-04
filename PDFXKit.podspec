#
# Copyright (c) 2017 PSPDFKit GmbH. All rights reserved.
#
# The PDFXKit is licensed with a modified BSD license. Please see License for
# details. This notice may not be removed from this file.
#

Pod::Spec.new do |spec|
  spec.name = "PDFXKit"
  spec.version = "0.0.1"
  spec.summary = "Apple PDFKit source-compatible wrapper for PSPDFKit."
  spec.documentation_url = 'https://pspdfkit.com/guides/ios/current/migration-guides/migrating-from-apple-pdfkit/'

  spec.description = """
    PDFXKit is a drop-in replacement giving you the same API as PDFKit while
    using PSPDFKit under the hood — only a few tweaks required. PDFXKit gives
    you full access to the underlying PSPDFKit allowing you take take advantage
    of all PSPDFKit features, components, and tools if and when you need them.
  """

  spec.homepage = "http://github.com/PSPDFKit/PDFXKit"
  spec.license = { :type => "BSD (modified)", :file => "LICENSE.md" }

  spec.author = { "PSPDFKit GmbH" => "info@pspdfkit.com" }
  spec..social_media_url = "http://twitter.com/pspdfkit"

  spec.platform = :ios, "11.0"
  spec.ios.deployment_target = "9.0"

  spec.source = { :git => "git@github.com:PSPDFKit/PDFXKit.git", :branch => "master" }
  spec.source_files = "Sources", "Sources/**/*.{h,m,swift}"
  spec.public_header_files = "Sources/**/*.h"

  spec.requires_arc = true

  spec.frameworks = "PDFKit"
  spec.dependency "PSPDFKit"
end
