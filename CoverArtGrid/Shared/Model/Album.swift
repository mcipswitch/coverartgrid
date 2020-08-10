//
//  Album.swift
//  CoverArtGrid
//
//  Created by Priscilla Ip on 2020-08-09.
//

import SwiftUI

struct Album: Identifiable {
    var id = UUID()
    var title: String
    var artist: String
    var image: String
}

var albums = [
    Album(
        title: "The Electric lady",
        artist: "Janelle Monáe",
        image: "the_electric_lady"
    ),
    Album(
        title: "Black on Both Sides",
        artist: "Mos Def",
        image: "black_on_both_sides"
    ),
    Album(
        title: "Badlands",
        artist: "Halsey",
        image: "badlands"
    )
]
