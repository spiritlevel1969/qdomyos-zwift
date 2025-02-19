import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.12
import QtQuick.Dialogs 1.0
import QtGraphicalEffects 1.12
import Qt.labs.settings 1.0
import QtMultimedia 5.15
import QtQuick.Layouts 1.3
import QtWebView 1.1

Item {
    anchors.fill: parent
    height: parent.height
    width: parent.width
    visible: true

    WebView {
        anchors.fill: parent
        height: parent.height
        width: parent.width
        visible: !rootItem.pelotonPopupVisible
        url: rootItem.getPelotonAuthUrl
    }

    Popup {
        id: popupPelotonConnectedWeb
        parent: Overlay.overlay
        enabled: rootItem.pelotonPopupVisible
        onEnabledChanged: { if(rootItem.pelotonPopupVisible) popupPelotonConnectedWeb.open() }
        onClosed: { rootItem.pelotonPopupVisible = false; }

        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        width: 380
        height: 120
        modal: true
        focus: true
        palette.text: "white"
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        enter: Transition
        {
            NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
        }
        exit: Transition
        {
            NumberAnimation { property: "opacity"; from: 1.0; to: 0.0 }
        }
        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 370
                height: 120
                text: qsTr("Your Peloton account is now connected!<br><br>Restart the app to apply this!")
            }
        }
    }
}
