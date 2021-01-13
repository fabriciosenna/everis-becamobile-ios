//
//  MainViewData.swift
//  CinesofaMVVM
//
//  Created by Fabricio Rodrigo Baixo on 1/13/21.
//

import Foundation

protocol ResultViewDataType {
    var id: Int { get }
    var backdropPath:String { get }
    var title: String? { get }
    var overview: String { get }
    var posterPath:String { get }
}

class ResultViewData{
    
    // MARK: - Properts
    private let model: Result
    
    // MARK: - Constructors
    init(model: Result) {
        self.model = model
    }
}

extension ResultViewData: ResultViewDataType{
    
    var id: Int{
        return model.id
    }
    
    var backdropPath: String{
        return model.backdropPath
    }
    
    var title: String?{
        return model.title
    }
    
    var overview:String {
        model.overview
    }
    
    var posterPath: String{
        model.posterPath
    }
}
