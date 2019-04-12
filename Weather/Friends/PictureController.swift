//
//  Pictures.swift
//  Weather
//
//  Created by Andrey Vorobyv on 01.12.2018.
//  Copyright © 2018 Andrey Vorobyv. All rights reserved.
//

import UIKit
import Kingfisher

class PictureController: UIViewController {
    
//    var photos = [PhotosVK]()
//    let photosService = PhotosVKService()
    
    @IBOutlet weak var lookScroll: UIScrollView!
    
    @IBAction func closeButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    var photos = [PhotosVK]()
    var image : String!
    var photoIndex = 0
    var userID = ""
    var photoID = ""
    
    // Обратите внимание, как я поправил эту строчку, у вас был объявлен массив с одним пустым имаджем,
    // а вот таким образом объявляется пустой массив необходимого типа
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        photoView.kf.setImage(with: PhotosVKService.urlForUserVKPhoto(photos[photoIndex].url))
        
        // Dметоде viewDidLoad, размеры вью и сабвью еще не определены -
        // соответственно с ними в этом методе еще нельзя работать, размеры будут определены, начиная с метода viewWillAppear
        lookScroll.frame = view.frame
        //        imageArray = [#imageLiteral(resourceName: "imageScroll1"), #imageLiteral(resourceName: "imageScroll2") ]
        
        // Первым делом, что важно выкидываем все битые ссылки на фото
        let photosUrls: [URL] = photos.compactMap { photo -> URL? in
            return URL(string: photo.url)
        }
        
        // Затем для каждой ссылки, при помощи метода библиотеки Kingfisher запрашиваем фото
        // Kingfisher сам решает взять фото из кеша, или придется закачать вновь
        photosUrls.forEach { imageUrl in
            KingfisherManager.shared.retrieveImage(with: imageUrl) { result in
                switch result {
                case .success(let value):
                    self.imageArray.append(value.image)
                    
                    // Чтобы не тратить лишние ресурсы, добавляем все UIImageView лишь один раз, в случае, когда массив загруженных фотографий, сравняется с количеством запрошенных фото
                    if self.imageArray.count == photosUrls.count {
                        for i in 0 ..< self.imageArray.count{
                            let imageView = UIImageView()
                            imageView.image = self.imageArray[i]
                            imageView.contentMode = .scaleAspectFit
                            let xPosition = self.view.frame.width * CGFloat(i)
                            imageView.frame = CGRect(x: xPosition, y: 0, width: self.lookScroll.frame.width, height: self.lookScroll.frame.height)
                            self.lookScroll.addSubview(imageView)
                        }
                        // Вынеосим перерасчет размера из цикла, достаточно один раз рассчитать размер по количеству элементов, вместо imageScroll используем view.frame
                        self.lookScroll.contentSize.width = self.view.frame.width * CGFloat(self.imageArray.count)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
