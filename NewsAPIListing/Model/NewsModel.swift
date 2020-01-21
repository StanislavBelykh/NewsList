//
//  NewsModel.swift
//  NewsAPIListing
//
//  Created by Полина on 14.01.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

import Foundation
import UIKit

public struct NewsModel: Codable {


    public var author: String?
    public var title: String?
    public var description: String?
    public var url: String?
    public var urlToImage: String?
    public var publishedAt: String?
    public var content: String?
    public var source: Resource?
    
    var date: String? {
        let converter = DateConverter()
        return converter.converted(dateString: publishedAt)
    }
    var imageURL: URL? {
        guard let urlString = urlToImage,
            let url = URL(string: urlString) else {
            return nil
        }
        return url
    }

    public init(author: String?, title: String?, description: String?, url: String?, urlToImage: String?, publishedAt: String?, content: String?, source: Resource?) {
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
        self.source = source
    }
}

extension NewsModel: Identifiable {
    public var id: String {
        return url ?? UUID().uuidString
    }
}

public struct Resource: Codable{
    var id: String?
    var name: String?
    
    public init (id: String?, name: String? ){
        self.id = id
        self.name = name
    }
}
