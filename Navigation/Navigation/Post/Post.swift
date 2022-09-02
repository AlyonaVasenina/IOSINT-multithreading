//
//  Post.swift
//  Navigation
//
//  Created by Alena Vasenina on 28.10.2021.
//

import UIKit

struct Post {
    var title: String
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    
    static let test1 = Post(title: "Дельфины", author: "primocean_aquarium",
                            description: "Глаза дельфинов отлично приспособлены, чтобы видеть и под водой, и на воздухе. Поэтому они без труда рассчитывают траекторию для прыжков и хорошо различают своих тренеров.",
                            image: "dolfins", likes: 132, views: 36)
    static let test2 = Post(title: "Коты", author: "naumroitman",
                            description: "Взгляд говорит обо всём",
                            image: "Cat_2", likes: 35, views: 489)
    static let test3 = Post(title: "Ведьмак", author: "tasha_kniginya",
                            description: "С возвращением",
                            image: "Vedmak", likes: 265, views: 156)
    static let test4 = Post(title: "Порто Флавия, Иглезиас, Италия.", author: "m.y_p.l.a.n.e.t",
                            description: "Порто Флавия когда-то был необычным портом на юго-западном побережье Сардинии, второго по величине острова в Средиземном море. Фактически это небольшое отверстие в известняковых скалах над морем, ведущее прямо к шахтам городка Масуа. На шахтах добывали цинк, свинец и другие полезные ископаемые, в том числе и серебро. Руду доставляли через 600-метровый туннель конвейерными лентами в устье туннеля. Затем механическая рука загружала руду прямо на морские суда. Гениальная гавань была построена в 1924 году инженером Чезаре Вечелли. Он назвал ее Порто Флавия в честь своей дочери Флавии.",
                            image: "Flaviya", likes: 376, views: 67)
    
    static let testPosts = [test1, test2, test3, test4]
}
