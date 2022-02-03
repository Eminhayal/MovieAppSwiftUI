//
//  TableView.swift
//  MyMovie
//
//  Created by Emin Hayal on 4.02.2022.
//

import SwiftUI

struct TableView: View {
    @Binding var data: Search
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text(data.title).font(.subheadline)
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(data: Search)
    }
}


