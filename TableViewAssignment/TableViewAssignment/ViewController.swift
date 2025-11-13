//
//  ViewController.swift
//  TableViewAssignment
//
//  Created by Ruslan Amrayev on 09.11.2025.
//

import UIKit

struct FavoriteItem {
    var title: String
    var subtitle: String
    var review: String
    var image: UIImage
}

enum SectionType {
    case movies
    case music
    case books
    case courses
    
    var title: String {
        switch self {
        case .movies: return "Favorite Movies 🎬"
        case .music: return "Favorite Music 🎵"
        case .books: return "Favorite Books 📚"
        case .courses: return "Favorite Courses 🎓"
        }
    }
}

struct Section {
    let type: SectionType
    let items: [FavoriteItem]
}

class ViewController: UIViewController, UITableViewDelegate {
    
    
    
    let sections: [Section] = [
        Section(type: .movies, items: [
            FavoriteItem(title: "Пазманский дьявол", subtitle: "Bleed for This 18+", review: "Очень мотивирующий фильм про известного боксера, который совершил возвращение после жуткой травмы не только в полноценную жизнь, но и в спорт", image: #imageLiteral(resourceName: "Bleed_for_This")),
            FavoriteItem(title: "Движение вверх", subtitle: "6+", review: "Захватывающий фильм о спорте, который держит в напряжении до самого конца", image: #imageLiteral(resourceName: "Движение_вверх")),
            FavoriteItem(title: "По соображениям совести", subtitle: "Hacksaw Ridge 18+", review: "Мне понравился фильм, так как он учит действовать по совести и не идти на компромисс с честью.", image: #imageLiteral(resourceName: "Hacksaw_Ridge")),
            FavoriteItem(title: "Хулиганы", subtitle: "Green Street 16+", review: "Сильная атмосфера: футбольные дерби, уличные потасовки, реальное напряжение — всё это усиливает погружение.В ней еще сильнее привязываешься к персонажам и сопереживаешь им.", image: #imageLiteral(resourceName: "Hooligans")),
            FavoriteItem(title: "Гонка", subtitle: "Rush 18+", review: "Было интересно видеть, как герои меняются и преодолевают не только соперников, но и свои личные страхи и слабости.", image: #imageLiteral(resourceName: "Rush")),
        ]),
        Section(type: .music, items: [
            FavoriteItem(title: "П.Н.В", subtitle: "Yanix", review: "Моя наилюбимейшая песня", image: #imageLiteral(resourceName: "пнв")),
            FavoriteItem(title: "Не говори им", subtitle: "Yanix", review: "Я кушаю бэнкроллы и не посвящаю ее в свой бизнес. Карманы пахнут жаренными ведь в них котлеты толщиной с книгу", image: #imageLiteral(resourceName: "Не_говори")),
            FavoriteItem(title: "MB", subtitle: "OBLADAET & LIL KRYSTALLL", review: "Оу, ха, VPN, планета крутится, Vivienne. Сейчас понимаю, что не зря вложил бабки в этот VVS", image: #imageLiteral(resourceName: "mb")),
            FavoriteItem(title: "Dreamin Freestyle", subtitle: "Heronwater", review: "Мечтать не вредно, но одни проживают в своих мечтах годы, а другие просто сгибают горы", image: #imageLiteral(resourceName: "dreamin_freestyle")),
            FavoriteItem(title: "Bad blood", subtitle: "Kizaru", review: "Ну это просто шестиэтажные рифмы", image: #imageLiteral(resourceName: "bad_blood")),
            

        ]),
        Section(type: .books, items: [
            FavoriteItem(title: "Графиня де Монсоро", subtitle: "Александр Дюма", review: "Хорошая историческая книга, которая быстро погружает в себя и читается на одном дыхании. Очень интересные персонажи", image: #imageLiteral(resourceName: "Графиня де Монсоро")),
            FavoriteItem(title: "Двадцать тысяч лье под водой", subtitle: "Жюль Верн", review: "Было интересно читать эту научную фантастику, давать волю воображению и визуализировать события в голове", image: #imageLiteral(resourceName: "Двадцать тысяч лье")),
            FavoriteItem(title: "Дети капитана Гранта", subtitle: "Жюль Верн", review: "Мне понравилась история за дух приключений, путешествия в неизведанные земли и подробное, но увлекательное объяснение таких процессов, как добыча огня", image: #imageLiteral(resourceName: "Дети капитана гранта")),
            FavoriteItem(title: "Сорок пять", subtitle: "Александр Дюма", review: "Мне понравилось наблюдать за борьбой героев с внешними и внутренними трудностями, их моральными выборами. ", image: #imageLiteral(resourceName: "Сорок пять")),
            FavoriteItem(title: "Убить пересмешника", subtitle: "Харпер Ли", review: "Читаю сейчас, книга быстро погружает в себя", image: #imageLiteral(resourceName: "Убить пересмешника")),
        ]),
        Section(type: .courses, items: [
            FavoriteItem(title: "IoS dev", subtitle: "Fav course", review: "I like this course", image: #imageLiteral(resourceName: "ios")),
            FavoriteItem(title: "Calculus", subtitle: "Fav course", review: "I like this course", image: #imageLiteral(resourceName: "calculus")),
            FavoriteItem(title: "Statistics", subtitle: "Fav course", review: "I like this course", image: #imageLiteral(resourceName: "statistics")),
            FavoriteItem(title: "Software engineering", subtitle: "Fav course", review: "I like this course", image: #imageLiteral(resourceName: "software")),
            FavoriteItem(title: "Coding", subtitle: "Fav course", review: "I like this course", image: #imageLiteral(resourceName: "pp"))
        ])
    ]

    
    
    
    
    @IBOutlet weak var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
        
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 120
        
    }
    

}


extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].type.title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {
                fatalError("Не удалось преобразовать ячейку в CustomTableViewCell")
            }
            
            let item = sections[indexPath.section].items[indexPath.row]
            cell.configure(with: item)
            return cell
        }
    
    
    
}

