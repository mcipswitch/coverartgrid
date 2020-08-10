//
//  CoverArt.swift
//  CoverArtGrid
//
//  Created by Priscilla Ip on 2020-08-09.
//

import SwiftUI

struct CoverArt: View {
    var album: Album = albums[0]
    
    var body: some View {
        VStack {
            Image(album.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct CoverArt_Previews: PreviewProvider {
    static var previews: some View {
        CoverArt()
    }
}
