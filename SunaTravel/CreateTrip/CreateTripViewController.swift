//
//  CreateTripViewController.swift
//  SunaTravel
//
//  Created by Lilia Chechina on 24.12.2024.
//
import UIKit
import PhotosUI  // for multiply photo selection

class CreateTripViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - UI Elements
    
    // Background Image
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // Back Button
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(hex: "1B1E28").withAlphaComponent(0.16)
        button.setTitle("<", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Title Label
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create a trip"
        label.textColor = .white
        label.font = UIFont(name: "SE Pro Text", size: 80)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.removeConstraints(label.constraints)
        label.textAlignment = .center
        return label
    }()


    // Main Container View
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let collapseButton: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "7D848D").withAlphaComponent(0.2)
        view.layer.cornerRadius = 2.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let tripNameTextField = CreateTripViewController.createRoundedTextField(placeholder: "Write a trip name")
    private let locationTextField = CreateTripViewController.createRoundedTextField(placeholder: "Write location")
    private let descriptionTextView = CreateTripViewController.createRoundedTextView(placeholder: "Write description")

    private let addFileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)  // жирный шрифт
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(hex: "CED2D9")
        button.addTarget(self, action: #selector(didTapAddFile), for: .touchUpInside)
        // user clicks on the button and releases(leave) their finger without moving it beyound (вне) the button
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hex: "24BAEC")
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var selectedFile: UIImage?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }

    // MARK: - Setup Methods
    
    private func setupView() {
        view.addSubview(backgroundImageView)
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(containerView)
        
        containerView.addSubview(collapseButton)
        containerView.addSubview(tripNameTextField)
        containerView.addSubview(locationTextField)
        containerView.addSubview(addFileButton)
        containerView.addSubview(descriptionTextView)
        containerView.addSubview(saveButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            // Background Image
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Back Button
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Title Label
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor), // Центр по вертикали относительно кнопки "Назад"
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),       // Центр по горизонтали относительно экрана
            titleLabel.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 0.8), // width up to (до) 80% ширины экрана
//            titleLabel.heightAnchor.constraint(equalToConstant: 80), // fixed height of tittle
            


            // Container View
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 461),
            
            // Collapse Button
            collapseButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            collapseButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            collapseButton.widthAnchor.constraint(equalToConstant: 36),
            collapseButton.heightAnchor.constraint(equalToConstant: 5),

            // Trip Name Field
            tripNameTextField.topAnchor.constraint(equalTo: collapseButton.bottomAnchor, constant: 16),
            tripNameTextField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            tripNameTextField.widthAnchor.constraint(equalToConstant: 360),
            tripNameTextField.heightAnchor.constraint(equalToConstant: 38),

            // Location Field
            locationTextField.topAnchor.constraint(equalTo: tripNameTextField.bottomAnchor, constant: 12),
            locationTextField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            locationTextField.widthAnchor.constraint(equalToConstant: 360),
            locationTextField.heightAnchor.constraint(equalToConstant: 38),

            // Add File Button
            addFileButton.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 7),
            addFileButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            addFileButton.widthAnchor.constraint(equalToConstant: 40),
            addFileButton.heightAnchor.constraint(equalToConstant: 40),

            // Description TextView
            descriptionTextView.topAnchor.constraint(equalTo: addFileButton.bottomAnchor, constant: 35),
            // рассточние от н, чем больше, тем ближе к н
            descriptionTextView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            descriptionTextView.widthAnchor.constraint(equalToConstant: 360),
            // ширина 3 кнопки
            descriptionTextView.heightAnchor.constraint(equalToConstant: 140),


            // Save Button
            saveButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 10),  // как близко к н
            saveButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 360),
            saveButton.heightAnchor.constraint(equalToConstant: 65)
        ])
    }
    
    @objc private func didTapBack() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapAddFile() {
        var config = PHPickerConfiguration()
        config.selectionLimit = 0 // 0 means unlimited choice
        config.filter = .images // limit the choice to images only

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    // Helper: Create text fields and views
    private static func createRoundedTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.backgroundColor = UIColor(hex: "CED2D9")
        textField.layer.cornerRadius = 15
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    private static func createRoundedTextView(placeholder: String) -> UITextView {
        let textView = UITextView()
        textView.placeholder = placeholder // Используем свойство placeholder из расширения
        textView.textColor = UIColor(hex: "7D848D")
        textView.backgroundColor = UIColor(hex: "CED2D9")
        textView.layer.cornerRadius = 15
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 17) // size of letters
        return textView
    }
    
}

// MARK: - UIColor Helper
extension UIColor {
    convenience init(hex: String) {
        let hexNumber = Int(hex, radix: 16) ?? 0
        self.init(red: CGFloat((hexNumber >> 16) & 0xFF) / 255.0,
                  green: CGFloat((hexNumber >> 8) & 0xFF) / 255.0,
                  blue: CGFloat(hexNumber & 0xFF) / 255.0,
                  alpha: 1.0)
    }
}

// The code works on devices with iOS 14 and higher
extension CreateTripViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)

        guard !results.isEmpty else { return }

        let firstItem = results.first
        firstItem?.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] object, error in
            guard let self = self, let image = object as? UIImage, error == nil else { return }

            DispatchQueue.main.async {
                self.backgroundImageView.image = image // set the first file as background
            }
        }
    }
}

extension UITextView: UITextViewDelegate {
    private struct AssociatedKeys {
        static var placeholderKey = "placeholderKey"
    }
    
    // Обработчик для текста-плейсхолдера
    var placeholder: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.placeholderKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.placeholderKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            // Устанавливаем плейсхолдер, если нет текста
            if self.text.isEmpty {
                self.text = newValue
                self.textColor = UIColor.lightGray // Цвет текста для плейсхолдера
            }
        }
    }
    
    // Переопределим метод, чтобы скрывать плейсхолдер при вводе
    public func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholder {
            textView.text = ""
            textView.textColor = UIColor.black // Цвет текста, когда пользователь начинает вводить
        }
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholder
            textView.textColor = UIColor.lightGray // Цвет текста для плейсхолдера
        }
    }
    
    // Метод для инициализации с плейсхолдером
    func setupPlaceholder() {
        if self.text.isEmpty {
            self.text = placeholder
            self.textColor = UIColor.lightGray // Цвет текста для плейсхолдера
        }
    }
}

