Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A378A8287E;
	Thu, 26 Feb 2026 23:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772148268; cv=fail; b=XczmzqH2J7n+7rNWywnlUiFe1KmLESsLBfM3eznC5aic+Vkc8leOgJmwHjZfwypRPL8JRJVC0I93ys3PnTdJVGDOBKVLKkvAlwuIDcmWY2fTyTiwCcIqq/FWSLzflNpZMxnSaXqcZdrvS1gsI6Xsy3xXhiQze9vpyaxtWnNHSE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772148268; c=relaxed/simple;
	bh=j9ncKfCmJhzU2ZjQghst7hI1eXzfLm4TjlKHKAypakc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DJ/ulcZGZgaeobOn6u151mM4EwfV6EOiemxbAr8BB0UT7KuSuz9Psbc+7iHYYhCz9c1aGNVqU25oa3j4QVNGDduslII5NWGBtLqXaMyhNu5Mw1s3VkfXldVrFGEGB7OcyCU6qIc81O6VdKJl2IhmLdVKm4jIU7gHAAaJmn8aLMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoCHiZ/z; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoCHiZ/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772148267; x=1803684267;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=j9ncKfCmJhzU2ZjQghst7hI1eXzfLm4TjlKHKAypakc=;
  b=HoCHiZ/zvHLzB4lArsNEfKtBEP54jmqSBL8A300b7sguFAQKiW+fOkDL
   W+mY/330f/pVmIgNTr8aQk9iwyW+7dtCiNLmKE5uAQQlkZbY+/Gfjxxwx
   xYIV5Trv1deI0wjnOshPedK4TN+CvpUl/mDzbhqbDL35mpeCqysXArW1M
   Ks5Aatt+DVgpa1VPm1o5fn0iEjj9qqhKZFZeC56w4voXJnUbMazCWG1g9
   ebF4L9bE07Ka3QHMYfaYuf1jWED6rqzgUixKvq2j4l6+JnjPHafGN5UYt
   +J1F6WM4Aa8MFyhEy4UBvoQJ0XkwJl+XmbjgrYf+GmNWATd1jktu6DR48
   g==;
X-CSE-ConnectionGUID: bfkLzaLJSfmdN9APYcY/KQ==
X-CSE-MsgGUID: QVdqRFiSQv+C0UvIL2Wquw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77093363"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="77093363"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 15:24:26 -0800
X-CSE-ConnectionGUID: 01CxZSbaQRGT6V1/khqVDg==
X-CSE-MsgGUID: 6Wdm/VbYTc253Itg1vHLvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="214932071"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 15:24:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 15:24:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 15:24:25 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 15:24:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqL7GA5QVQKdAn50nuNaw1amZYI7ezKm1md7p6ZijLvULLWB5hS7qM7fOYi05CXGFgyqtgcDKkFl2efY7ZhIc1oTCqlhTz5a0E1U9hXwS7/xXA320OPfzFi8N0G8CVfpOaJ8ltkrAN7/vPrpWb7VyXCCKVIHLXsUR1sHipxNDdB+swr49Ogtfb21qc/OxoPPsKXPU8SN4mPGKMg8spQaS2QYEaM6/jsH/qKyX99+tHLN+2QXKjT3VSvMjJR+xcXDq28y36roCQqMWvu477mgZz3CI8gXHKnz3sMG4oRUjn5aiDsCFDzEM7Gynx8bS9RGfeqdLBzd27dPNHgb87xVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NToYvLaEQjma3ZSC4bOknJrKyqoYF94oPvHZeZVbUek=;
 b=k2nHRJJZLpkFZkbp601B2WgDpdiH3iN+rFxxS9AV3BJwKV0T3R/IBWNgJJuw+Hv8ufpGEnzWDol6DEx34ZAqg5JELFpfqPjGudf3WFXbp2DBx0UisfOV6+XiszmgTLcksFiqpZADK26gF884xwVWx3WdEVOac8N6dg225OF29vk2+M+Uu9lNATm9e+DvmI5UDQsDxAvAQLjRJC7/2Ie0WuvMrhaJNUZeVPXH59Lxt2LLjJfO6Rkrs6c43uoBaQCoOBhhq5BAOzjeBgqvxMwusgvc/3B/9XRVwUk+ZpYciVtLxbIJu4oXDNTrrvTtTeJXFcQZYimLKyuoSjXrUATG5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7579.namprd11.prod.outlook.com (2603:10b6:8:14d::5) by
 SA3PR11MB7656.namprd11.prod.outlook.com (2603:10b6:806:320::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.14; Thu, 26 Feb 2026 23:24:23 +0000
Received: from DS0PR11MB7579.namprd11.prod.outlook.com
 ([fe80::4199:4cb5:cf88:e79e]) by DS0PR11MB7579.namprd11.prod.outlook.com
 ([fe80::4199:4cb5:cf88:e79e%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 23:24:23 +0000
Message-ID: <429ce5f4-9734-4226-85e2-6b0c13dcaaa8@intel.com>
Date: Thu, 26 Feb 2026 15:24:21 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add short author date to Fixes tag
To: Steven Rostedt <rostedt@goodmis.org>, Alejandro Colomar <alx@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown
	<broonie@kernel.org>, Sasha Levin <sashal@kernel.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>, <Yeking@red54.com>, <kuba@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>, Andy Whitcroft
	<apw@canonical.com>, Joe Perches <joe@perches.com>, Dwaipayan Ray
	<dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, <workflows@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<tech-board-discuss@lists.linux.dev>, Andrew Lunn <andrew@lunn.ch>
References: <aZ4_sBIy8rOUL59Q@devuan> <20260225190630.1834f850@fedora>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20260225190630.1834f850@fedora>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To DS0PR11MB7579.namprd11.prod.outlook.com
 (2603:10b6:8:14d::5)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7579:EE_|SA3PR11MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a712b0e-e921-43ad-2080-08de758e2cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7142099003;
X-Microsoft-Antispam-Message-Info: 8g/Q98vSbmPn9347NAXna6bqD55cEX/7CCiPN9h9kCo4B69d4eKU3M2kwP0BSZ8/qpOK2nwFvAX2kFPqwaBIAYo010ps6uZL4MZJM+9+ZCysTu3rG6mMno8v8qd25spnIOEbGenmk32+vvK/Q4wsZaWvyiQTtcjTbiujJa44I+CJZ4Dj9XkCMFvVRy4sN8+3ECrf50m9NBg2uH7l6gAm+a/V42JMK2uaBi4x4kMhc3RpdhGdka2tKXmfLk1VKg6MvvhCOra8SO7R55WgamW87h6JcgGgO7gvlWS8q+UxcHn308mARQJJZL7JDHEvqDQQGsKjeGLLVH6cm6M1rHAWiLHkqEzO/JldNQzfRHqW28Aib/nxwpcbE2uLF0zVfsvBr7eDHqkdwV/rLn2e2G6J1JFbPJTaMiprCgvIzumZFw74vjnOWtNATWMryGbIthDgr9pPujZ59cUvezpzkj9DLmSsCDcwbTRy3mn42i04VEyAftOkMR3FGX08J/ql3vx8QTlbCYgWUQoQyFqrDsi0u5uaqu4ydW4txnSBjXIYVk5vYUN+6zH+2zfAOTha3qydTZljiDsvYulpv8QgFZ+soQuO+kKhGfFFGaj8HqqXMbffGCOn3SAknklnbcy5evZSkTfRmvmohiry7zNKLBLO2sDWvVEsGV+nJxrNorvhZkRjWQaaAy2Os9KF32zi0pTEbVOqaJ6kaeP6B05G/n0FG+z+ICD65xNfxdyw78avzTU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7579.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWNKbFEyREdIamZwcWZIOS9iSXNQU3NvaWxzT1dHSms1OEd2djFaT2FhSkZV?=
 =?utf-8?B?WlVZVHRqL0l5WFU4RU11YXBocks4VklwdEd2TkV0YXMrVHVWYWl0bkt6VkZL?=
 =?utf-8?B?cTJLeHdYaWRORm0zMHBXcXowa2dFb0pOTEhyYWtTemZqa05DN2wrc1NaN3Nx?=
 =?utf-8?B?aENFNjFrSFdkS2xtTXdXVjZlK2N3N1JWbXRvcGFuMWMyVDFkc084TmVDZlZu?=
 =?utf-8?B?c0NQRGlwV0RnUkI0R201UlhyMDJjNzdxdzByWW9VenRpdCtvZ3hNSXNHS0ox?=
 =?utf-8?B?dkczVitzRUdlM0loM05pd2lhYWxMZlJHTHRYQUhOK2xHMmhEMDZFdmRvTnhY?=
 =?utf-8?B?SHZKSExCOUhaQ3JqL0sxcXc0TXl4eFRvSStYVDBMRnZxdmtteXNTeGZPd05J?=
 =?utf-8?B?OS9qc0lzeHB0TjZGamdUanE2TThob05NaXFtWWIreE1xUnhwa253RjZRSWcx?=
 =?utf-8?B?OTdqRG1zZXNtTndzanNQMzhFNFh1VkR4SDZiWFh6dXVlMmZkUEtGaVdYS3o1?=
 =?utf-8?B?RU1FcTVhZ2gzcG9uNkF5SmZqNU9xclcxN3NlQUpMTmpQbzlBWTVOWTRIUXR1?=
 =?utf-8?B?ZWlRZjJxT2c1V0hvTmhxVEtlZUxTTUZtVFZYVEFhVUEyL1ozNERGZy8zc3d2?=
 =?utf-8?B?Tm5nR1lmcUJlalpLK3NSeGVwaXNDZUtXZW1kMC9YdUV0Zk56YzkxcjdaUWdo?=
 =?utf-8?B?WDd1aEpKd054blJXOTZpVHJ5Y0FIZVI2ZnNDL0wwVFpjZUtpYlMreUhmNmtk?=
 =?utf-8?B?b0xkWThSOWNqQTV1Y2Y4dVFJU2VydGI2cTIxOGJSZWQzaVg0dFVZeUlVZ3M5?=
 =?utf-8?B?eXFzNDhtcXVuRjM0TFFGMHhxbWw1SW5jeU5FVFFRMUhrZWM0bUtTZHF6cGVI?=
 =?utf-8?B?eVh0SjR0UVlSSzJxa1ZCS2E0ZGQ2dExSdTJ3WkVjcXc5dHBHdjhhOFczb0dI?=
 =?utf-8?B?QnFkejlwamlWSTNTWVE0ZmNvUEtidzd6NkpRZ1NudFFLYW5iNnJkZndBaU9t?=
 =?utf-8?B?NjN3VmFhUG5ZT2ZadEovZnlOdFdwTUZuT2RuWVVoZ1JEeUIzTUpvNXNIT2pK?=
 =?utf-8?B?a1dia2oweTR5YUE4Y2J0eUdQZXkrQllBcjYvakF3Z1NZaXo5TWV1a1QxSWxF?=
 =?utf-8?B?OWlwQkJUSnpnSmtFVGtBL2dVMFltTEdNM0wyVjF5WjFuRmJyOEdCN2NNUXlu?=
 =?utf-8?B?VHI4aE43RXB2UXNKRXZrbk5pNThueFBoTmlQczhkMVVvOFMwUkFvM0JLM2cr?=
 =?utf-8?B?OXF6cTNRYzFGalMwbHNhUm10K0NDOWFFUURtaTdVbVBQYWZvMklScFo0YWh4?=
 =?utf-8?B?Y3Z1TmNhMkRFUE5aVTRyS0VTNHg1S3ZDWUZVRFpBRFNhUkkxYUxQVjBxTi95?=
 =?utf-8?B?di9pV3k5QTFqSVNLUHZuSjlIbUZoVVNwNW1KK1RqaE16RVNwcVNpY1ZNbjJv?=
 =?utf-8?B?OXhXTWRUSndXc29KallPWGF6T0NGWjVlOWtlNEFESjFMb0RZdkFYQ2k1aVN1?=
 =?utf-8?B?Ri93K0I2dDVRc3lHOGZYZndNbVBCVEpQT0IyMmZyK1NJQTloN1BGUDUyQVJ4?=
 =?utf-8?B?UVZ0MzlzYUpLZ1ZWMFpqSkUvWmhER2FQZnpXay9hY2dwc2JaSk5rdnRJMXJI?=
 =?utf-8?B?dlRhandzU28wRXJ5YmVQMEo2TlBJN01kUHBvN0xkWDVaWEYzQjF3NlAvVTlL?=
 =?utf-8?B?ZG1SY3VKUHFWVW4vRGlmeW00SWhmL3Noc0RraW42YXdNOTJVSDByR0dscmNR?=
 =?utf-8?B?enN1Yjd4SjRGNEZtYmFvWTA0U2EvWDR4UmJNSjBBd09CZ2kwaWxlYldUS29Q?=
 =?utf-8?B?M2JJUDNQUTUzaTBaL1Vqb3RaNlh3TlNWWGZtUHFHaldmSmJwbktiSjlMRjNH?=
 =?utf-8?B?RCsxVGdsU2VZMjJsNzVsdVdmeGt2NGlnNGdSVnUwUGtpZUxUUkE5NDBhdnVo?=
 =?utf-8?B?bnFvMjZNVjEvUDhpOHJlVUErVGlibU1xeVhkTGVnRDJ3V2xVNmRnVjJkeGJy?=
 =?utf-8?B?aU1rWnlpcjEzWDhkaldodE9QaG4yWDJva0ptblVUNDUzeGtaV2dpVHV1RFdT?=
 =?utf-8?B?b1BwYmoyVDBRelgzUlJlSWVNU0o2Qk5oNENwSks1MEE2ei9tSkRLQm1tcGRq?=
 =?utf-8?B?OCtIQ0NLbW55WDltem4xM29ZY3d4L2pqU295NytZMXowK21hZklHMG9HNGpI?=
 =?utf-8?B?ZS9rTEFPd3c0RGNGd29IQ29Sd29WZ2Z4NlBxLzlxWm1JOWthSFBKT1M4WFZi?=
 =?utf-8?B?UFg3amQ4YTNGN0pSeERiWFBLZ1NPRTFsUkh5a01vRytSQW91YlN3R1lDSG94?=
 =?utf-8?B?Q3o3eHcvbCtqS2FhRllXTENya0xtWHBCTHB2SzIrblBEcHpCMUVhZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a712b0e-e921-43ad-2080-08de758e2cb3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 23:24:23.0292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUjCT3ZERMq8Z85fVzSsbRz+ZV0yUctH2siNEQ2LS4BHV39DNsqHTZBecinn0BKxTM9D94wKHouovgLIQ/kgATSE+sc3XKPabYKB3jZdENk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7656
X-OriginatorOrg: intel.com



On 2/25/2026 4:08 PM, Steven Rostedt wrote:
> On Wed, 25 Feb 2026 01:56:02 +0100
> Alejandro Colomar <alx@kernel.org> wrote:
> 
>> That uses hash+subject.  This may be not enough in some cases (see how
>> much subjects repeat, in the logs above).  And importantly, a fixes tag
> 
> Most of those repeats are merges. And people tend to use the same
> subject when they merge commits. The only time a Fixes is for a merge
> is if there was a merge conflict and it was done poorly.
> 
>> may become ambiguous *after* it has been written, so you can't predict
>> much.
>>
>> By having a commit date in the Fixes tag, you could even simplify the
>> script to just do a binary search in case of ambiguity.  Let's say I
>> want to find the following commit (arbitrarily taken from the first
>> Fixes tag I've found in my copy of linux.git):
>>
>> 	a2e459555c5f (2023-08-09; "shmem: stable directory offsets")
>>
>> We could find it, with a trivial command line.  We only even need two
>> characters of the hash:
>>
>> 	$ git log --oneline --after='2023-08-08' --before='2023-08-10' \
>> 	| grep ^a2;
>> 	a2e459555c5f shmem: stable directory offsets
> 
> Why not just git show a2e459555c5f? You're just worried because of
> conflicts? That happens so seldom doing a bit more work to find the
> task is less work than every developer adding a useless date in the tag.
> 
> Even if there are conflicts, git show shows you all the commits that conflict:
> 
>    (random example)
> 
> $ git show cbced
> error: short object ID cbced is ambiguous
> hint: The candidates are:
> hint:   cbced93894d1 commit 2026-02-02 - drm/amd/display: Set CRTC source for DAC using registers
> hint:   cbced0de1ae7 tree
> hint:   cbced35df940 tree
> hint:   cbced38b00f6 tree
> hint:   cbced53122ce tree
> hint:   cbced7856638 tree
> hint:   cbced88f5140 tree
> hint:   cbceda69074d tree
> hint:   cbcedadcc0f9 tree
> hint:   cbced8ff29d4 blob
> hint:   cbcedd7a684b blob
> 
> The above only has one with a subject.
> 
>>
>> No need for a huge script to disambiguate.  This is even typo-resistant,
>> as one could eventually find something that is similar enough, if one
>> had such a field with a typo (in any of the three fields).  You'd be
>> able to search by the other two fields, and two fields should be
>> _usually_ enough for disambiguating, and the third one could corroborate
>> the typo.
>>
>> So, what would you think of having the commit date in commit references
>> such as Fixes tags?
> 
> NAK. I really see no purpose for it, and just adds added noise to the
> Fixes tag. Seriously, your example above:
> 
>   	a2e459555c5f (2023-08-09; "shmem: stable directory offsets")
> 
> Looks horrible compared to:
> 
>   	a2e459555c5f ("shmem: stable directory offsets")
> 
> You are the first one to complain about needing a date here. Who else
> finds this useful in the kernel community? It really feels like it's a
> solution looking for a problem.
> 

Strictly speaking, I've asked about inserting the data before because 
this form:

   a2e459555c5f ("shmem: stable directory offsets", 2023-08-09)

is fairly common within the git development community, but I think that 
community has significantly less tooling around parsing the contents.

The arguments laid out here are pretty compelling that this has no value 
to the Kernel community. If you are worried about disambiguation, adding 
more characters to the hash is preferable (at one point 7 or 8 
characters was sufficient to provide uniqueness, but now we use 12 
characters).

Despite my original comments about liking the format with date, I also 
concur with everyone here that it doesn't make sense to change the 
format. I just modified my global alias and set one different for the 
git projects vs the Linux kernel project. That way my aliases 
(git-whatis and git-fixes) will generate the appropriate format for the 
given project.

Thanks,
Jake

> Sorry,
> 
> -- Steve
> 

