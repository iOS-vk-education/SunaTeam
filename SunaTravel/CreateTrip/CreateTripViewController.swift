//import UIKit
//
//class CreateTripViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    
//    
//    // MARK: - UI Elements
//    // Background Image
//    private let backgroundImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.image = UIImage(named: "background")
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    // Back Button
//    private let backButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.layer.cornerRadius = 20
//        button.backgroundColor = UIColor(hex: "1B1E28").withAlphaComponent(0.16)
//        button.setTitle("<", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//    
//    // Title Label
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Details"
//        label.textColor = .black
//        label.font = UIFont(name: "SFUIDisplay-Bold", size: 80)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.removeConstraints(label.constraints)
//        label.textAlignment = .center
//        return label
//    }()
//
//
//    // Main Container View
//    private let containerView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.layer.cornerRadius = 40
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    private let collapseButton: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(hex: "7D848D").withAlphaComponent(0.2)
//        view.layer.cornerRadius = 2.5
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    private let NiladriReservoirLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Niladri Reservoir"
//        label.textColor = .black
//        label.font = UIFont.boldSystemFont(ofSize: 17)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private let TekergatLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Tekergat"
//        label.textColor = .gray
//        label.font = UIFont.boldSystemFont(ofSize: 17)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
////    private let tripNameTextField = CreateTripViewController.createRoundedTextField(placeholder: "Write a trip name")
////    private let locationTextField = CreateTripViewController.createRoundedTextField(placeholder: "Write location")
//
//    private let aboutDestinationLabel: UILabel = {
//        let label = UILabel()
//        label.text = "About Destination"
//        label.textColor = .black
//        label.font = UIFont.boldSystemFont(ofSize: 17)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private let descriptionTextView: UITextView = {
//        let textView = UITextView()
//        textView.text = "Write description"
//        textView.textColor = .lightGray
//        textView.backgroundColor = UIColor(hex: "F7F7F9")
//        textView.layer.cornerRadius = 15
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.font = UIFont.systemFont(ofSize: 17)
//        return textView
//    }()
//
////    private let addFileButton: UIButton = {
////        let button = UIButton(type: .system)
////        button.setTitle("+", for: .normal)
////        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)  // bold type
////        button.layer.cornerRadius = 20
////        button.backgroundColor = UIColor(hex: "F7F7F9")
////        button.addTarget(self, action: #selector(didTapAddFile), for: .touchUpInside)
////        button.translatesAutoresizingMaskIntoConstraints = false
////        return button
////    }()
//
//    private var containerHeightConstraint: NSLayoutConstraint!
//    private var selectedFile: UIImage?
//
//    // MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupView()
//        setupLayout()
//        addCollapseButtonGesture() // Add gesture for collapse button
//    }
//
//    // MARK: - Setup Methods
//    
//    // Тут добавляем все элементы???
//    private func setupView() {
//        view.addSubview(backgroundImageView)
//        view.addSubview(backButton)
//        view.addSubview(titleLabel)
//        view.addSubview(containerView)
////        view.addSubview(addFileButton)
//        
//        containerView.addSubview(collapseButton)
//        containerView.addSubview(NiladriReservoirLabel)
//        containerView.addSubview(TekergatLabel)
//        containerView.addSubview(aboutDestinationLabel)
//    }
//
//    private func setupLayout() {
//        NSLayoutConstraint.activate([
//            // Background Image
//            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
//            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            
//            // Back Button
//            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            backButton.widthAnchor.constraint(equalToConstant: 40),
//            backButton.heightAnchor.constraint(equalToConstant: 40),
//            
//            // Title Label
//            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor), // Центр по вертикали относительно кнопки "Назад"
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),       // Центр по горизонтали относительно экрана
//            titleLabel.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 0.8), // width up to (до) 80% ширины экрана
//
//            // Container View
//            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        ])
//
//        containerHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 430)
//        containerHeightConstraint.isActive = true
//
//        // Тут внутри белого контейнера всё размещаем
//        NSLayoutConstraint.activate([
//            // Collapse Button
//            collapseButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
//            collapseButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//            collapseButton.widthAnchor.constraint(equalToConstant: 36),
//            collapseButton.heightAnchor.constraint(equalToConstant: 5),
//
//            // Nildari Reservoir Label
//            NiladriReservoirLabel.topAnchor.constraint(equalTo: collapseButton.bottomAnchor, constant: 16),
//            NiladriReservoirLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//            NiladriReservoirLabel.widthAnchor.constraint(equalToConstant: 360),
//            NiladriReservoirLabel.heightAnchor.constraint(equalToConstant: 38),
//            
//            // Tekergat Label
//            TekergatLabel.topAnchor.constraint(equalTo: NiladriReservoirLabel.bottomAnchor, constant: 12),
//            TekergatLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//            TekergatLabel.widthAnchor.constraint(equalToConstant: 360),
//            TekergatLabel.heightAnchor.constraint(equalToConstant: 38),
//            
//            // aboutDestination Label aboutDestinationLabel
//            aboutDestinationLabel.topAnchor.constraint(equalTo: TekergatLabel.bottomAnchor, constant: 17),
//            aboutDestinationLabel.leadingAnchor.constraint(equalTo: TekergatLabel.leadingAnchor),
//
//            
//        ])
//    }
//
//
//    private func addCollapseButtonGesture() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCollapseButton))
//        collapseButton.addGestureRecognizer(tapGesture)
//    }
//
//    @objc private func didTapBack() {
//        dismiss(animated: true, completion: nil)
//    }
//
//    @objc private func didTapCollapseButton() {
//        let isCollapsed = containerHeightConstraint.constant == 430
//        containerHeightConstraint.constant = isCollapsed ? 200 : 430
//        UIView.animate(withDuration: 0.3) {
//            self.view.layoutIfNeeded()
//        }
//    }
//}
//
//



import UIKit

class CreateTripViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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
        label.text = "Details"
        label.textColor = .black
        label.font = UIFont(name: "SFUIDisplay-Bold", size: 80)
        label.translatesAutoresizingMaskIntoConstraints = false
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

    private let NiladriReservoirLabel: UILabel = {
        let label = UILabel()
        label.text = "Niladri Reservoir"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let TekergatLabel: UILabel = {
        let label = UILabel()
        label.text = "Tekergat"
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let aboutDestinationLabel: UILabel = {
        let label = UILabel()
        label.text = "About Destination"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Write description"
        textView.textColor = .lightGray
        textView.backgroundColor = UIColor(hex: "F7F7F9")
        textView.layer.cornerRadius = 15
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 17)
        return textView
    }()

    private var containerHeightConstraint: NSLayoutConstraint!
    private var selectedFile: UIImage?

    // Photo Gallery Collection View
    private let photoGalleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 70, height: 70)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private var photos: [UIImage] = [
        UIImage(named: "photo1")!,
        UIImage(named: "photo2")!,
        UIImage(named: "photo3")!,
        UIImage(named: "photo4")!,
        UIImage(named: "photo5")!
    ]

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        addCollapseButtonGesture()

        photoGalleryCollectionView.delegate = self
        photoGalleryCollectionView.dataSource = self
        photoGalleryCollectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
    }

    // MARK: - Setup Methods
    private func setupView() {
        view.addSubview(backgroundImageView)
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(containerView)

        containerView.addSubview(collapseButton)
        containerView.addSubview(NiladriReservoirLabel)
        containerView.addSubview(TekergatLabel)
        containerView.addSubview(photoGalleryCollectionView)
        containerView.addSubview(aboutDestinationLabel)
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
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 0.8),

            // Container View
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

        containerHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 430)
        containerHeightConstraint.isActive = true

        NSLayoutConstraint.activate([
            // Collapse Button
            collapseButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            collapseButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            collapseButton.widthAnchor.constraint(equalToConstant: 36),
            collapseButton.heightAnchor.constraint(equalToConstant: 5),

            // Nildari Reservoir Label
            NiladriReservoirLabel.topAnchor.constraint(equalTo: collapseButton.bottomAnchor, constant: 16),
            NiladriReservoirLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            // Tekergat Label
            TekergatLabel.topAnchor.constraint(equalTo: NiladriReservoirLabel.bottomAnchor, constant: 12),
            TekergatLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            // Photo Gallery
            photoGalleryCollectionView.topAnchor.constraint(equalTo: TekergatLabel.bottomAnchor, constant: 12),
            photoGalleryCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            photoGalleryCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            photoGalleryCollectionView.heightAnchor.constraint(equalToConstant: 70),

            // About Destination Label
            aboutDestinationLabel.topAnchor.constraint(equalTo: photoGalleryCollectionView.bottomAnchor, constant: 12),
            aboutDestinationLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        ])
    }

    private func addCollapseButtonGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCollapseButton))
        collapseButton.addGestureRecognizer(tapGesture)
    }

    @objc private func didTapBack() {
        dismiss(animated: true, completion: nil)
    }

    @objc private func didTapCollapseButton() {
        let isCollapsed = containerHeightConstraint.constant == 430
        containerHeightConstraint.constant = isCollapsed ? 200 : 430
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    // MARK: - UICollectionView Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let photo = photos[indexPath.item]
        cell.configure(with: photo, isLast: indexPath.item == photos.count - 1, remainingCount: photos.count - 4)
        return cell
    }
}

class FullScreenImageViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        view.addSubview(imageView)
        view.addSubview(closeButton)

        imageView.image = image

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            closeButton.widthAnchor.constraint(equalToConstant: 100),
            closeButton.heightAnchor.constraint(equalToConstant: 40)
        ])

        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
    }

    @objc private func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
}


class PhotoCell: UICollectionViewCell {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let overlayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(overlayLabel)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            overlayLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            overlayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with image: UIImage, isLast: Bool, remainingCount: Int) {
        imageView.image = image
        if isLast {
            overlayLabel.isHidden = false
            overlayLabel.text = "+\(remainingCount)"
            imageView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        } else {
            overlayLabel.isHidden = true
        }
    }
}

extension CreateTripViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = photos[indexPath.item]
        
        let fullScreenVC = FullScreenImageViewController()
        fullScreenVC.image = photo
        
        present(fullScreenVC, animated: true, completion: nil)
    }
}
