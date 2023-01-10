import SwiftUI

struct RowExample: Identifiable {
    let id = UUID()
    var columnTitle: String
    var columnText: String = ""
    var columnText2: String = ""
    var computed: String {
        return columnText + " " + columnText2
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct CustomGridRow: View {
    @Binding var rowData: RowExample
    var body: some View {
        GridRow {
            Text(rowData.columnTitle)
                .frame(maxWidth: .infinity, maxHeight: 44)
                .font(.system(size: 20, weight: .bold))
            TextField("", text: $rowData.columnText)
                .frame(height: 44)
            TextField("", text: $rowData.columnText2)
                .frame(height: 44)
            Text(rowData.computed)
                .frame(maxWidth: .infinity, maxHeight: 44)
                .font(.system(size: 20, weight: .bold))
        }
        .frame(height: 44)
    }
}
