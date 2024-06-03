// SPDX-License-Identifier: Apache-2.0
import QtQuick.Dialogs 6.5

import QuickFuture 1.0
import QuickPromise 1.0

import xStudio 1.0

FileDialog {
    title: "Open Session"
    currentFolder: app_window.sessionFunction.defaultSessionFolder() || shortcuts.home
    defaultSuffix: "xst"

    nameFilters:  ["xStudio (*.xst *.xsz)"]
    fileMode: FileDialog.OpenFile
    onAccepted: {
        Future.promise(studio.loadSessionFuture(fileUrl)).then(
            function(result){
                // console.log(result)
            }
        )
        var path = fileUrl
        app_window.sessionFunction.newRecentPath(path)
        app_window.sessionFunction.defaultSessionFolder(path.slice(0, path.lastIndexOf("/") + 1))
    }
    onRejected: {
    }
}
