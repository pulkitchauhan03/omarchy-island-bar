import QtQuick
import qs.Commons

// Island Bar's visual tokens live here so upstream Bar.qml changes do not
// scatter custom spacing, radius, and opacity values through the bar engine.
QtObject {
  property color baseColor: Color.bar.background

  readonly property int edgeMargin: Style.space(10)
  readonly property int topMargin: Style.space(5)
  readonly property int radius: Style.space(6)
  readonly property color background: Qt.rgba(baseColor.r, baseColor.g, baseColor.b, 0.95)
}
