//
//  GridDummy2.swift
//  multilineGrid
//
//  Created by Kaiman Mehmet on 03/01/2023.
//

import SwiftUI

struct GridDummy2: View {

    @State var rowData: [RowExample] = {
        var items = [RowExample]()
        items.append(RowExample(columnTitle: "Earth"))

        for index in 1...10 {
            items.append(RowExample(columnTitle: "\(index*1000)"))
        }

        return items
    }()


    var body: some View {
        VStack(spacing: 0) {
            Grid(horizontalSpacing: 0, verticalSpacing: 5) {
                GridRow {
                    let titles = ["Column Title 1", "Column Title 2", "Column Title 3", "Column Title 4"]
                    ForEach(titles, id: \.self) { title in
                        Text(title)
                            .frame(maxWidth: .infinity, maxHeight: 44, alignment: .center)
                            .font(.system(size: 20, weight: .regular))
                            .border(.gray, width: 2)
                    }
                }
            }
            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                ForEach(Array($rowData.enumerated()), id: \.offset) { index, element in
                    CustomGridRow(rowData: element)
                        .background(index % 2 == 0 ? Color("darkGray") : .black)
                }
                .border(.gray)
            }
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(.gray, lineWidth: 4)
        )
        .padding(44)
    }
}

struct GridDummy2_Previews: PreviewProvider {
    static var previews: some View {
        GridDummy2()
            .preferredColorScheme(.dark)
    }
}
