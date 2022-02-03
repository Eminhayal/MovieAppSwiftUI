//
//  ContentView.swift
//  MyMovie
//
//  Created by Emin Hayal on 2.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State var textSearch : String = ""
    @ObservedObject var viewModel = ContentVM()

    var body: some View {
        ZStack{
            VStack (spacing: 20 ){
                HStack{
                    TextField("Search Movie", text: $textSearch).padding()
                    Button("Tıkla", action: {
                        viewModel.getMovies(id: textSearch)
                    })
                        .padding()
                        .frame(width: 100)
                        .background(Color.red)
                }.frame(height: 50)
                ForEach(0 ..< $viewModel.movies.count, id: \.self) { index in
                    Cell(data: $viewModel.movies[index])
                }
                List(0 ..< $viewModel.movies.count ){ item in
                    VStack(alignment: .leading, spacing: 20){
                        Text(viewModel.movies[item].title).font(.subheadline)
                    }
                    
                }
            }
        };
    }
}

struct Cell: View {
    @Binding var data: Search
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text(data.title).font(.subheadline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
