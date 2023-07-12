//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Михаил Болгар on 03.06.2023.
//

import UIKit

final class ProfileViewController: UIViewController, UIGestureRecognizerDelegate, ScaledPhotoDelegate {

    private var newPost = NewPostModel.makeNewPost()
    private var photo = PhotoModel.makeNewPhotoObject()
    let headerView = ProfileHeaderView()
    private var dataSource: [NewPostModel] = []

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NewPostCell.self, forCellReuseIdentifier: NewPostCell.identifier)
        tableView.sectionHeaderHeight = 0
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    private func layout() {
        view.backgroundColor = .systemGray5
        view.addSubview(tableView)

        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

//            groundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            groundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            groundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            groundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    //действие для тапа по аватару
    @objc private func headerViewGestureHandler(_ gestureRecognizer: UITapGestureRecognizer) {
        if gestureRecognizer.view is UIImageView {

            let scaledAvatar = ScaledPhoto()
            scaledAvatar.delegate = self
            self.view.addSubview(scaledAvatar)
            scaledAvatar.scaledImage.image = headerView.userPhotoImageView.image

            NSLayoutConstraint.activate([
                scaledAvatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scaledAvatar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])

            UIView.animateKeyframes(withDuration: 0.5, delay: 0) {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.4) {
                    scaledAvatar.backgroundColor = .black.withAlphaComponent(0.8)
                    scaledAvatar.scaledImage.transform = .identity
                    self.view.layoutIfNeeded()
                }
                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.5) {
                    scaledAvatar.cancelButton.alpha = 1
                }
            }
        }
    }

    func pressedButton(view: ScaledPhoto) {
        view.removeFromSuperview()
    }
}

extension ProfileViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return newPost.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as? PhotosTableViewCell
            cell?.customizeCell(photo: photo[indexPath.row])
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewPostCell.identifier, for: indexPath) as? NewPostCell
            cell?.setupCell(post: newPost[indexPath.row])
            cell?.delegate = self
            return cell ?? UITableViewCell()
        }
    }
}

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = ProfileHeaderView()

            //обработка тапа по аватару
            headerView.userPhotoImageView.isUserInteractionEnabled = true
            let headerViewTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.headerViewGestureHandler(_:)))
            headerViewTapRecognizer.delegate = self
            headerViewTapRecognizer.numberOfTouchesRequired = 1
            headerViewTapRecognizer.numberOfTapsRequired = 1
            headerView.userPhotoImageView.addGestureRecognizer(headerViewTapRecognizer)

            return headerView
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            if section == 0 {
                return UITableView.automaticDimension
            }
            return 0
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath.section == 0 {
                let gallery = PhotosViewController()
                self.navigationController?.pushViewController(gallery, animated: true)
        }

        if indexPath.section != 0 {
            var post = newPost[indexPath.row]
            let postDetailVC = PostDetailViewController()
            postDetailVC.setupVC(model: post)
            post.viewsCount += 1
            newPost[indexPath.row] = post
            tableView.reloadRows(at: [indexPath], with: .none) 
            navigationController?.pushViewController(postDetailVC, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print ("cell deleted")
            newPost.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension ProfileViewController: NewPostCellDelegate {
    func likeButtonAction(in cell: NewPostCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        newPost[indexPath.row].likesCount += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
