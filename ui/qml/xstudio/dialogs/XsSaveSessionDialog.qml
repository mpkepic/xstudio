// SPDX-License-Identifier: Apache-2.0
import QtQuick.Dialogs 6.5

import xStudio 1.0

//  QML url is stupid..

FileDialog {
    title: "Save session"
    currentFolder: app_window.sessionFunction.defaultSessionFolder() || shortcuts.home
    defaultSuffix: preferences.session_compression.value ? "xsz" : "xst"

    signal saved
    signal cancelled

    nameFilters:  ["xStudio (*.xst *.xsz)"]
    fileMode: FileDialog.SaveFile

    onAccepted: {
        // check for extension.
        var path = fileUrl.toString()
        var ext = path.split('.').pop()
        if(path == ext) {
            path = path + (preferences.session_compression.value ? ".xsz" : ".xst")
        }

        app_window.sessionFunction.newRecentPath(path)
        app_window.sessionFunction.saveSessionPath(path).then(function(result){
            if (result != "") {
                var dialog = XsUtils.openDialog("qrc:/dialogs/XsErrorMessage.qml")
                dialog.title = "Save session failed"
                dialog.text = result
                dialog.show()
                cancelled()
            } else {
                app_window.sessionFunction.newRecentPath(path)
                app_window.sessionFunction.copySessionLink(false)
                saved()
            }
        })
    }

    onRejected: {
        cancelled()
    }
}

