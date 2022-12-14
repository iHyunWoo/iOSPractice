//
//  UIViewController+.swift
//  YoutubeMusicWithCode
//
//  Created by 정현우 on 2022/12/26.
//

import Foundation
import UIKit
import SwiftUI

extension UIViewController {
	private struct Preview: UIViewControllerRepresentable {
			let viewController: UIViewController

			func makeUIViewController(context: Context) -> UIViewController {
				return viewController
			}

			func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
			}
		}

		func toPreview() -> some View {
			Preview(viewController: self)
		}
}
