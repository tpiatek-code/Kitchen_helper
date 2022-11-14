import UIKit


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    let food:[(name: String, value: Double)] = [("flour", 0.66), ("sugar", 0.88), ("powdered sugar", 0.68)]
    let grams = ["50g", "100g", "150g", "200g", "250g"]
    
    let pickerFood = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerFood.overrideUserInterfaceStyle = .dark
        
        pickerFood.delegate = self
        pickerFood.dataSource = self
        
        //Image
        setupImage()
        
        //Label
        setupLabelCalc()
        setupLabelInfo()
        
        //Picker
        setupPickerFood()
        
        
//        //Button
//        setupButtonCalc()
//        buttonCalc.addTarget(self, action: #selector(buttonCalcTapped), for: .touchUpInside)
    }
    
    
    //MARK: - Picker Food
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return food.count
        }
        return grams.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return food[row].name
        }
        let stringGrams = String(grams[row])
        return stringGrams
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        let row1 = pickerView.selectedRow(inComponent: 0)
        let row2 = pickerView.selectedRow(inComponent: 1)
        
        // flour
        if row1 == 0 {
            let a = food[row1].value
            let b = grams[row2]
            let c = Double(b.dropLast()) ?? 0.0
            
            let d = (a * c) / 100
            let x = Double(round(10 * d) / 10)
            print(x) /// 1.2
            labelPrint(x: x)
        }
        // sugar
        else if row1 == 1 {
            let a = food[row1].value
            let b = grams[row2]
            let c = Double(b.dropLast()) ?? 0.0

            let d = (a * c) / 100
            let x = Double(round(10 * d) / 10)
            print(x) /// 1.2
            labelPrint(x: x)
        }
        // powdered sugar
        else if row1 == 2 {
            let a = food[row1].value
            let b = grams[row2]
            let c = Double(b.dropLast()) ?? 0.0
            
            let d = (a * c) / 100
            let x = Double(round(10 * d) / 10)
            print(x) /// 1.2
            labelPrint(x: x)
            
        }
        // next
        else if row1 == 3 {
            let a = food[row1].value
            let b = grams[row2]
            let c = Double(b.dropLast()) ?? 0.0
            
            let d = (a * c) / 100
            let x = Double(round(10 * d) / 10)
            print(x) /// 1.2
            labelPrint(x: x)
        }
        // next
        else if row1 == 4 {
            let a = food[row1].value
            let b = grams[row2]
            let c = Double(b.dropLast()) ?? 0.0
            
            let d = (a * c) / 100
            let x = Double(round(10 * d) / 10)
            print(x) /// 1.2
            labelPrint(x: x)
        }
    }
    
    func labelPrint(x: Double) {
        let y = String(x)
        labelCalc.text = "\(y)x"
    }
    
    
    func setupPickerFood() {
        view.addSubview(pickerFood)
        pickerFood.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        pickerFood.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pickerFood.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            pickerFood.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            pickerFood.bottomAnchor.constraint(equalTo:  labelCalc.topAnchor, constant: -30),
            pickerFood.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    //MARK: - Image
    
    func setupImage() {
        
        view.addSubview(imageTop)

        NSLayoutConstraint.activate([
            imageTop.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageTop.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageTop.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            imageTop.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.25)
        ])
    }


    private let imageTop: UIImageView = {

        let i = UIImage(named: "kitchen helper.png")
        let imageLogo: UIImageView = UIImageView()
        imageLogo.image = i
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.contentMode = .scaleAspectFit
            return imageLogo
        }()
    
    
    
    //MARK: - LabelCalc
    
    func setupLabelCalc() {
        view.addSubview(labelCalc)
        labelCalc.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        
        NSLayoutConstraint.activate([
            labelCalc.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            labelCalc.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            labelCalc.bottomAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            labelCalc.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private let labelCalc: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        label.text = "0.0x"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Light", size: 60)
        label.textColor = .white
        label.textAlignment = .center
            return label
        }()

    
    //MARK: - LabelInfo
    
    func setupLabelInfo() {
        view.addSubview(labelInfo)
        labelCalc.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        
        NSLayoutConstraint.activate([
            labelInfo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            labelInfo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            labelInfo.bottomAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            labelInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private let labelInfo: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        label.text = "250 ml glass"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Light", size: 20)
        label.textColor = .white
        label.textAlignment = .center
            return label
        }()
    
    
//    //MARK: - Button
//
//    func setupButtonCalc() {
//        view.addSubview(buttonCalc)
//        //buttonCalc.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
//        buttonCalc.backgroundColor = .lightGray
//        buttonCalc.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            buttonCalc.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
//            buttonCalc.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
//            buttonCalc.bottomAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.bottomAnchor, constant: -250),
//            buttonCalc.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
//    }
//
//    @objc func buttonCalcTapped() {
//        var a = 2
//        var b = 4
//        var c = a + b
//        print("button")
//    }
//
//    private let buttonCalc: UIButton = {
//            let button = UIButton(type: .system)
//            button.setTitle("CALCULATE", for: .normal)
//            button.translatesAutoresizingMaskIntoConstraints = false
//            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//            button.setTitleColor(.black, for: .normal)
//            return button
//        }()
    
    
    
}

