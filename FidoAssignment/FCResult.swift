//
//  FCResult.swift
//  FidoAssignment
//
//  Created by אהרן שלמה אדלמן on 03/08/2022.
//

import Foundation

// MARK: - FCResult
struct FCResult: Codable {
    var status: String
    var totalResults: Int
    var articles: [FCArticle]

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
    }
    
    static func from(_ data: Data) -> (result: FCResult?, error: Error?) {
        do {
            let result = try JSONDecoder().decode(FCResult.self, from: data)
//                    debugPrint(#file, #function, result)
            return (result, nil)
        } catch {
//            debugPrint(#file, #function, error)
            return (nil, error)
        }
        
    }
}

// MARK: - FCArticle
struct FCArticle: Codable {
    var source: FCSource
    var author: String?
    var title: String
    var articleDescription: String?
    var url: String
    var urlToImage: String?
    var publishedAt: String
    var content: String?

    enum CodingKeys: String, CodingKey {
        case source = "source"
        case author = "author"
        case title = "title"
        case articleDescription = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
}

// MARK: - FCSource
struct FCSource: Codable {
    var id: String?
    var name: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}
