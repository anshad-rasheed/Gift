//
//  SelectedCategory.swift
//  Gift
//
//  Created by Anshad R on 15/02/21.
//

import Foundation
struct SelectedCategory : Codable {
	let id : Int?
	let colorCode : String?
	let image : String?
	let name : String?

	enum CodingKeys: String, CodingKey {
		case id, name
		case colorCode = "bg_color_code"
		case image = "image_small"
	}

}
