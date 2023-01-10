//
//  ContentView.swift
//  multilineGrid
//
//  Created by Kaiman Mehmet on 03/01/2023.
//

import SwiftUI

struct GridDummy1: View {

    @State var rowData: [RowExample] = {
        var items = [RowExample]()
        items.append(RowExample(columnTitle: "Earth"))

        for index in 1...10 {
            items.append(RowExample(columnTitle: "\(index*1000)"))
        }

        return items
    }()

    var body: some View {
        VStack {
            Grid(horizontalSpacing: 5, verticalSpacing: 5) {
                GridRow {
                    let titles = ["Column Title 1", "Column Title 2", "Column Title 3", "Column Title 4"]
                    ForEach(titles, id: \.self) { title in
                        Text(title)
                            .frame(maxWidth: .infinity, maxHeight: 44, alignment: .leading)
                            .font(.system(size: 20, weight: .regular))
                    }
                }
            }

            Grid(horizontalSpacing: 5, verticalSpacing: 5) {
                ForEach($rowData) { datum in
                        CustomGridRow(rowData: datum)
                            .background(Color("darkGray"))
                        if datum.columnText2.wrappedValue == "1" {
                            Line()
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                .frame(height: 2)
                                .foregroundColor(.white)
                        }
                }
            }
            .cornerRadius(5)


            Text(rowData[0].columnText)
        }
        .padding(44)

    }
}

struct GridDummy1_Previews: PreviewProvider {
    static var previews: some View {
        GridDummy1()
            .preferredColorScheme(.dark)
    }
}
