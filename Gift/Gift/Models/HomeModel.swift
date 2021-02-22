//
//  HomeModel.swift
//  Gift
//
//  Created by Anshad R on 15/02/21.
//
import Foundation
struct HomeModel : Codable {
	let label : String?
	let paginationInfo : PaginationInfo?
	let brands : [Brands]?
	let categories : [Categories]?
	let selectedCategory : SelectedCategory?
	let numberOfTags : Int?

	enum CodingKeys: String, CodingKey {
		case label, brands, categories
		case paginationInfo = "paginated_data"
		case selectedCategory = "selected_category"
		case numberOfTags = "tags_count"
	}
}
