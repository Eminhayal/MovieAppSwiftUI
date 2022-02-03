//
//  ContentVM.swift
//  MyMovie
//
//  Created by Emin Hayal on 3.02.2022.
//

import Foundation
import SwiftUI


class ContentVM : ObservableObject {
    
    @Published var movies: [Search] = []
    private var network = Network()
    
    func getMovies(id: String) {
        network.getDownloadMovie(search: id, completion: { [weak self] (response, error) in
            guard let self = self else { return }
            
            if let movie = response {
                self.movies = movie.search // data viewModel'da duruyor
            }else {
                self.movies = []
            }
        })
    }
}
