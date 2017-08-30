#!/bin/sh

#  split-binary.sh
#  Copyright (c) 2016-2017 PSPDFKit GmbH. All rights reserved.
#
#  THIS SOURCE CODE AND ANY ACCOMPANYING DOCUMENTATION ARE PROTECTED BY INTERNATIONAL COPYRIGHT LAW
#  AND MAY NOT BE RESOLD OR REDISTRIBUTED. USAGE IS BOUND TO THE PSPDFKIT LICENSE AGREEMENT.
#  UNAUTHORIZED REPRODUCTION OR DISTRIBUTION IS SUBJECT TO CIVIL AND CRIMINAL PENALTIES.
#  This notice may not be removed from this file.

set -e

framework_folder=$(dirname "$0")
fat_binary="$framework_folder/PDFXKit"
armv7_binary="$framework_folder/PDFXKit-armv7"
arm64_binary="$framework_folder/PDFXKit-arm64"
iphonesimulator_binary="$framework_folder/PDFXKit-iphonesimulator"

if [ ! -e "$fat_binary" ]; then
  echo "No PDFXKit binary found"
  exit 1
fi

# Create iphoneos binaries
lipo -extract armv7 -output "$armv7_binary" "$fat_binary"
echo "Created armv7 binary: $armv7_binary"
lipo -extract arm64 -output "$arm64_binary" "$fat_binary"
echo "Created arm64 binary: $arm64_binary"

# Create iphonesimulator binary
lipo -remove armv7 -output "$iphonesimulator_binary" "$fat_binary"
lipo -remove arm64 -output "$iphonesimulator_binary" "$iphonesimulator_binary"
echo "Created iphonesimulator binary: $iphonesimulator_binary"

exit 0
