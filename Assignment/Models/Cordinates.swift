//
//  Coord.swift
//  Assignment
//

import Foundation

struct Cordinates : Codable {
	let lon : Double?
	let lat : Double?

	enum CodingKeys: String, CodingKey {

		case lon = "lon"
		case lat = "lat"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		lon = try values.decodeIfPresent(Double.self, forKey: .lon)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
	}
    
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
}
