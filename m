Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D243A22A1E1;
	Wed,  7 Jan 2026 23:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767829843; cv=fail; b=TpmWg19u88WoVMJDtbWcGERoYautehG1TOELANrfb5oyFpQqwY/V1NYOncmNh87w27iiQhLP5jL3Asoq81fvONnfZXJU06VEOelrXqf3q75ZBONVnnkSfWxWhVvdFizblt7aggtHctVJMKvDcvO6dKZ/U9OH6vuS640sfuFtMtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767829843; c=relaxed/simple;
	bh=ESjYSfJ66AgeCmb+ZUuImalbDZfT/uyZ4LyN9TXPdDA=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=mB80ERPwkF9xxolPDj3kwt3030Mc3n5xEIbZkz8k18jzkrFU+kNOIszQ/xI19JGnsUf2TNL7FAJuqugdV3r4Z+52MlUNIkWcLpa7DYWbAxK6O7qMVKQFE4p6uaoupi6ogtZiLbk3u5/pKmg4xhd090I4aFdNjE0wLWt/1rOEDkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDxcGjpT; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDxcGjpT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767829842; x=1799365842;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=ESjYSfJ66AgeCmb+ZUuImalbDZfT/uyZ4LyN9TXPdDA=;
  b=jDxcGjpTalqNnEhsFdmrtub8gs0xgykTo4ti3zc7KQN57EBYAInoc9bN
   R9fLTydnZy00LDD9FZPTTyCKVhuSZzwYWcHsprqGo/jWHRP/LVKJe4QFd
   pBEVbO5y66r2oYTTkY2p6QZJFogQY61UJT8Hi1GjeurSLveDfy0TjegHx
   O3gLcnhX1grG5vnnVUaqx22gNbHsti33hEoUye0LuVvyNR7grN97uvnLA
   BGfsy9X9Nflheny9AjA8jqyZkDyMD0a3oD/Fp+e+KVBPCyU+ix9I67Phm
   moDRir0FSr4qOkUS8Nkkc5vAngxkDNopgHMyPxzd9VnNUXrj66S0iIH5a
   A==;
X-CSE-ConnectionGUID: 3XZTiJdTSsiDbF1+rFdvwQ==
X-CSE-MsgGUID: GVJIpyu1S3uQ0HcebeSvfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="94673476"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="94673476"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 15:50:41 -0800
X-CSE-ConnectionGUID: YByGSmNqROetcpHlp2O9wA==
X-CSE-MsgGUID: kr1LpqbuQH+jHKuqZkqHKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="203072512"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 15:50:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 15:50:40 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 15:50:40 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 15:50:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esknyQpKsruHxeB6jxZEx3ryGRo+PG30G63scDow/Ubxl5CC+CWrC+vPpNDk49MPPtggF8VTf+O165owad9YYyEjwtfjKBbI2+m5Yp1ae3FhhsRE6vg2H7VmCOa2nW1qZe99V8jgg9yEwP5AM+px5xxXOHaOYOLTOFOTJRaxfKdv0J8CpCs4PHJO5shNnYGKQrUL+AUV1EinkH8DVbZvL8yN9dUcLJKef6nDsNhd0hWssDENZpKhABm59zX3VDgjfXKk3hnviqrD2fAW+py+jfWqe5tnPxjBx2nweBL4DJ8x2gMdyxEppQiVtf0WmahURUOiG7sC8hjpljL292+zCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDfYFZoZwTNNvkJ9i3X7BP+9j+Nip36rB7Cc/LUC9So=;
 b=w/DJ7JLssnYTLkmBF8XFHfHUKXZrKTPVJLY5UKMHb9m+vVuOy0YyOC8c6o1KGoGP1VgSr+RXVnCQUDr/gO5EU1w44W4GBpc6Rr810xxcMinq/DPq9c7xPfm33jCIu+TWdsC/+fniw7L6AMHDdWxo51cWCvcvsjvL+InlNmy6AhyqqLfIxww/j95HxgdPN2CzNTF9J/nrsN+xkY6/w+8p4araJIebZJn5motfhCrS+PRy3px+bPKlG3ZkiIRVIbfAYTQO1xlm77EfzLkA45KYXC6EOr/V0WglEgZYuaczu0+RhB2l6q4o1WpMGervmAG4wpI2FlkyJhJz4/lMvpCp8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 23:50:32 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 23:50:32 +0000
From: <dan.j.williams@intel.com>
Date: Wed, 7 Jan 2026 15:50:30 -0800
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dave Hansen <dave@sr71.net>
CC: Dave Hansen <dave.hansen@linux.intel.com>, <linux-kernel@vger.kernel.org>,
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, "Dan
 Williams" <dan.j.williams@intel.com>, Steven Rostedt <rostedt@goodmis.org>,
	NeilBrown <neilb@ownmail.net>, Theodore Ts'o <tytso@mit.edu>, Sasha Levin
	<sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka
	<vbabka@suse.cz>, <workflows@vger.kernel.org>, <ksummit@lists.linux.dev>
Message-ID: <695ef146d651b_4b7a1002a@dwillia2-mobl4.notmuch>
In-Reply-To: <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated
 content
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0009.namprd08.prod.outlook.com
 (2603:10b6:a03:100::22) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: ec34a372-321a-4d85-912f-08de4e478b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGs4azdwckVIZkVWTDh0WnlrM2IyRUxzNWJoY0VlNUl4RFA1RTNuNDdveVhp?=
 =?utf-8?B?eDJ6aGd4ajQvaUdkQmxtMVRzWk5ncFRQdXlGUkkvU2Z5REZkWTVGYzdid2Vm?=
 =?utf-8?B?TXFqUytQWGxQRENvQytyaGR5aExFeDBTdkNISmN3b2ZtM1NTSXFFVllhVkZU?=
 =?utf-8?B?MnlvQWRqV0FMcFBjbnhLY291TVJzWXh5UzhDa3NrSnpiT05XWmlpSDkxdFZp?=
 =?utf-8?B?TitCbGJlZmt6T0c5ZGViS3hQS1ExM2pKdG0rRDVudHFLcXMzeEN3Z1hITVYv?=
 =?utf-8?B?TU9sRzFlY1dqUmwxUGdKQ0E4eDd2YkJsSXd6Wm5XczFZVFdJNlYvQTJIWkpQ?=
 =?utf-8?B?SysyWW50ZzlEd0VqbUhDRVNzSUlpQ0xsQko5VW4wekk4V1NxQjdidW12bmo4?=
 =?utf-8?B?alRNLzlFeXZXcnVHVDBERVdBVkhLN3QvazFPcnlsV2wzaVQ2em9wdlROTkFC?=
 =?utf-8?B?aVRoYXpWNGRDUWFvRGsxUDR0S3EvWXpOMXBHWG5yVXdCZkFZMU5VcFpWTFE3?=
 =?utf-8?B?bHZpQlA3aHBnMUhYS2E2MlZFZlZrdElJa29mTkZud2lQbzd5b1FVTEhKcFRR?=
 =?utf-8?B?Tm5vWTBGamRMQlR4MVdtUDVOajkvNGlSa0d0SnFVRkIycGtFT3pucVhVU3JV?=
 =?utf-8?B?ZG9pVk9ER0E1cGZIV3YyN0txK0J1N0lFeU9sdjJub2xZcDhNNVU5YnluTFFF?=
 =?utf-8?B?SkM0ZkpHNEU0cVZvNHY2ejJlaFZwV3p5WEFTQjB4Z2ZCNFR3Qzk2b2NsWkRp?=
 =?utf-8?B?NkIyOHhIY1JkNnlram1wTG0yNHY4MEZZUGhBMi9JdmV6OEREeUszNStVNElQ?=
 =?utf-8?B?dTVlZEM3eENvQ09OM3R0M2tBVys2R3hXYmtib0xIQVRkMm1QVzE1RWI3MGxh?=
 =?utf-8?B?ZzdnYjBUZ2FLdE9kNGxRTUphTzdzbitXSVhQdUlWR0xOaE5xRXhZNFkrZHdQ?=
 =?utf-8?B?Zys5Z2NnajVOay9ZRFp2ZEhHSXAvbksyM1k2eWZkR0x6bnhMSXVJSTNvUEVE?=
 =?utf-8?B?emlEdTNqVlBOd3o3cUdwZTh3b1I0eGZ6TmhhQ0ZIL3YvcFFwMFhQRXZ2MFVG?=
 =?utf-8?B?US9DZVFSK00wOVBPTzZ3T2s1R1RodFpnWkpoYjYvV0VuQ3B6SFNrQ0lRaWJH?=
 =?utf-8?B?TnpJYk5CK3JFK3ZFOGZnTkVRdnllN01NVEFlTEZZb0VTRnB6M1BQaHdKNi90?=
 =?utf-8?B?N1lvUXFBUldXNGVNY2ZJekN2bFFwL1ZmOVB2c0VIOU4zQWkrZHpEZ0N1UUdl?=
 =?utf-8?B?SW91T0ErUVE4YnpLQmN6dzV5UFNna0FrZjhFK1BmYUJVazBIVWFmTjRvOXBu?=
 =?utf-8?B?dk5tL2QzY1JybWl5aWlZdHdObnVjTFBOR1c1NkE1V05PMkliRkVGaW9Sd2Fh?=
 =?utf-8?B?MWxMb3pUWjdxL3VjdUp3dEwwNEZ4dS9SdVkxNE94Szh0WElnVFB6TkZaMDQ1?=
 =?utf-8?B?NUdMY1dJSkhnbmgrWXVmb3VTMi9WR3pkTzdiWWlDaE9MdWh5elZGSUM2SXJr?=
 =?utf-8?B?b2pXK2YzK2RCYU9MVURETGdBa0NQU3NxZW9KNHRYYk1ad1F2NTNvYUpuWm9P?=
 =?utf-8?B?d0RYbWdjaUI4L2htM21OOUcrMlFic3I3NWJwNHluVXNFRDl0bUVFSWxrUVRn?=
 =?utf-8?B?bGFxMGhkVFdxMFg3Zk1UMm5ad1o1RXZLTjI0NnpDbCtpZ21OVjNNUTBGdGI2?=
 =?utf-8?B?SnRCbFlKTXVKVmpQOFBFQ0YyTkxyOE9GUFdXUUwrcTFxZjVub1YrSDlzV2Fv?=
 =?utf-8?B?elFGdk03RDR6L0JVQjh0ejVrZmpyQmVTVUF0bnhWcmFZQy9DWStJb2ZBUjFU?=
 =?utf-8?B?TXQxVkdLa3QwRll2M2FvVW1RTGVScUlNeVBYU1pqSldOdnd6U1dXQXBMenRt?=
 =?utf-8?B?aHZQSEpBWUdyZGh5OFpCNDZ0MVUrY3R1NFFlaW1SM0FTUm83UURKYXl3bmlC?=
 =?utf-8?Q?vzekbcThvojGYcOaJw3R7KuYMIHzQJOW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2NPbTZLZnRMaEVPcld1N0tVZ3cwNDBCWnYySXlxWHFzNE5HWWIrUGhBU3o3?=
 =?utf-8?B?Szd2bThIUC95S3pWdngzaUlpMzZTSFNhMUhhZFBHTVNPZ1l6dXg1NUpsaUQv?=
 =?utf-8?B?NU03UVRTeVVpdG5zMlI5bmpjaXJEU1U5K3p4bTZkcWcvbkJLYnRwZmJIR3dU?=
 =?utf-8?B?WncwZ0k3ZlVoQksxc3NPV3B6RGEycllxODhkdTdEeUI3bWtiQXZsM0RhVUlZ?=
 =?utf-8?B?elBjY3cxZHZkUmVjSTJnS2JzQkdwT2ZlUFRCMDEwTEdHV3NSemNsSXJldnl1?=
 =?utf-8?B?RXhaZlY2S3cwYVJOc2M1THdoUm9pcEkzalpoeVFpTGxWNGhtSHBRNU85Mklj?=
 =?utf-8?B?RDRteFFETXpvNXRzZ09HRndtUGZpa2xPai9jaTIvdnN6aXd2L1Evc3gzcTVx?=
 =?utf-8?B?ZkQ2VnE2cDFHa0V2enJJTEo1cXFvamYrQ1dZK2tnWHMzS25wT21Ra0x6Z1o1?=
 =?utf-8?B?cFBScU1CNlhvdnNHQ3dqdU5QdERmTjhhbWJrbHIrWjhLWGljZjVqQXhKZnM5?=
 =?utf-8?B?c1BFSWliVzhEa2JlVDJCMGltZ0I5bnRUZU5OcEJqRC9tRmozUWVQYzZtQ3Ux?=
 =?utf-8?B?d0dRVjVRQm1jVi8wWkFoNjQ1dHAyUllUMzlBWmZrNHByV1c5RUVTTkpEeTZj?=
 =?utf-8?B?Q2NGTWoyZ1VzcHBzajR3RU1UNXZXMzZKaWVmVW13RE9uZWp6MnVXY2F5RnVy?=
 =?utf-8?B?S1Q3R0xOR2d1a0tnTndGOEZYSVJyYXZBc3BvNURRNEcxV1RZYVAvcWg1TEVI?=
 =?utf-8?B?TDF6WTNXYmxSMy9ZYUprOGN5WHBaTEhObzZmNFZKSm94ODJiejRzeTNaZGkw?=
 =?utf-8?B?N1dTaElVU3ordWJtY3dKallRbXhNWlgwaUl6bWdCb2FHL2dtQndhR3AwN291?=
 =?utf-8?B?Q2lvd1hhNFFwaEt4RzdKTmMwUzVRWERQNVdvMWFIc1BEcTM5YmpsRHZOVXNa?=
 =?utf-8?B?S0ljR1cxbUt1bFFmQkZGVXI4VXFhem9uamtudDMveFVneERXVzRxRmd0dTBH?=
 =?utf-8?B?OVBzZFJleE1zMWQvQjRsRzhyOURGZVlGcmdrZ2xKYW8yc0gxYzVkdXl5bWdE?=
 =?utf-8?B?dmswWWZxWjBKR2w2TTZRQzE3aDVKMDkzajVaUzlTcnVHUnZvSTZvTitQa2VX?=
 =?utf-8?B?QXI3QnpVZVN2SStCczdDZnJVQmtPQ0JsdWkwSzFYd2NmZFVHTldBSG9mK2Nq?=
 =?utf-8?B?RlhJazRtc1cvdWkyS1NIYi9iRFViV2oxczluUmdEQ1NncG1qRGIvS1Q2R2NL?=
 =?utf-8?B?U0JSbW5IWVdQRUo5N0RoK0d2ZlhkcGNRTkJYaXZXc2F3bGFENmFHdWpBTG8y?=
 =?utf-8?B?bXEyTXMyMVc4c0FWWFlZQ3c1UUt0MVA4N0VYWmh5RUlQd2FObmdsaWlnYXBt?=
 =?utf-8?B?ZURYT0JhOEZ5eXVGd1Y3MnZMRDNRRG11V1FmQTg1ZjdVK2d2dGNzL2pHMG9s?=
 =?utf-8?B?Sm41TmlJNzRyVHN5c1dFMnp5U1pycXJiQWZpQ3VjenAxejl5dUd4WlllWjM4?=
 =?utf-8?B?bkxYYlFKMDFNdm5FOEdSSHd5aTFYTEtLYVMwRExNQmlFUlhOM0dBb0JaOGhG?=
 =?utf-8?B?Y1AyeXhIQkNkZEpLQVNkRTkzSVdBclcrY1ovcXU4b1k1VXVxb2lGV0dIWkdX?=
 =?utf-8?B?TllMSDEwSDNrd1BBS0VUSjhhRyt0cEZLM3N5Y0p1TFpEcFVxY1dNWTBMUmNh?=
 =?utf-8?B?VXhqNUF2LzFqdExlK1ZZdklHbnRMV0RJWmRZV2lUMkhwS3JnUXNPS1RKMjZz?=
 =?utf-8?B?Q2pRd1M2Nk9iVE1ZR2pQK2NMZlAyYWdFb3lHUWw5OEcrd25zNHlGTlVzU1ZN?=
 =?utf-8?B?RWwxYnpaV2oreUJvK2IyenIveWlPaFIwdk81N3YxVnVma0doOW1SN2dpMU54?=
 =?utf-8?B?eDRaMllGKzhmTEJQdXVHN3JXQUxNS1lzWGtuTktCcVR0RWJGZVo5ZXA0ZkVM?=
 =?utf-8?B?Tk9ROUVla0tQNjNoTlpyQVZWOUZCYlUzTzgyVUZhd3lCVXdzTUZ2ZnlTeTBY?=
 =?utf-8?B?NGNkWVdVNnhleURuamoycS84NmtFUXdEYmRvbzV0L2t5N2xqUmJteEdsWGtr?=
 =?utf-8?B?TG9IU2lQd0N5cXZTRjczWlk2Tk9CZCtSNjk3MXNrNWFrb3VOVUR6M3JrM1Mv?=
 =?utf-8?B?Q1YyaC8zNDFiYk5SbnRTSXVwMmhxdUVrVHhDcjI2MzVDM3pCWHdsYlVGR3Fp?=
 =?utf-8?B?b3ZWaXZYS1JMcTkwSUdaVVZOTjBwQ1N0akF0UzV0QUowbDUrazZwTmR4M2Zy?=
 =?utf-8?B?OElPZXY5aVV0bitnb2NRLzhhK1hnNy9yQWpTeWR1Ry9jVW5VM2Z4U0llZUxU?=
 =?utf-8?B?eXJKNnhMczVTOVc2OGMxakVEVGE1WFh6MFF6aWhKNzdvWmIwT3hRNE9lRkdv?=
 =?utf-8?Q?2puBIQTXDbdZrIBA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec34a372-321a-4d85-912f-08de4e478b98
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 23:50:32.6763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIPsjQTiwvETHTxQsW7EVQLwSi+yRkqnA2idra8xoBGsvBq9uYJ3I/zAwWkK+n9MpDcqqruO4/n8WTmkAlUbli8H/EWBhh+GVg4blW6HYlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
X-OriginatorOrg: intel.com

Lorenzo Stoakes wrote:
[..]
> And it's not like I'm asking for much, I'm not asking you to rewrite the
> document, or take an entirely different approach, I'm just saying that we
> should highlight that :
> 
> 1. LLMs _allow you to send patches end-to-end without expertise_.
> 
> 2. As a result, even though the community (rightly) strongly disapproves of
>    blanket dismissals of series, if we suspect AI slop [I think it's useful
>    to actually use that term], maintains can reject it out of hand.
> 
> Point 2 is absolutely a new thing in my view.

I worry what this sentiment does to the health of the project. Is
"hunting for slop" really what we want to be doing? When the accusation
is false, what then?

If the goal of the wording change is to give cover and license for that
kind of activity, I have a hard time seeing that as good for the
project.

It has always been the case that problematic submitters put stress on
maintainer bandwidth. Having a name for one class of potential
maintainer stress in a process document does not advance the status quo.

A maintainer is trusted to maintain the code and have always been able
to give feedback of "I don't like it, leaves a bad taste", "I don't
trust it does what it claims", or "I don't trust you, $submitter, to be
able to maintain the implications of this proposal long term". That
feedback is not strictly technical, but it is more actionable than "this
is AI slop".
