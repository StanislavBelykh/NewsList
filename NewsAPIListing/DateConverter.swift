//
//  DateConverter.swift
//  NewsAPIListing
//
//  Created by Полина on 21.01.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

import Foundation

class DateConverter {
    
    func converted (dateString: String?) -> String {
        if let dateString = dateString{
            let dateFormatter = DateFormatter()
            //        "2020-01-21T06:17:30Z"
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH-mm-ss'Z'"
                    let date = dateFormatter.date(from: dateString)
                    dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
                    let dateConverted = dateFormatter.string(from: date!)
                    return dateConverted
        }else {return "date"}
        
    }
}
