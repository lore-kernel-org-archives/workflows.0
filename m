Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602EB1C27;
	Sat, 11 Jan 2025 00:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736554902; cv=fail; b=d+lGyRmVR3c1MUYIP5ZErnsvBm1FO9e0gC0sRyvmIhSzMzOo4RNoe/RBz1t17blx+duIbUGrsZSXD6jsfudltv/6UPnw6Wwimzbkj3eGtwSG4FVMqLYBv626YVm4+AadkHU6v7DJLlI2T8OAsufM1rmrLTBo51E1vcRZR9xBmoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736554902; c=relaxed/simple;
	bh=juMdQtcCktZ31hCGgQPVGQGEax0a8XjB9k07ElMj0Ig=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LORY/FKaJh4nmsfcGLBueyRPoOWcZozj4+8N3TwjgoVY2rCyfp0yk/YAprEdpu4Tp+44UlWTz72kzfqjFnnvAm3vtvXOyo2L36cVjd5sVwZ/R0nngj//I1mDHUzYQAjB9SEpcA76C0G+b6h3HM9dQgWAs6qQAiy7UAI5qEYWkos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgK8MXjz; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgK8MXjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736554900; x=1768090900;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=juMdQtcCktZ31hCGgQPVGQGEax0a8XjB9k07ElMj0Ig=;
  b=RgK8MXjzgajKxYMPYq1a0PQkghZitU75PgsIZ/xQJmM6gUaLOYG1DLmR
   gXUQ0OdtUPPWzEuJfY25AhzinUy9jnGH43garHlTKfUVTBuNA9Z9sKM7m
   +ICatITYQIntyiLmzD16/jfC95W5ytmkerjrbnZZWFjnZSiUSSQB2K2pH
   xhDv/d77G7xXkyCB04uQVzAigXUyKynM3mbd0IjGicyrF23xSaT5cVejW
   RyxqFpkorINeJJYqKA/Mql+OSfxO/2hsGe9D/of8UVSmuZIgojcdokrFY
   Lk+X6197IVTueB+wZRD+4M2nP8DUb6PXK0AvPh723uxnXdi2dL0//k91Y
   A==;
X-CSE-ConnectionGUID: EJfPT1j5SNCPjBE2hLgCfg==
X-CSE-MsgGUID: +sTM3BBCRHOwRg8LMRrbRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="37023609"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="37023609"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 16:21:40 -0800
X-CSE-ConnectionGUID: 85qUeQhKSsCFXQpVqBVcbQ==
X-CSE-MsgGUID: MsIzhr6nShSjUwzyb0sfGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108983554"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jan 2025 16:21:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 10 Jan 2025 16:21:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 10 Jan 2025 16:21:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 10 Jan 2025 16:21:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGe8/81AAGX8ZVuJ5ugcOUesyTMiglW9NwJdoQDYb094u0Nk3q7Vd5L9hfoPGYhJ7Knykm4VVAACXQ51IkLkBXET0HnVPx7pCKjPhmDk3Vm1hfApshsSWwnRGnCCsPI/F9czkBmLXMOt67cPKV7htew406X+MIts1QDBw4crgoMZ6VvQBovB14yoI6RufOpvr5UFKRbsuk8VE7S19sGNypJU64yupcn7tdElZ5K1c1b3MkS9Jth+rNZOVBWEZqGmPwWJZFEmxy6Wa/BAAKvQcyD/pMop8Hhh5w+f/+U5pEgDgen599ZoUY8/g7aQhkODDEQGGkDykI07Jee/U/ORcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAdDmTV6J1kYvUZyK1971Lh7NgoVBIPMG7UHi2hpKkc=;
 b=XA2C0Guv86ii7/V1nqdPnQV7B68lhGn63oQ1q5DIh3zn3D+4cuZv5m0Q6iEUDRLPqdIEWk2UTmfiSDsV0DzqzkT0uR00jQAKpUzBdseWppsiHszR69MrDqpWUOQjGNebezCKiVIsDupG8AlvRSoErVxwZzFlWUms7C3jFTfxXotpOhH2EAAFECM1gLVtR6BmtjbANhq5kZznYiyQ1xGZZQbiXQoSU7U/96BRELCj+5XciGZFjmws/4OGNSd+JikpQHK5wIGNADyskoctvAZsxEj8UnnkTbd4uTOu0vcHNIeCuDg2BxZl9Mtu24kjXZH+aOaLb22pzA7BwWSac1rbLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by CYXPR11MB8661.namprd11.prod.outlook.com (2603:10b6:930:e4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Sat, 11 Jan
 2025 00:21:37 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%5]) with mapi id 15.20.8335.012; Sat, 11 Jan 2025
 00:21:37 +0000
Message-ID: <52541f79-ba1c-49c9-a576-45c3472d1c79@intel.com>
Date: Fri, 10 Jan 2025 16:21:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add short author date to Fixes tag
To: Steven Rostedt <rostedt@goodmis.org>, <Yeking@Red54.com>
CC: <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o
	<tytso@mit.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Andy
 Whitcroft" <apw@canonical.com>, Joe Perches <joe@perches.com>, Dwaipayan Ray
	<dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, <workflows@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<tech-board-discuss@lists.linux.dev>
References: <tencent_6CF6E720909156A227D23AE8CFE4F9BA5D05@qq.com>
 <tencent_F8CFC8ED723F6E8103B4AF3D98D63D7F1F08@qq.com>
 <20250110080331.04645768@gandalf.local.home>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20250110080331.04645768@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:a03:333::16) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|CYXPR11MB8661:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c7b113-83b4-45af-3a8c-08dd31d5e9a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1VXTEFvdGtJTm1yT3pqbTEzL0FuYjh6WkdVRnFuWGdxaFp0aFdJVXlZa3Ur?=
 =?utf-8?B?cWxHMEZzdGlLWXhvbUJQV0NSY3pZdVRxU2MwRTl1eEU4RVpxUGtGckFEU2E4?=
 =?utf-8?B?dyt0Tzc5b1dQRkZGcnJDWkdRcVpIVkgvSkgvQ09acisxcjJrTzdCbDFLcGFQ?=
 =?utf-8?B?OXFvUHJ4OWJaMmNHbHdhSmN6OE5tTTRQSy8zUTh0T1FNWTYwbU9nU0E2TTZX?=
 =?utf-8?B?bi9PbEVmOFhmYm1xSnUxZUZ6VVJYd1A4eHdCVlBKOWRJc0puWDNPaUZzcG1I?=
 =?utf-8?B?WkJDREZwNjJac0J0ajR2blhXZlp6Zm9ldVdjektiaEdKZ2pUWlBoZ29SbGcy?=
 =?utf-8?B?VXZVRVVBUEdDeGNIUzZMbXdkQVFiRWdGMTBvenFTTjlpMXJ4SEZnd21iS3ov?=
 =?utf-8?B?MXQwUVh0ZUxFMmJ4RWJHUUdCMFBhMk1zcGRxZTZQZ0R5dlk5MmFocVBObm1W?=
 =?utf-8?B?WTNQZnFkbkFYUmVXcUZRc1Y2VlBXNDhYQ0dUekVUZit3SGlFa1JNZEZWWXVq?=
 =?utf-8?B?SFJYZm9tUG1iVDY3bjRURUxiQTVoNWRhSHNNSFU0a3ZyOVVHKzRPZStxejZ0?=
 =?utf-8?B?R255R1I0NEFQZW45RFByRWlPeUlUS1JBSFB5YXZoR2d3RkFkNHFnWUhSR20x?=
 =?utf-8?B?SVQ2V1ZMcmVTeThoM1dlQ3hQZGVkR0g0cnZQTmdUSWl0d0QrRU9OT05jWU8v?=
 =?utf-8?B?MzM4S1BkV3E4azRNUW54QUlyem1qcENmUi80Nlo3dU9RTlBpVS83M2swSHFa?=
 =?utf-8?B?bnV3RDV5d2sraWJsd2NaQ1V3bE5HSloxOW1nTEZEWnN3OWtIK1RPSHBkSFNn?=
 =?utf-8?B?V09tcVVTK3B3TVlub3RBYmZXYTAxaXhoWVo2UWRNeU44ZDZkd2s2Q2xlUzVh?=
 =?utf-8?B?ZXBlQlF1akUyU2dIRUJuTW1aODl1OXMwSzNzQzFjSlNCYm5PYXVxV1EydmpU?=
 =?utf-8?B?VlFWQjgxTGVqUXJCTGo1dncwU1FCNFUzRmxiamhiSEpTbW9YcVhwblQvTGkx?=
 =?utf-8?B?YmErbHJPM0VDcUtPeGhlTnpvZS9qZ1JOTVZYUTB4eGJPREdTejhlOWc3L29u?=
 =?utf-8?B?VXc4TWFmSVJiSVJYSXAvaEYvNTl4MEpydDdFeEhvRHVRVXpqTWFEU0FSNTFI?=
 =?utf-8?B?WjMyUG9XbEdVZFkzbTdyRVd6WmliU2gybE1LOWJMelhua3piN1BLTUNTTkdP?=
 =?utf-8?B?NGNkZTJPSjgvQVdCYkZWd1h6NG5hMlB6eFJiNjJ1alZ1b09YbHlhSmFjS012?=
 =?utf-8?B?NzRmeWsxUm5DUnptWS9aaE94NVpnMmtCdXB4WmJEaVZuVklGZnVacERTcExN?=
 =?utf-8?B?dC9Ec1hZNUk0WGUyU0tzRDdsNnowZE1BWGlCMTRVc1Q3WVplSHlOaUxqN0pt?=
 =?utf-8?B?dEp1US8vaE9IZGMzTTRjM001VyswcUNzTlBybXdtajRQeGliN1NSTUZKNDN2?=
 =?utf-8?B?eUR3MFlhZ2hDcDk2VGxPQ1FPaHdteVBqZGtXMGo4aEQycjhvaHl1VGxUSlhx?=
 =?utf-8?B?VzMxMUVXMHN3aGw3WkN1UW1SZ1oxM1p2VmRJcGpjK2xjNjA2M0JvU2VLNy9D?=
 =?utf-8?B?SG8vSDUxZmdPc0pVSUFDR3pVTzNBNHB4NVo1bHNyK0hTMXFGdDhSUFhEMkNP?=
 =?utf-8?B?amoyejA0U2tQdStyZ2lJQVZsUmt4elg0cUFxbWRLU3BqcXllMTRyR1h4UGNB?=
 =?utf-8?B?ME9YeDZSem5mU1h1U2NxRXdyS1p5eHhERENRcEhROXZqZ3ZiVnlkaXJuUXpW?=
 =?utf-8?B?TmtjSW1lbXlhTkdvS1dJMCtUNWxnb2JEWDcxcWY1NUVrd2xEL3hST0tDdTNJ?=
 =?utf-8?B?aFk0WjA2VzBVMkxodHZJaVV0SXlsYUdpcmtnZ3lNRDJYanJGdG1qd0I1Y1I5?=
 =?utf-8?Q?AcGiUJnHAn35u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTM1YTdiUjI1UC9WL0dMWkdvbGtlaVhyMjA4a1ZEdk03dzRnanVsWCsxVzlk?=
 =?utf-8?B?ZWYxV1l0NkZNNjM1MkxmV3duSzAzekFxTnBvd0dta2FVSDFSTEk4ZDRBaTVY?=
 =?utf-8?B?ck0rUWI3Vlhwb0JEck51QkVtVzlJWTJnczhBQmtsV3AxZzJzTjNlbnFvMS84?=
 =?utf-8?B?WWdmUFhnTEg1b1F1T2xpYk1LVXFpd0FVamkzRVNtV3U0elVBTCt3NlQxNTBs?=
 =?utf-8?B?ZXhaYnJGdTg4bUJmd0t2Y3U2Wjk4N2RzdEJ6ZTlFNWs0MERkM2NKK1ZxVFdn?=
 =?utf-8?B?SWZxTDNxM1FpQ25nbTNBbGxoTGRFM2phVzUxaG5peTRabUxqYzh5ektNZzRi?=
 =?utf-8?B?N3BnYm5QR2ltSU82ZjBvdmcxWjNESGk1RkZybmxnTjBBUGhlWElyYTQ2WEc5?=
 =?utf-8?B?T3RrRVk3RDBOK3JJWTlNb1gxKzQ3ZFVzMW1Fdm1kcVJmOU5Jc2Nnc3FSRTJH?=
 =?utf-8?B?b1NmdURadnZtRVFnYVZkanlpcVl4RGxTSkQ5NFFVV2lRYmJZUUFHOTIxUk54?=
 =?utf-8?B?NVNaTk5BTTBqbXMvaWNRcVVZNUE3ZGJ1YkdTd0pFQlZKdkE5UU9YK1V6SVRP?=
 =?utf-8?B?Rng2V1dwTUxTQyttT3VJTmI0RnBmdFNuSmdEOFZVUW9MUGV5N1E1bkZ5QVkv?=
 =?utf-8?B?VjBPSDNJTE1kMDNrZGQrTURBS1ZkbzB2MGVkRnlXUnBIUE8zY0FFT1lsakVH?=
 =?utf-8?B?aTJYL1hhNXFLOGp2WSs0N3o3Z0hyNmN0cGsyR2tVeVU1amdJRnN1andOMGo2?=
 =?utf-8?B?U1AzMVFMQW1WNWcyeHBoQlhuLzBrcEVqWTRUNEh1UTlaMDFsRXovMDMrSHJq?=
 =?utf-8?B?ck5qaE9ycHNNVDl4RDIyL0U0ZWdOVWZ5YjZ2aHVIMUN4T1Y0NWRIRUJCVEQw?=
 =?utf-8?B?K2RkRnVvWFRRUjNvemt3WXk4QlFLQVN4UUthWnZvRUxnMnVFaE9HSkNnd2xI?=
 =?utf-8?B?ZExGQWVlL0F2YkFQbGRwaE9qTnNnMVRSV1EzZkJrN3QwZE1EWTZWVjRWTXhl?=
 =?utf-8?B?VVZjc1d6c290TUEzVGNWTGhnWWZadldaRm9VOWxRMUo0UFBhU2plbDFCR2kx?=
 =?utf-8?B?VlBtdjhjaXV4SkVFY29RYmxhVWVkbFBUSXN3OC8xV0c1VG9wV3Z1MDU2QnZi?=
 =?utf-8?B?VlM5SGRiQTRZdzZFbTY0Yys2WE1IQXE3b2RHUS9ua1AyWFJQRGE0UENlWjlI?=
 =?utf-8?B?NHJFZWZJVTllOWZNZUdVUXU0dTlvMm5tMTlRbGlrY2lJVXMwNWEraDM3V0Zt?=
 =?utf-8?B?ZmFaTjB2Q2RhUFl3Qk9sb1ZCVEJJalV5Z1dsamFLdVlrWTNSM05lMHI5bndT?=
 =?utf-8?B?V3BXWjNRTzU4K0w3bE9rRTRpWWRwRVhnU3JPOGljUEoyMVhraEU0QXNSeElh?=
 =?utf-8?B?Sy9zU0l0WEY1OVRGTkR5NDNhSlVBUHg4bjJsMFdQK0Fkd0dKOWFjVGtvU012?=
 =?utf-8?B?KzVkeFlmNW1nM1BPMXhSNG5lbmJWdWZiM05UUmlSdlFWSVBMb2d6d1F2VW5J?=
 =?utf-8?B?WEUzMUx4ZUVROXpkMlhPUGZZSnc1cEFzd3RsTUtad1pyRjJUdnoxQ1cyYzdT?=
 =?utf-8?B?S2RvcnJ6SzV0aUVKNmhLd3BqRldoSW92dzV6b2hhWVJPMkg1eHZGQU5hQktF?=
 =?utf-8?B?alQ5QVVEZ1h2S3NWT2ZPZU9GR3U5OWM3MTdNUnlJblRZcEZYS1BIeFJjdTBZ?=
 =?utf-8?B?MkVpTUhydHZsQ1NIR3pGQklWQklFaDVSLzcrZUFoU3RiYzVIRm1TS2VqSk5j?=
 =?utf-8?B?TVlpenF6bUhJcmw3eXk1MlVkTUlkTy9nRlQ3R0NxMDZ1RjR4akd0ZFAzRFRD?=
 =?utf-8?B?Z3hsbVM0UmtBWVlZRWZ6QkEwSDdhYnBUTDlScWRTL25YOGdrNlM0NS9tZzVq?=
 =?utf-8?B?cWFxZ1BHRjFSSTR5UEhHTDhZZFQ3UWhqWEF6U2QzOHk2WU00OUcyMVR3M3Ji?=
 =?utf-8?B?RFFKd1NmcnVHem1GUDMxY0MvQ2hlYlhpU01FSFl6S3BCWG1RYzUxeS8ySmpn?=
 =?utf-8?B?VlZGbUxKSzhHMmpWVThyVWZ0TWFjZWRSZXBxMm90MXRKVUdLenBYUDI0RFpI?=
 =?utf-8?B?TTlQV2p0ZTd5YWFHV0Eremh4a2wyeXZRQjR0Zlh0RGNKMzJmMG80SWdsUmY5?=
 =?utf-8?B?NjNDdTZEeGxYRW9DZHpRN1ppeFNocnpjekVEUXg4cXJaM1ZDcHFZUC8xcE5L?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c7b113-83b4-45af-3a8c-08dd31d5e9a2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2025 00:21:37.5994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJkgxn7mnv/T4oqLbvCjAV4LH7xjFt73LJxU7UX77K18VfM03EuP+Tk5qUTAlrGPJvWBxBMdC7B+xkp7jLT3Ko2VrtDbri8F9qCCLlgLkSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8661
X-OriginatorOrg: intel.com



On 1/10/2025 5:03 AM, Steven Rostedt wrote:
> On Fri, 10 Jan 2025 12:20:09 +0000
> Yeking@Red54.com wrote:
> 
>> The old Fixes tag style is at least 10 years old. It lacks date
>> information, which can lead to misjudgment. So I added short author date
>> to avoid this. This make it clear at a glance and reduce
>> misunderstandings.
> 
> How can it lead to misjudgment? If you have two or more hashes matching, do
> you really think they'll have the same subjects?
> 
> I do not plan on doing this. It's pointless.
> 
> -- Steve

While the addition of the date is a widely used variant within the git
community, this was rejected by the kernel community in the past as
well. I remember posting fixes tags with the date several years ago and
getting push back.

I tried to find reference to these discussions but I can't seem to
locate them anymore on the archives.

I personally find the date helpful as it can help place a commit without
needing to take the extra time to do a lookup.

However, all of the existing tooling we have for the kernel does not
support the date, and I think its not worth trying to change it at this
point. It doesn't make sense to break all this tooling for information
which is accessible in other forms. Indeed, as long as the hash is
sufficiently long, the change of a collision is minimal.
