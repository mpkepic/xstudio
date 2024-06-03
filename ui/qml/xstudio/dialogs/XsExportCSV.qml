// SPDX-License-Identifier: Apache-2.0
import QtQuick.Dialogs 6.5
import QtQuick 2.14

import xStudio 1.0

//  QML url is stupid..

FileDialog {
    title: "Export CSV"
    currentFolder: app_window.sessionFunction.defaultSessionFolder() || shortcuts.home
    defaultSuffix: "csv"

    signal saved(variant path)
    signal cancelled

    nameFilters:  ["CSV (*.csv)"]
    fileMode: FileDialog.SaveFile

    onAccepted: {
        // check for extension.
        var path = fileUrl.toString()
        var ext = path.split('.').pop()
        if(path == ext) {
            path = path + ".csv"
        }
        saved(Qt.resolvedUrl(path))
    }

    onRejected: {
        cancelled()
    }
}

