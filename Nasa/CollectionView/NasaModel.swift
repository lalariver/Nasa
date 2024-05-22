//
//  NasaModel.swift
//  Nasa
//
//  Created by user on 2024/5/9.
//

import Foundation

struct NasaDatum: Codable, Hashable {
    let description, copyright, title: String?
    let url: String?
    let apodSite: String?
    let date, mediaType: String?
    let hdurl: String?

    enum CodingKeys: String, CodingKey {
        case description, copyright, title, url
        case apodSite = "apod_site"
        case date
        case mediaType = "media_type"
        case hdurl
    }
}

typealias NasaData = [NasaDatum]

extension NasaDatum {
    var dateString: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        guard let date = date,
              let date = dateFormatter.date(from: date)
        else { return nil }
        dateFormatter.dateFormat = "yyyy MMM. dd"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}
