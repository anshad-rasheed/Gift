//
//  Categories.swift
//  Gift
//
//  Created by Anshad R on 15/02/21.
//

import Foundation
struct Categories : Codable {
	let id : Int?
	let name : String?
	let seoName : String?
	let imageLarge : String?
	let imageSmall : String?
	let title : String?
	let caption : String?
	let defaultDisplay : Bool?
	let colorCode : String?
	let tagType : String?
	let iconImage : String?

	enum CodingKeys: String, CodingKey {

		case id, name, title, caption
		case seoName = "seo_name"
		case imageLarge = "image_large"
		case imageSmall = "image_small"
		case defaultDisplay = "default_display"
		case colorCode = "bg_color_code"
		case tagType = "tag_type"
		case iconImage = "icon_image"
	}

}
