#!/bin/bash
#
# Created by Konstantin Bender on 31.08.17.
# Copyright © 2017 PSPDFKit GmbH. All rights reserved.
#
# The PSPDFKit Sample applications are licensed with a modified BSD license.
# Please see License for details. This notice may not be removed from
# this file.
#
# This script copies all frameworks contained in the `Frameworks` directory
# into Xcode's built products directory. It needs to be run before the
# "Embed Frameworks" build phase which requires those frameworks to be present.
#
# Why not copy the frameworks directly? This indirection allows us at PSPDFKit
# to work on PDFXKit while linking to the actual source PSPDFKit Xcode project.

for framework in $PROJECT_DIR/Frameworks/*.framework; do
    if [ -e $framework ]
    then
        echo "Copying $framework into built products directory"
        cp -R $framework $BUILT_PRODUCTS_DIR/
    fi
done
