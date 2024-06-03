// SPDX-License-Identifier: Apache-2.0
import QtQuick.Dialogs 6.5

import QuickFuture 1.0
import QuickPromise 1.0

import xStudio 1.0

FileDialog {
    title: "Import session"
    currentFolder: app_window.sessionFunction.defaultSessionFolder() || shortcuts.home
    defaultSuffix: "xst"

    nameFilters:  ["xStudio (*.xst *.xsz)"]
    fileMode: FileDialog.OpenFile
    onAccepted: {
        Future.promise(app_window.sessionModel.importFuture(fileUrl, null)).then(function(result){})
        app_window.sessionFunction.newRecentPath(fileUrl)
    }
    onRejected: {
    }
}
