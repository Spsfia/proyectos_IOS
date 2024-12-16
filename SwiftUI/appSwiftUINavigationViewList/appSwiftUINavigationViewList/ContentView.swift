//
//  ContentView.swift
//  appSwiftUINavigationViewList
//
//  Created by Adriana Sofia on 10/12/24.
//

import SwiftUI

struct emojiFrutas: Identifiable
{
    let id = UUID()
    let emoji: String
    let nombre: String
    let descripcion: String
    let imagen: String
}

private let listaEmojis: [emojiFrutas] =
[
    emojiFrutas(emoji: "🍓", nombre: "Fresa", descripcion: "La fresa o frutilla es un género de plantas rastreras estoloníferas de la familia Rosaceae. Agrupa unos 425 taxones descritos, de los cuales solo unos 20 están aceptados.​ Son cultivadas por su fruto comestible llamado de la misma manera: fresa o, en algunos países hispanoamericanos, frutilla.", imagen: "IMG_0408"),
    emojiFrutas(emoji: "🍊", nombre: "Naranja", descripcion: "La naranja es una fruta cítrica obtenida del naranjo dulce (Citrus × sinensis), del naranjo amargo (Citrus × aurantium) y de naranjos de otras variedades o híbridos, de origen asiático.1​ Es un hesperidio carnoso de cáscara más o menos gruesa y endurecida y su pulpa está formada típicamente por once gajos u hollejos llenos de jugo, el cual contiene mucha vitamina C, flavonoides y aceites esenciales.", imagen: "images-4"),
    emojiFrutas(emoji: "🍋", nombre: "Lemon", descripcion: "El término limón es un nombre común de tres frutas cítricas fragantes y de sabor ácido, utilizadas principalmente en el sector alimentario. En primer lugar, se conoce como limones a aquellos frutos producidos por el híbrido Citrus × aurantifolia, árbol llamado popularmente limonero. Por otra parte, en el Cono Sur y España se le da el nombre de limón al fruto de Citrus × limon.", imagen: "images-2"),
    emojiFrutas(emoji: "🥝", nombre: "Kiwi", descripcion: "El kiwi, kivi1​ o quivi2​ es la baya de la enredadera Actinidia deliciosa. Es originaria de una gran área de China, sobre todo de los bosques del valle del río Yangtsé. Las primeras variedades descubiertas y cultivadas en China se describieron en un catálogo de viveros de 1904 como frutos comestibles del tamaño de nueces y el sabor de grosellas maduras, lo que llevó al nombre de grosella espinosa china.Introducida en Nueva Zelanda en 1904, fue cultivada desde entonces en muchas regiones templadas por su fruto comestible. Es una de las frutas con mayor concentración de vitamina C.", imagen: "images-3"),
    emojiFrutas(emoji: "🍉", nombre: "Sandía", descripcion: "Citrullus lanatus, comúnmente llamada melón de agua, sandía, acendría, sindria, patilla, es una especie de la familia Cucurbitaceae. Es originaria de África con una gran presencia y difusión en todo el mundo. Se cultiva de manera extendida por todo el mundo debido a su fruto, el cual es un pepónide de enorme tamaño (el récord entre las frutas fue una de 120 kg)", imagen: "SANDIA_blog")
    
]

struct ContentView: View {
    var body: some View {
        NavigationView{
            List(listaEmojis){
                emojiFruta in NavigationLink(destination: detallesView(emojiFruta: emojiFruta)){
                    HStack{
                        emojiCirculoView(emojiFruta: emojiFruta)
                        Text(emojiFruta.nombre).font(.headline)
                    }.padding()
                }
            }
        }.navigationBarTitle("Frutas")
    }
}//Fin CONTENT VIEW

struct detallesView: View{
    let emojiFruta: emojiFrutas
    var body: some View{
        VStack(alignment: .leading){
            HStack{
                emojiCirculoView(emojiFruta: emojiFruta).padding()
               
                Image(emojiFruta.imagen)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 265, height: 265)
                    .clipShape(Circle())
                Spacer()
                Text(emojiFruta.nombre).font(.largeTitle).bold()
                Spacer()
            }
            Text(emojiFruta.descripcion)
                .padding(.top)
            Spacer()
        } .padding()
            .navigationBarTitle(Text(emojiFruta.nombre), displayMode: .large)
    }
       
       
}

struct emojiCirculoView: View{
    let emojiFruta: emojiFrutas
    var body: some View{
        ZStack{
            
            Text(emojiFruta.emoji).shadow(radius: 5)
                .font(.largeTitle)
                .frame(width: 65, height: 65)
                .overlay(Circle().stroke(Color.green, lineWidth: 8))
        }
    }
}

#Preview {
    ContentView()
}
