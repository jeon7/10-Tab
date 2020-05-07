//
//  ViewController.swift
//  05 PickerView
//
//  Created by Gukhwa Jeon on 22.04.20.
//  Copyright © 2020 G-Kay. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg",
                         "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
    
    @IBOutlet var PickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 0 <= i < MAX_ARRAY_NUM 동안 i++ 하며 루프 돔
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        // show 최초 이미지 파일 이름
        lblImageFileName.text = imageFileName[0]
        // show 최초 이미지
        imageView.image = imageArray[0]
    }

    
    // 자동추가(UIPickerViewDataSource protocol)
    // 피커뷰에게 컴포넌트의 수를 정수 값으로 넘겨주는 델리게이트 메서드 (컬럼 갯수)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // 상속, 수동추가
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    // 자동추가(UIPickerViewDataSource protocol)
    // numberOfRowsInComponent 인수를 가지는 델리게이트 메서드 (로우값)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    // 수동추가
    // titleForRow 인수를 가지는 델리게이트 메서드 (룰렛 디스플레이 텍스트)
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    // 수동추가
    // viewForRow 인수를 가지는 델리게이트 메서드 (룰렛 디스플레이 뷰)
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width:  100, height: 150) // 이미지 뷰 프레임 크기 설정
        return imageView
    }
    
    // 수동추가
    // didSelectRow 인수를 가지는 델리게이트 메서드 (선택된 로우)
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
}

