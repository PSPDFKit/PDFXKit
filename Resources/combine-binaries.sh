#  combine-binaries.sh
#  Copyright (c) 2016-2017 PSPDFKit GmbH. All rights reserved.
#
#  THIS SOURCE CODE AND ANY ACCOMPANYING DOCUMENTATION ARE PROTECTED BY INTERNATIONAL COPYRIGHT LAW
#  AND MAY NOT BE RESOLD OR REDISTRIBUTED. USAGE IS BOUND TO THE PSPDFKIT LICENSE AGREEMENT.
#  UNAUTHORIZED REPRODUCTION OR DISTRIBUTION IS SUBJECT TO CIVIL AND CRIMINAL PENALTIES.
#  This notice may not be removed from this file.

function message {
  echo "[PDFXKit] combine-binaries.sh: $1"
}

framework_folder=$(dirname "$0")

if [ ! -e "$framework_folder/PDFXKit" ] && [ -e "$framework_folder/PDFXKit-armv7" ] && [ -e "$framework_folder/PDFXKit-arm64" ] && [ -e "$framework_folder/PDFXKit-iphonesimulator" ]; then
  lipo -create "$framework_folder/PDFXKit-armv7" "$framework_folder/PDFXKit-arm64" "$framework_folder/PDFXKit-iphonesimulator" -output "$framework_folder/PDFXKit"
  message "Combined framework binaries"
fi
