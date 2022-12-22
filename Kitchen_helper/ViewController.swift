import UIKit


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var food:[(name: String, value: Double)] = [
        ("flour", 0.68),
        ("potato flour", 0.72),
        ("sugar", 0.88),
        ("icing sugar", 0.68),
        ("salt", 1.2),
        ("butter", 0.96),
        ("cocoa", 0.4),
        ("milk", 1.04),
        ("honey", 1.44)
    ]
    
    let grams = ["10g", "20g", "30g", "40g", "50g", "60g", "70g", "80g", "90g", "100g", "110g", "120g", "130g", "140g", "150g", "160g", "170g", "180g", "190g", "200g", "210g", "220g", "230g", "240g", "250g", "300g", "400g", "500g"]

    let cup:[(name: String, value: Double)] = [
        ("tea spoon", 5.0),
        ("table spoon", 15.0),
        ("250ml cup", 250.0),
        ("330ml cup", 330.0)
    ]

    let pickerFood = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()

        pickerFood.overrideUserInterfaceStyle = .dark
        pickerFood.delegate = self
        pickerFood.dataSource = self
        
        //Top Image
        setupImage()
        
        //Picker
        setupPickerFood()
        
        //StackView
        stackViewBottom()
        
    }
    
    
    //MARK: - Picker Food
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return food.count
        case 1:
            return grams.count
        default:
            return cup.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return food[row].name
        case 1:
            let stringGrams = String(grams[row])
            return stringGrams
        default:
            return cup[row].name
    }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let row1 = pickerView.selectedRow(inComponent: 0)
        let row2 = pickerView.selectedRow(inComponent: 1)
        let row3 = pickerView.selectedRow(inComponent: 2)
        
        if row1 == 0 {
            calculation(row1: row1, row2: row2, row3: row3)
        }
        else if row1 == 1 {
            calculation(row1: row1, row2: row2, row3: row3)
        }
        else if row1 == 2 {
            calculation(row1: row1, row2: row2, row3: row3)
        }
        else if row1 == 3 {
            calculation(row1: row1, row2: row2, row3: row3)
        }
        else if row1 == 4 {
            calculation(row1: row1, row2: row2, row3: row3)
        }
        else if row1 == 5 {
            calculation(row1: row1, row2: row2, row3: row3)
        }
        else if row1 == 6 {
            calculation(row1: row1, row2: row2, row3: row3)
        }
        else if row1 == 7 {
            calculation(row1: row1, row2: row2, row3: row3)
        }
        else if row1 == 8 {
            calculation(row1: row1, row2: row2, row3: row3)
        }
    }
    
    
    func calculation(row1: Int, row2: Int, row3: Int){
        let a = food[row1].value
        let b = grams[row2]
        let c = cup[row3].value
        let dropB = Double(b.dropLast()) ?? 0.0
        let d = (dropB / c) / a
        var x = Double(round(10 * d) / 10)
        labelPrint(x: x)
        
        if c == 5.0 {
            imageSG.image = UIImage(named: "tea spoon.png")
            x = round(1 * x) / 1
            let y = Int(x)
            labelCalc.text = "  \(y)x"
            
        } else if c == 15.0 {
            imageSG.image = UIImage(named: "table spoon.png")
            x = round(1 * x) / 1
            let y = Int(x)
            labelCalc.text = "  \(y)x"
            
        } else if c == 250.0 {
            imageSG.image = UIImage(named: "glass.png")
            
        } else if c == 330.0 {
            imageSG.image = UIImage(named: "glass 330.png")
        }
    }

    
    func labelPrint(x: Double) {
        let y = String(x)
        labelCalc.text = "\(y)x"
    }
    
    
    func setupPickerFood() {
        view.addSubview(pickerFood)
        pickerFood.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        pickerFood.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pickerFood.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            pickerFood.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            pickerFood.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
        ])
    }
    
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let w = pickerView.frame.size.width
        switch component {
        case 0:
            return (5 / 13) * w
        case 1:
            return (3 / 13) * w
        default:
            return (5 / 13) * w
        }
    }

    
    
    //MARK: - Top Image
    
    func setupImage() {
        view.addSubview(imageTop)

        NSLayoutConstraint.activate([
            imageTop.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            imageTop.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
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
    
    
    
    //MARK: - StackView Bottom
    
    func stackViewBottom() {
        let stackView = UIStackView(arrangedSubviews: [
            labelCalc,
            imageSG])

        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            stackView.bottomAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.bottomAnchor, constant: -80)
        ])
    }
    
    
    //MARK: - Spoon/Glass Images
    
    private let imageSG: UIImageView = {
        let i = UIImage(named: "Spoon-glass.png")
        let sg: UIImageView = UIImageView()
        sg.image = i
        sg.translatesAutoresizingMaskIntoConstraints = false
        sg.contentMode = .scaleAspectFit
            return sg
        }()
    
    
    
    //MARK: - LabelCalc
    
    private let labelCalc: UILabel = {
        let label = UILabel()
        label.text = "0.0x"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica-Light", size: 60)
        label.textColor = .white
        label.textAlignment = .center
            return label
        }()

}
