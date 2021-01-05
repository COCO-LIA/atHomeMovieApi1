//
//  results.swift
//  atHomeMovieApi1
//
//  Created by 황현지 on 2021/01/04.
//

import Foundation

//struct Rexult {
//    var adult : Bool = false
//    var language : String = ""
//    var title : String = ""
//    var popularity : Int = 0
//}

struct Rexult: Codable {
    var adult : Bool = false
    var language : String = ""
    var title : String = ""
    var popularity : Int = 0
    
    enum CodingKeys : String, CodingKey {
        case adult
        case language = "original_language"
        case title
        case popularity
    }
    
    init(from decoder:Decoder) throws{
        //전체 데이터를 values라고 칭한것 //원본은 tableViewTest22
        let values = try decoder.container(keyedBy: CodingKeys.self)
        adult = try values.decode(Bool.self, forKey: .adult)
        language = try values.decodeIfPresent(String.self, forKey: .language)!
        title = try values.decode(String.self, forKey: .title)
        popularity = try values.decode(Int.self, forKey: .popularity)
        
    }
}

struct RexultDataStore: Codable {
    var rexults: [Rexult]
}
