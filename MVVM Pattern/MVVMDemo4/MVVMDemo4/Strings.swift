//
//  Strings.swift
//  MVVMDemo
//
//  Created by Su Nguyen T. on 2/22/17.
//  Copyright © 2017 AsianTech Co., Ltd. All rights reserved.
//

import Foundation

class Strings {
	static let Warning = "Warning"
	static let Error = "Error"
	static let PasswordEmpty = "Password can't empty!"
	static let PasswordWrongFormat = "Password can't less than 6 characters!"
	static let PasswordWrong = "Username or password isn't true!"
	static let EmailEmpty = "Email can'n empty!"
	static let EmailWrongFormat = "Wrong format email!"
	static let AccountNotExist = "Account not exist!"
	//    static let APIToken = "3IHPZFJ0LWOKCHTHQMWAOZMX40VQV0S3PMZKNUMYZGHUP4WJ&v=20160524" //AC23AZTMHHF1RQY4BOT0CSUNIWAXJGROF4I4HNKBMOXSCFEW&v=20160718
	//    static let PrefixAPIPhoto = "https://api.foursquare.com/v2/venues/"
	//    static let SuffixAPIPhoto = "/photos?oauth_token="
	//    static let PrefixURL = "https://api.foursquare.com/v2/venues/explore?oauth_token="
	//    static let MiddleURL = "&ll=16.070531,108.224599&limit="
	//    static let SuffixURL = "&offset="
	
	
	static let PrefixAPIPhoto = "https://api.foursquare.com/v2/venues/"
	static let SuffixAPIPhoto = "/photos?&client_id=BPQMVDAIHO45WWSBEHTSCEZP45JT2GPKGKTPITJEFBDJRINC&client_secret=3LWA1WMRDH53ZJUTTEGO4MJUVLKNHH4KUMZFB3SQSOXYBZ0F&v=20160721"
	static let PrefixURL = "https://api.foursquare.com/v2/venues/explore?ll=16.070531,108.224599&client_id=BPQMVDAIHO45WWSBEHTSCEZP45JT2GPKGKTPITJEFBDJRINC&client_secret=3LWA1WMRDH53ZJUTTEGO4MJUVLKNHH4KUMZFB3SQSOXYBZ0F&v=20160721&limit="
	static let MiddleURL = "&ll=16.070531,108.224599&limit="
	static let SuffixURL = "&offset="
	//    //    https://api.foursquare.com/v2/venues/explore?ll=16.070531,108.224599&client_id=BPQMVDAIHO45WWSBEHTSCEZP45JT2GPKGKTPITJEFBDJRINC&client_secret=3LWA1WMRDH53ZJUTTEGO4MJUVLKNHH4KUMZFB3SQSOXYBZ0F&v=20160721&limit=3&offset=0
	//    //    https://api.foursquare.com/v2/venues/4d087c459232236a3b37be53/photos?&client_id=BPQMVDAIHO45WWSBEHTSCEZP45JT2GPKGKTPITJEFBDJRINC&client_secret=3LWA1WMRDH53ZJUTTEGO4MJUVLKNHH4KUMZFB3SQSOXYBZ0F&v=20160721
	
	static let url = "https://api.foursquare.com/v2/venues/explore?v=20170222&ll=16.070531,108.224599&client_id=J1G4TOY3HLH504HI42JQ3ACQTLYGOYZ4ARC2VBG3IE1DLTTX&client_secret=S1HWM5P0CJKJZICFHSHLQ4SVINTWZINKNGCNYXOZRAN1JC3X&limit=20&offset=0"
}
