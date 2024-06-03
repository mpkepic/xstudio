// SPDX-License-Identifier: Apache-2.0
import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5

import xStudio 1.0

Rectangle {

    id: timeline_panel_header
    color: "transparent"
    property bool expanded: true
    anchors.fill: parent

    Label {
        anchors.leftMargin: 7
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        text: "Timeline"
        color: XsStyle.controlColor
        font.pixelSize: XsStyle.sessionBarFontSize
        font.family: XsStyle.controlTitleFontFamily
        font.hintingPreference: Font.PreferNoHinting
        font.weight: Font.DemiBold
        verticalAlignment: Qt.AlignVCenter
    }

    Label {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: app_window.currentSource.fullName
        color: XsStyle.controlColor
        font.pixelSize: XsStyle.sessionBarFontSize
        font.family: XsStyle.controlTitleFontFamily
        font.hintingPreference: Font.PreferNoHinting
        font.weight: Font.DemiBold
        verticalAlignment: Qt.AlignVCenter
    }

    Label {
        anchors.rightMargin: 7
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        text: app_window.currentSource.mediaCount != undefined  ? app_window.currentSource.mediaCount : 0
        color: XsStyle.controlColor
        font.pixelSize: XsStyle.sessionBarFontSize
        font.family: XsStyle.controlTitleFontFamily
        font.hintingPreference: Font.PreferNoHinting
        font.weight: Font.DemiBold
        verticalAlignment: Qt.AlignVCenter
    }

}
