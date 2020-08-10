//
//  GridView.swift
//  CoverArtGrid
//
//  Created by Priscilla Ip on 2020-08-09.
//

import SwiftUI

struct GridView: View {
    @State var show = false
    @Namespace var namespace
    @State var selectedAlbum: Album? = nil
    @State var isDisabled = false
    
    var body: some View {
        let spacing: CGFloat = 2
        
        ZStack {
            ScrollView {
                LazyVGrid(
                    columns: Array(repeating: .init(.flexible(), spacing: spacing), count: 3),
                    spacing: spacing
                ) {
                    ForEach(albums) { album in
                        CoverArt(album: album)
                            .matchedGeometryEffect(id: album.id, in: namespace, isSource: !show)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
                                    show.toggle()
                                    selectedAlbum = album
                                    isDisabled = true
                                }
                            }
                            .disabled(isDisabled)
                    }
                }
            }
            .scaleEffect(show ? 1.1 : 1)
            VisualEffectBlur(blurStyle: .systemThinMaterial)
                .edgesIgnoringSafeArea(.all)
                .opacity(show ? 1 : 0)
            if selectedAlbum != nil {
                VStack {
                    Text(selectedAlbum!.title)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text(selectedAlbum!.artist)
                        .font(.caption)
                    
                    CoverArt(album: selectedAlbum!)
                        .clipShape(RoundedRectangle(cornerRadius: 2, style: .continuous))
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                        .matchedGeometryEffect(id: selectedAlbum!.id, in: namespace)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
                                show.toggle()
                                selectedAlbum = nil
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                    isDisabled = false
                                }
                            }
                        }
                }
                .padding(.horizontal, 8)
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}

let screen = UIScreen.main.bounds
