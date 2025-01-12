import UIKit

class CreateTripViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - UI Elements
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(hex: "1B1E28").withAlphaComponent(0.16)
        button.setTitle("ᐸ", for: .normal) // <
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

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
        label.font = UIFont.boldSystemFont(ofSize: 24)
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

    private var containerHeightConstraint: NSLayoutConstraint!
    private var selectedFile: UIImage?

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
    
    private let aboutDestinationLabel: UILabel = {
        let label = UILabel()
        label.text = "About Destination"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = """
        You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC. You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC. You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC. You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC
        """
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let readMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Read more", for: .normal)
        button.setTitleColor(UIColor(hex: "FF7029"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapReadMore), for: .touchUpInside)
        return button
    }()

    private var isExpanded = false

    private let locationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "mappin.and.ellipse") // иконка для местоположения
        imageView.tintColor = .gray // цвет иконки
        imageView.contentMode = .scaleAspectFit // режим отображения изображения
        imageView.translatesAutoresizingMaskIntoConstraints = false // отключаем автогенерацию ограничений
        return imageView
    }()

    lazy var subtitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationIcon, TekergatLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let descriptionScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let descriptionContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        
        // This piece goes here
        containerView.addSubview(descriptionScrollView)
        descriptionScrollView.addSubview(descriptionContentView)
        descriptionContentView.addSubview(descriptionLabel)
        descriptionContentView.addSubview(readMoreButton)

        containerView.addSubview(NiladriReservoirLabel)
        containerView.addSubview(TekergatLabel)
        containerView.addSubview(photoGalleryCollectionView)
        containerView.addSubview(aboutDestinationLabel)
//        containerView.addSubview(descriptionLabel)
//        containerView.addSubview(readMoreButton)
        containerView.addSubview(subtitleStackView)

    }
    // MARK: setupLayout
    private func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),

            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 0.8),

            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

        containerHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 430)
        containerHeightConstraint.isActive = true

        NSLayoutConstraint.activate([
            collapseButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            collapseButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            collapseButton.widthAnchor.constraint(equalToConstant: 36),
            collapseButton.heightAnchor.constraint(equalToConstant: 5),

            NiladriReservoirLabel.topAnchor.constraint(equalTo: collapseButton.bottomAnchor, constant: 16),
            NiladriReservoirLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            // Subtitle StackView (Location Icon + location Label)
            subtitleStackView.topAnchor.constraint(equalTo: NiladriReservoirLabel.bottomAnchor, constant: 7),
            subtitleStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            subtitleStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

//            TekergatLabel.topAnchor.constraint(equalTo: NiladriReservoirLabel.bottomAnchor, constant: 12),
//            TekergatLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//            TekergatLabel.widthAnchor.constraint(equalToConstant: 360),
//            TekergatLabel.heightAnchor.constraint(equalToConstant: 38),
            

            photoGalleryCollectionView.topAnchor.constraint(equalTo: TekergatLabel.bottomAnchor, constant: 12),
            photoGalleryCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            photoGalleryCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            photoGalleryCollectionView.heightAnchor.constraint(equalToConstant: 70),

            aboutDestinationLabel.topAnchor.constraint(equalTo: photoGalleryCollectionView.bottomAnchor, constant: 15),
            aboutDestinationLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        ])
        
//        NSLayoutConstraint.activate([
//            descriptionLabel.topAnchor.constraint(equalTo: aboutDestinationLabel.bottomAnchor, constant: 2),
//            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
//
//            readMoreButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
//            readMoreButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
//            readMoreButton.heightAnchor.constraint(equalToConstant: 20)
//        ])
        
        NSLayoutConstraint.activate([
            // Ограничения для descriptionScrollView
            descriptionScrollView.topAnchor.constraint(equalTo: aboutDestinationLabel.bottomAnchor, constant: 8),
            descriptionScrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            descriptionScrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            descriptionScrollView.heightAnchor.constraint(equalToConstant: 100), // Изначальная высота

            // Ограничения для descriptionContentView внутри scrollView
            descriptionContentView.topAnchor.constraint(equalTo: descriptionScrollView.topAnchor),
            descriptionContentView.leadingAnchor.constraint(equalTo: descriptionScrollView.leadingAnchor),
            descriptionContentView.trailingAnchor.constraint(equalTo: descriptionScrollView.trailingAnchor),
            descriptionContentView.bottomAnchor.constraint(equalTo: descriptionScrollView.bottomAnchor),
            descriptionContentView.widthAnchor.constraint(equalTo: descriptionScrollView.widthAnchor),

            // Ограничения для descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: descriptionContentView.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionContentView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionContentView.trailingAnchor),

            // Ограничения для readMoreButton
            readMoreButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            readMoreButton.leadingAnchor.constraint(equalTo: descriptionContentView.leadingAnchor),
            readMoreButton.bottomAnchor.constraint(equalTo: descriptionContentView.bottomAnchor),
            readMoreButton.heightAnchor.constraint(equalToConstant: 20)
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
    
    
    
//    @objc private func didTapReadMore() {
//        isExpanded.toggle()
//        descriptionLabel.numberOfLines = isExpanded ? 0 : 3
//        readMoreButton.setTitle(isExpanded ? "Read less" : "Read more", for: .normal)
//        UIView.animate(withDuration: 0.3) {
//            self.view.layoutIfNeeded()
//        }
//    }
    
    @objc private func didTapReadMore() {
        isExpanded.toggle()
        descriptionLabel.numberOfLines = isExpanded ? 0 : 3
        readMoreButton.setTitle(isExpanded ? "Read less" : "Read more", for: .normal)
        
        // Изменяем высоту descriptionScrollView
        let targetHeight: CGFloat = isExpanded ? 300 : 100 // Устанавливаем желаемую высоту
        UIView.animate(withDuration: 0.3) {
            self.descriptionScrollView.heightAnchor.constraint(equalToConstant: targetHeight).isActive = true
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
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "SFUIDisplay-Bold", size: 40)
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
            // MARK: Close Button constraint
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
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
        overlayLabel.isHidden = true // without counter
        imageView.backgroundColor = .clear // clarity
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





