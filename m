Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F352D190C
	for <workflows@vger.kernel.org>; Fri, 14 Nov 2025 23:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162388; cv=fail; b=KjyrDw5XrhLLxLZeS4Y97grXu1bLAbm9ztGRlAZ20MQx10dTmWstn2nyZOQYx1qIDBcEF9KjoxZVEp/z94LwX0qUps4Q9XpVjqChuqwW9ER1jZbKBUsMmVLO74qfIoThxT9rSaP8rez+Fy/OyWD8XuHSTwFRE6zrdBglS26sx4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162388; c=relaxed/simple;
	bh=17riBmuIhbWG8gTdvfVGfPIy/fbIM6m4bVJhwVp7/Z8=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=Nq1YT51cP944o7o77KdR7f8lgnx2vLtQr1rJ8u02nobsCLupeJQKYZovqEDm0mJsycR/AydDqXzXFLAg5C3FLSUjCMVQq556oH/04NinVM1CNdB9lGwiPUUrbqiYSZKMSXIDEdArd+r79/pD8e8LLExRA1RIn5Tw/E//4/tcgY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OatsrYQR; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OatsrYQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763162386; x=1794698386;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=17riBmuIhbWG8gTdvfVGfPIy/fbIM6m4bVJhwVp7/Z8=;
  b=OatsrYQRwpjpgwaj+27IgkiICPndFDI0tYTpNekrEu6flvFHA331x0BH
   +IRskT8gJMSipynx61mk92tUyGWAD4ey9ieM8nzHIxLeMS/zNwqVG3eNz
   l+0wQwaibSQ1yIFZr3s2giLueDexIuFfMjlxt9lcUjQhh+hW5RPTGwP44
   DCvitCFw8DnlAPyDiT+BSA+cu81XVLzKoQ2gOJA/PI0YVfEoB5rt9ozI1
   Qbt0Soa6Pzj0IJGpbF4EiAig219SHuRUqoAWWDzGZbAQrgXfdeiOM/ucb
   U362Ktu5o10ZvQZ+Y3+KUnpOw8xfSei09Uu1euNDt7VGkUD4KYB/1mwNu
   A==;
X-CSE-ConnectionGUID: +ya8qjmuTlKtXF0Smv7Spg==
X-CSE-MsgGUID: PGfMNPPvS1K/fk4g5qJbng==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="64264713"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="64264713"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 15:19:43 -0800
X-CSE-ConnectionGUID: DAI4WwRdRyu5jmZ9jxitQQ==
X-CSE-MsgGUID: NI/LbzMiQPqiRGQusOmsSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="194337974"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 15:19:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 15:19:42 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 15:19:42 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 15:19:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhKLkXtHoj/9hXMpHl2cxsQ7+TMJ021k6ReG+hdwtvZIv9U3XhQfaLKGTSuIM4ytyuDhv2kW3mREfgTVKes7NtEeX/hiKa4oqYktKWFnzPUK4vKOA2I8j/JPvEET5p3LRQ+GLfPKyRfwZTwkAuPM5+fqJQ2NhunmxCchJY2aPNBUgLUMfZXuWxNjJIX5pakBZPZ8WGBraKO7cVnHEs6gKmeidTGQNnh0fTPZDmxv9FoOiE8dLyl4tZOLhi6rN6ymUUkOzFKbstxINqrUwY524/jWUXtcP532LkUZ+mYqRTI3Ft0SA0e1oxPtziUDkHPnDsWbf30bupeVqXI50Ww0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LyTZAVazSKc111+cYBRAabPTbyUTF9CB/Gb88fIvhI=;
 b=dAVt6vKgWvoRSz0gIukXATvdJTzIh+uf8vcQiXjqhsgy4vDFs0sYLkfq9zAk8rborImbgaDExgoguc92765j+E4NGgeXGVSfiSaNkbPjyTznZnmIR6G55CsQvwEUFDvCyzs3rCk0MsUxLs7bEAzLUAvBcyxzjdUOVPAhQA+mQLlyiTCq0J8n9QK7MJFEpF+kKSuJR2m5FSEd2TrlL0IDjiNY5Gas5GnLr8a5FHPoj/M0ftHSe3pwdGO1n4zP7Jiq9Iqr1kMicu1JXdhcxVJQKU29BxefsIwLijwcy2TbHmqvHERnzSqPNd22Fg9ciD9y4LeAOnQTzuO5fZRH9JAviw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DS0PR11MB7216.namprd11.prod.outlook.com (2603:10b6:8:11c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 23:19:40 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 23:19:39 +0000
From: <dan.j.williams@intel.com>
Date: Fri, 14 Nov 2025 15:19:38 -0800
To: Dave Hansen <dave.hansen@linux.intel.com>, <dave@sr71.net>
CC: Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, NeilBrown <neilb@ownmail.net>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, Dan Williams
	<dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>, Sasha Levin
	<sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka
	<vbabka@suse.cz>, <workflows@vger.kernel.org>, <ksummit@lists.linux.dev>
Message-ID: <6917b90a42b2d_101541002b@dwillia2-mobl4.notmuch>
In-Reply-To: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated
 content
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0161.namprd05.prod.outlook.com
 (2603:10b6:a03:339::16) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DS0PR11MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: af857c22-ce3b-4a8e-e0d9-08de23d448d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTZnNysvQXh5clZJMGIyMkN5Nkk5R1YwUVRYMHRvcDZxTnVqbkhYTzcyZ2ly?=
 =?utf-8?B?SUZnbHlpMzI1dGR5dklMdXVXaUQvSHZoWXRqTHRVa3piNlhhZk1JQW9KV28x?=
 =?utf-8?B?anFReDdMcElrdTZqb093TW5vaU1kdDk3ZURGNG94UmlDYnlPbE5kQkVCaGpy?=
 =?utf-8?B?SlBvUGNkMVQ0eU1TY1ZPcUUzSWNqUHdVSEROMW8rVDhuQnI0VE5rZ1RWMXdo?=
 =?utf-8?B?Q1N0ZHNqOXJBSi8weVZnYktrS0N5NjFYWEhUQjY0Yy9OLy9lSnJBTFBEUVFh?=
 =?utf-8?B?NzhkZjF1NTJIL0dQaVBMTGt4VnFZWkU1M1QwOEIrOEdWR0JMWFVSMzE4ZVdl?=
 =?utf-8?B?YThwbldYQ25PdURGc1JrcURZR01YeUdwY3RoN2NHSExUc25sd25VSDVkWUFW?=
 =?utf-8?B?TXNJZmVNZ3QyYlc2N3BkVHg0QktCN1hxQ1BaUXY3QmcxVTBnRDFwczJPUmxI?=
 =?utf-8?B?aTc5cUltS3NoV0hueFFnUmFGS21oYjZickRsQUplYVZ0VGNvZ1doZ0JPU0Jj?=
 =?utf-8?B?OG9hN0VBYlZFdG0xR3pXMmljUFdZSGl2cW03NHA5UkhiREFJWmgvcHF4RjUz?=
 =?utf-8?B?OTJFOERWUUUxQlRia3dPdTNwdTRLRE1wakQ4R29QaFpXREJ0TllSWm1sNVZH?=
 =?utf-8?B?bTRnOG44RWNlb0pBanp0eXg0djJUa1RXR0xjOWZzWnZVanpFRHFMWTJvdEo2?=
 =?utf-8?B?M253NDE5NGZwb2RzOWNJMk1neXpvRVhpc2tUNCttdmh5eEJVWVNTdFY3c2RE?=
 =?utf-8?B?U3FkclBMVUdoN1VpN0Z3eFg4RkpBbUhOWU9jeERYUTZhVytMd3pqeUl1MkVS?=
 =?utf-8?B?N1RabXpPSHkxQ21Tc3ZVdEZ4cjFUUVdVdzg0bXJBZzF6OXFPWEtsOG5xUTh1?=
 =?utf-8?B?TDdOMTBDWmNHczdoNlJWUHZlc2UraFlKa1l5TDdwdUZxRldwelNSQllEdmwr?=
 =?utf-8?B?R3BhcXExWVRhR0d5aHVkSGx1NXJOY2VZMVNPWXVPNW12OWZEQlQ0ajliOGpH?=
 =?utf-8?B?VFBqQjh2RVpUY09Ja3plZEVIaGtzRHpoQkpUMUZ6L1hSTHFDcm84R0dxN1FV?=
 =?utf-8?B?SDJ2NFBJdWRicmdDQytadkIzcUdoa1R2ZW5KeEtPbVhGN2ZvYjdyeEo0emYr?=
 =?utf-8?B?RVIwSnJMOTA1RTRuUzhDcTRrNzdtTGJkSzh3MWk1SWljbU1OaEU3UWVnUXI5?=
 =?utf-8?B?MVZQZ0s3N0d3bVZiLzVkVlhwOExVZUJhUjhLNUpCaHNzbmpwMEs4aXNOSjRu?=
 =?utf-8?B?ak5FazFxVjFjRlNxL3prN0U5aTd3bjNRVExzUjFhaHkybzJZWlg2MFN1M214?=
 =?utf-8?B?bkQzRDFYWi9MZ3RJR09KZStUdmlkK0F4VjhjQmtUa1BwdUd3aDdHU3VCUTBY?=
 =?utf-8?B?bnFHNDJmK0FBOElYcUMwcWpibURxQXZERUhodmlWcVVPL2U5NkNPa0F2Mlpo?=
 =?utf-8?B?dGFJZkt3ZFZXbUFpVWRISGFZUHJVZlhKaTg3Q3ZhMmNYTlA2S1NoQXQ3cnJM?=
 =?utf-8?B?TTVMYVljOEU1c1FGNXFQTWtjSFl3MGZKS3YzOWJmYWFpNFJoSFZydVhnblV4?=
 =?utf-8?B?WTRLbVhuTndqTHo1SEhEK1JTWFFtTk1CYVRLeDNreU9Pc29PZmtEVndTV0F6?=
 =?utf-8?B?Ujh2S2hxV3lldVVhb24wd01Ed0ZLQ1RqN3d3VFlxVExSZVU2UUV5eUI0Witu?=
 =?utf-8?B?Um1oRnhqWGhqS2UwSVYvMGpwRCttVkQ3VktBSHZOWHB2N3RrNXY2WWNERXR4?=
 =?utf-8?B?c1liTUJ5Vjd4M2h6Nk91bjNIZ3FMSFUvQ3lzVG9LcGc5bmZ5T0dvNU5oRUNH?=
 =?utf-8?B?NWdKMFRzUC8xNi9Nb0wvMXNVV3lOQXRTUmpOMmZ5cWJQRExvbDNnaUhDN2xo?=
 =?utf-8?B?L1NsQkttSUpKQi9LUG12WDdpOXFnYnV4MUFmVGEyekI2a3ZjNGZnMXVxTTMw?=
 =?utf-8?Q?JvPHaZVqDdt1/mfboW3a/RYt0Ze8QIqB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K05VQ0RFQ1dmREZwS05vQ1JUb0lzeCtOMXBLWEwzc2hQR2l5dm4vbllSeE83?=
 =?utf-8?B?T0J4TEdIazg1SUxIR1NyWmhnU0tEeS9jUjdZeU4rWG96Y21LT1pRdE1GUGFJ?=
 =?utf-8?B?MnZhRVpPRjYwUUhrbEo0Si8rcVF6TDk3akt5R1l6QVh4Q3ZJT2c3M1NUNlI1?=
 =?utf-8?B?WENTSkc1emRyeVpobk1mT1o2MHlDcTlxSVJNVEQ1U1FGRkJVc1lSZWR5Mmhv?=
 =?utf-8?B?Qyt4QXN2M1BVNDV3TTJtZkIrWHFveCtPU0RRaHJGMDcyL2RlNzBDQUZoemNO?=
 =?utf-8?B?UDZmWU4zckpnOWhHNTZmZEg0cW1teDlSZDBEdTd4clJHZXBmUEw0Vi9pbFpl?=
 =?utf-8?B?UmdMS0J1aDYxNENpR05IN2p4c1JvZXJQVHExMVNseW02c1JMSXQzRUtzc1RN?=
 =?utf-8?B?aEtXbkhtV1p1WFZ2bFFRZU9uR2NNZEVsZ0lNVituSGlRT2ZMRVFyYmtZT2VN?=
 =?utf-8?B?VWJ3VStORGgzUVBISW0wbzRlblpldjJERncrdGRNb011MFlKTmVsWU5Wcmpr?=
 =?utf-8?B?Z2dEeGtIWWUzY2pZMTUwVktCRWpxdFVVWWNNcjFhR1ROV2ZKZ2xtWkVBR3Zl?=
 =?utf-8?B?WkFzWm1SWHYrYlk1Szg1MjFNVzhEeWlwaFlFRVp5UnE5TExmSjFuMmhxK2gw?=
 =?utf-8?B?ZndobmFHMzdXei81N2I1Wk95WUowQUlxYUc5STArOEkrYUNJWjVoVUxnY3E1?=
 =?utf-8?B?TnovTTNTb1J6d1p3TzEwWi9YaEE4eDFPdC84d0ZaVGt0Qm8vMGJzeXRETTJw?=
 =?utf-8?B?YkhNWGJYazF5R2NnTXM2dURNS3dBZDF0b1lvTTZJSG13akFGVmUxMHBkSnV1?=
 =?utf-8?B?bFZkWmZIbjlvTzNCV1JqWFRSS3p0cytZWTVvR3Vlc2EyK3lxTEtvNXJBcUM4?=
 =?utf-8?B?TXBYTzUvVFFCUFdvcXBSblB6UGViMGNRb2dHL0NHSnE3SSt1NjdJZzcxc1dl?=
 =?utf-8?B?RU9QdFFqcU42cDRqZ2Q0NDhrODJxWjg4TThiMWl6TFdrcTlSaGc5L0R6RXR1?=
 =?utf-8?B?NUpxM1pLclZGblJISlBXL0xRZDZVUnltSHRLY0l1NEtxTVV4TU10OVgxMDlJ?=
 =?utf-8?B?WUo3UVNTa2VSd1FKNHFPazQrbUhPaXhPdDNVQW5RNnM5R1VHSHc1bGliaUlh?=
 =?utf-8?B?MWpaSlljSUxyaXRMTTBIZFBFcXNqM0JkaFFYZlZVZ0RQb0t3bG5ZeDV1QjhW?=
 =?utf-8?B?YkFGcHMrV0hycjN1LzRsOGUwRTlTUlI2T25qWkNFRUZKR0U2SkVJdHg5Y1M2?=
 =?utf-8?B?Z3NoU1ZMVTNWQ2F1c1JJeitlWXVuRlM4aWNqb3RJQ1JtYURHYWtxZmZKNGF4?=
 =?utf-8?B?RzRDK3YrOFVGMTFyZ0haY0xQOFltUHZjRUwwcjBoZ0Q1ampZdlpabGtydVVT?=
 =?utf-8?B?OVVXQ3Z1MTkwaGxFQnk0eXgwM2Q5R3FsMkhhRjJocjI5QkdwK1FYbGZPRk8v?=
 =?utf-8?B?bFJsZnpnMEFXWEwyaDgwQUpsY29pT3Y1dmRKQ21Jc2hiTEJldUk0NXRlWktm?=
 =?utf-8?B?M2tWSUgxSnh4QzNCcVNNUUtSakR0a3NnMzZ4L1lyUUVpV2tLY21rbjVHaFN2?=
 =?utf-8?B?WTBGMzNEa0N5emhLZ3VGYnBuSGIxUStuZ2NEYjVNbWl4ZmtmOXpUcmtWRldE?=
 =?utf-8?B?SlBIdHpaZmZHRm9JSUplcVBRMTdyNDYzQmQzK0R5cFMxWTNxR1VDdTJjMUUx?=
 =?utf-8?B?YmhxQWkrZnZzYkFtdHhFeG5LK2JSdHlrbVUzM1R1bDJkZTdLWi9MbkVOVkZW?=
 =?utf-8?B?WXBzdWRnejZLdC91TTBGNHFWM0tpMDR0emVjaGxBNU5VN2dyaWVZNnJ4ZWlF?=
 =?utf-8?B?NmhnL3MwSExOMThORDRMbVpWSTFpTWRxUWVCd3BMKzhwZnpCTnlxTEFINzNa?=
 =?utf-8?B?Z3pTM3ZlL0FMM1BjQ2ZmOUdxM0JSeDgyOU10eHlxZFd0QlRybmNJb0N2eEI0?=
 =?utf-8?B?Y3VTVzh3cWphaDZqK2hHSDNialVZbnN0SE81Q2hOdGs1a2ZjVEs4UW8wSDVO?=
 =?utf-8?B?dWxzeTM0SU1xNFBSMWkrMWRVNUdQc1dsS2xSaE5neENFSnF5STQrR1U5SC8y?=
 =?utf-8?B?TUNFTktsT24rSWpTUDg2eEhvM3VGSGhXVUFqd1lZeFFOaVJDT2o5Z3RSMitt?=
 =?utf-8?B?RGFjWHIxNjh6bDAvMURjMXNUUElyMGxCcnY0czFJaDRYVzlQUm8yWmNseUhE?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af857c22-ce3b-4a8e-e0d9-08de23d448d7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:19:39.6839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Obtw9EvS1iDUc1dtOiylXhLc7x+cbrNqoxuUZgEawjLZhCtdIHyVkhCZZWESRrNQD5EW+jipcOjb+CimEvRsV6djY1QgTYZUWFC40NJ1bSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7216
X-OriginatorOrg: intel.com

Dave Hansen wrote:
> In the last few years, the capabilities of coding tools have exploded.
> As those capabilities have expanded, contributors and maintainers have
> more and more questions about how and when to apply those
> capabilities.
> 
> Add new Documentation to guide contributors on how to best use kernel
> development tools, new and old.
> 
> Note, though, there are fundamentally no new or unique rules in this
> new document. It clarifies expectations that the kernel community has
> had for many years. For example, researchers are already asked to
> disclose the tools they use to find issues in
> Documentation/process/researcher-guidelines.rst. This new document
> just reiterates existing best practices for development tooling.
> 
> In short: Please show your work and make sure your contribution is
> easy to review.
> 
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Reviewed-by: Shuah Khan <shuah@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Cc: NeilBrown <neilb@ownmail.net>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Dan Williams <dan.j.williams@intel.com>

All my concerns have been addressed.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
