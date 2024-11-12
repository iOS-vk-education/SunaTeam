//
//  TuistStrings + SunaTeam.swift
//  SunaTeam
//
//  Created by Sergei Biryukov on 13.11.2024.
//

import Foundation

enum RS {
    //StartScreen
    public static let startTitle = RS.tr("Localizable", "startTitle")
    public static let startSignInButton = RS.tr("Localizable", "startSignInButton")
    public static let startSignUpButton = RS.tr("Localizable", "startSignUpButton")
    
    //SignInScreen
    public static let signInBigTitle = RS.tr("Localizable", "signInBigTitle")
    public static let signInSmallTitle = RS.tr("Localizable", "signInSmallTitle")
    public static let signInEmail = RS.tr("Localizable", "signInEmail")
    public static let signInPassword = RS.tr("Localizable", "signInPassword")
    public static let signInButton = RS.tr("Localizable", "signInButton")
    public static let signInForgetPassword = RS.tr("Localizable", "signInForgetPassword")
    public static let signInNoAccount = RS.tr("Localizable", "signInNoAccount")
    public static let signUp = RS.tr("Localizable", "signUp")
    
    //SignUpScreen
    public static let signUpbigTitle = RS.tr("Localizable", "signUpbigTitle")
    public static let signUpsmallTitle = RS.tr("Localizable", "signUpsmallTitle")
    public static let signUpemail = RS.tr("Localizable", "signUpemail")
    public static let signUpName = RS.tr("Localizable", "signUpName")
    public static let signUpPassword = RS.tr("Localizable", "signUpPassword")
    public static let signUpButton = RS.tr("Localizable", "signUpButton")
    public static let signUphaveAccount = RS.tr("Localizable", "signUphaveAccount")
    public static let SignIn = RS.tr("Localizable", "SignIn")
}

private class BundleFinder {}

extension Foundation.Bundle {
static let module = Bundle(for: BundleFinder.self)
}

extension RS {
  private static func tr(_ table: String, _ key: String, _ args: any CVarArg...) -> String {
    let format = Bundle.module.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

