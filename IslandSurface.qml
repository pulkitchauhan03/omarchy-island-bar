import QtQuick

// A small reusable surface for one horizontal island. The default property
// lets Bar.qml place the existing module container inside without changing the
// module's layout or interaction code.
Item {
  id: root

  property color fillColor: "transparent"
  property real radius: 0
  default property alias content: contentItem.data

  Rectangle {
    anchors.fill: parent
    color: root.fillColor
    radius: root.radius
  }

  Item {
    id: contentItem
    anchors.fill: parent
  }
}
