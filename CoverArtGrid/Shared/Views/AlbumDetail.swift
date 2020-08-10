//
//  AlbumDetail.swift
//  CoverArtGrid
//
//  Created by Priscilla Ip on 2020-08-09.
//

import SwiftUI

struct AlbumDetail: View {
    var body: some View {
        VStack {
            CoverArt()
            Spacer()
        }
        .background(Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(radius: 10)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct AlbumDetail_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetail()
    }
}
