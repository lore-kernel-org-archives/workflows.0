Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF5430F555;
	Tue, 13 Jan 2026 18:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768328450; cv=fail; b=iwanRw4elJmULgOoWeB4+cxnxcgUi1U6Rk0vjR2sg/Vw1QKbF3mVNcwqcIhyCrD+3sh5maPQI/cAlgI1IeNIAe+rYEp8hzQn3LAYSHRCn1CmyfF3wYwmRHKCShdaYGS51MNRk6QZqyEpn9a+NYbGqJxOp6VA3g1krHqt+DCsTYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768328450; c=relaxed/simple;
	bh=d9y1SM919ovlA+C8B7yEu0ga9M42Hxv+e8pkz2MP5Pc=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=LPDyT4PN+hbYqT3brJmajWt7JCD/HCTqLEtY3H5FDeKnbcV5MvN1RRy/J22xIXHnVpwj/1k3RybZxQvADvgSLO+vMCHL89wwOF89xVwLAQFz3X1zIT0H7ZmdiXkLofC/czdNBHNXy3cwI1rofBD5ZRXMHMAKo1wUbJbwcU0QWRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/CDHtJz; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/CDHtJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768328449; x=1799864449;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=d9y1SM919ovlA+C8B7yEu0ga9M42Hxv+e8pkz2MP5Pc=;
  b=K/CDHtJziQ4y+yJoUruinQCiMPwHdXYoranhKQw+u1t3XPHeyeCzo3lV
   HomIf+zIkyo/y+4+C66rNydHaI1LNYx3TKzDyHqCLvS8LUCOnecdSqVPe
   iIxp4AHd4mljzt5ImmTQIlQ6QSLnUCClOqmawGXaq6+piVhTs59xuaXz9
   COExoPRljaA5pWp5HZoakxazZ2qkWbO453MgMjeXbmOLYwcRMgnr0ROM0
   d+loMGWD5oYR7TQOLwfsGBNKmikQEIWPRaWHZzIq67tTRm6JRp47d2rm0
   sUbHpmK/V49K6bj2P0wZHY8z96WT4Iw9lnlVVfVqlwsti9McKWSCa3Sis
   w==;
X-CSE-ConnectionGUID: cGYks9+qRsyW9obGYf/10A==
X-CSE-MsgGUID: DlmGe1VLQ2WMk+FaQ+uwWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="72205361"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="72205361"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 10:20:48 -0800
X-CSE-ConnectionGUID: AeEIkLHSSCKBzdOubO32cg==
X-CSE-MsgGUID: rmAkrAIVQMiRG+bP+3dlnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204089023"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 10:20:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 10:20:47 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 10:20:47 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 10:20:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2LM5bGk99/XHKVv+2U3Vgj6eW+C2R5umeAgE+6CkTjs45/PTv0uGE6Gwnt5itPwsE43AYN/91+5cqvacsvOTKy7EZh/BxsKOh+w4ahhlkBzmtoiyiw4UMAMdjoJiPKU/NPMDX/y5iA9p98nLwSt2vnOWdYxKMHT5r7FR8RtJwDM7vvomZwD4o73FHIKg7GKchZVSyPiymmmEIovqKOc25tBNV+ND8dTsJbJp+qbwLbMlSj8Zw+36Q8hqSb82bEQbQy1tWL9OuNtjzKyDN2q07eISG/SLpYClw/s+N7dp9k3wf6KbVMDXNs+mvUiQBp3d0TsljUGsFEbeAOcPmVqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jlbz43ZD0CsoVbhC1/RNa5lERvfhfMu6UJLndBKJIl8=;
 b=krUnoYOocdFfjc/CDZ9OAk2CxfixUgu4FR0h0pBN0+40m0JJlEmomNARrURV5P9vFIRsvo1idtPwGqoXlVVSd35u3FcqYwUX12a0d8wSQol98K25lMcOFf3eZ34IriaURw6VEGa2RN3bOcykZP1OU0qEphtMZQHEEqTIcsIpqTk0MPxIkY4O3AijpVu1NvIOzW65nLsMbD9bOWSYXJOml1itxwjU5+TCdXTJ1slkeLt4g3yRLoy6tN+R0Q5bOzCDhXUonD2VAOEbvd8VnJPOtY2dfwX45E46R6EffNQSLRLXRpe8FCz2D57SFMSLOWWb4p8i9hjdsrnA0A5/mWXYXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DS0PR11MB7531.namprd11.prod.outlook.com (2603:10b6:8:14a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 18:20:45 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 18:20:44 +0000
From: <dan.j.williams@intel.com>
Date: Tue, 13 Jan 2026 10:20:44 -0800
To: Dan Carpenter <dan.carpenter@linaro.org>, Dave Hansen
	<dave.hansen@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, Kees Cook
	<kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, SeongJae
 Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Steven Rostedt
	<rostedt@goodmis.org>, "Paul E . McKenney" <paulmck@kernel.org>, Simon Glass
	<simon.glass@canonical.com>, NeilBrown <neilb@ownmail.net>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, Theodore Ts'o <tytso@mit.edu>, Sasha Levin
	<sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka
	<vbabka@suse.cz>, <workflows@vger.kernel.org>, <ksummit@lists.linux.dev>
Message-ID: <69668cfc63bb1_875d1004@dwillia2-mobl4.notmuch>
In-Reply-To: <aWXYi35pu9IHf2eE@stanley.mountain>
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
 <aWXYi35pu9IHf2eE@stanley.mountain>
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for tool-generated
 content
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DS0PR11MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a0260e-403e-4439-c7f4-08de52d077a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?em9zWHR0WkxPVlU5VFVhenpBU1BYcVRrNHp0aFJ5b3B0dGxVaWc5aGdZck5K?=
 =?utf-8?B?eVhSK29EamdnZThXeHFkTGxMb3JoYnpYdXFmMjJGdEVFMDd5RUV0clpYRGpy?=
 =?utf-8?B?OWJIcVc2ZGlrM2FGNGFjNHdFR0pWdENTTDFJWHpzenhCTTRqWnlnWEc2RHMw?=
 =?utf-8?B?ek1QTG5jZlBhbjZuVWtTYmsrblRWT0JWckV5bGJxRXd1dEZocjJpVXpyWkdi?=
 =?utf-8?B?TWE5OU83Rk1CRGRiclZpWThPS0Zza0RoZDg5cjZkOU9tTjdRd3ViZWIvYmN6?=
 =?utf-8?B?WjFUN2NwRnArc1o0dG9FemFOT1Vlcnd6WTFHb0FlSjRPakh0YWtTMEx5MFMr?=
 =?utf-8?B?Wisxam55ZFF0dWN3dnlhdi84VzJ4ZzV4OUFzbnJRdUlHNGhFUXhadms5bG1m?=
 =?utf-8?B?OE45NDhTY3hGMnVjeWwzamlsNXdTOEo3Mm9iek9EUTVtTUVGTjZpYWF2ajB0?=
 =?utf-8?B?RzN6WnZXNVRpdU85ODlIcmVUdTFCaUdxSFdiWTREYTdQeWNaaHhjT2RtOG5l?=
 =?utf-8?B?a3pZUEEwaHdMWEJ5c0Q2SUhzMHZma2N1SiswTmI1V08rVGpnZUhVSUkydUdu?=
 =?utf-8?B?cnkrdXVGRytINENwNkFsNWpUcVlYMkZoRGp3SnJiRFBEcWNyTGY5OEtSeTNP?=
 =?utf-8?B?dExDTXlpa0x6MVNuQlQya2gyVzdkajd0bWFlTE5yMDgzVklrNFc2bllCbnkw?=
 =?utf-8?B?V1ZhRjdRQ0VvTjJaanplbEsvMlUzYS9ZT2RlVDRDMVlNRDFFN1ZjS1loc2xS?=
 =?utf-8?B?RXJ6UUZ6UWhzYUxCeTNmY09YQ3R2SEYvMldpMkcvUUpUeWdSbmQzazd2QWIw?=
 =?utf-8?B?TUFnSUNDeU1nMzFmQWtOOEZIVVBMbUFlS2pMV1V4NlZqbnhaUXI5YUd0ai9N?=
 =?utf-8?B?bm9Vd2p6YjdMejl4VHJqZUZIbFRhNElDaFYwWXRic3UxSTZCN3owMFdSa0FL?=
 =?utf-8?B?NjdQOXVDd3ZoREFoWW9FM3Q5d3lROTFoMG1nZVZTYUExTlNVZG1jaHEzcE9H?=
 =?utf-8?B?eFpsWGdNQXBtc1lpMmFzU281OU5vSjVibWlrdm15SXEzNi80UUNhcFErUFZO?=
 =?utf-8?B?OURFN3Z6SEw2VHo2OFA1WGNrZitaci9LNnRCVGpwYTlOOTljdktwcmloMGlT?=
 =?utf-8?B?NzNVSW1WNWJYL0tucFNSWVVnclRBeUZsQkN5SEdEL1g3ZTlMZWEvWFpPbjJv?=
 =?utf-8?B?L0JoZVZwamhuNDlZQTZ0OUIrcW1HQlBjaWh4M1ZtU0owK0ZKRDhyM0pjQ2x5?=
 =?utf-8?B?ck9uV0wvSTBxMnpXeHB3R3dOdmdKYmtCWXllcE5VbEdsRXArTUFrRjhOdkRW?=
 =?utf-8?B?cXV3bUVyUmpobnplVU5ZMjVuYmVpMzhaRnEvNDBsK2RQZTBUQW45a3ArcFZS?=
 =?utf-8?B?NlBxOWl2SkVCZ3h2RHZFbHpZUFhyem1FZ3p1QWJVbHdtcVV0K3JZU1UzQmlp?=
 =?utf-8?B?ZG5jbjEzd21lTDFXNWNvYTlZd1ltV0xldjVGVHd0c016QVFMTnVIcEdydXF6?=
 =?utf-8?B?SEJtbk13VkRIR3FPa1NpSUhNSUtselZmbjVIcU5zcFhTV2VuR3ZRRzlWR1dX?=
 =?utf-8?B?Ry9KWUh5U2tGZytRcHE5SUlrcVExNUdmVDJjU0tFWjF3NStTMmo4cUlFNkFY?=
 =?utf-8?B?cGZDeDNXYnU0VmdDVVlPM2lpRE1VWmVSR1BuOWpsOEkvRUFuMjh1OERmbU5K?=
 =?utf-8?B?Y1hZYXFqczNvVUg1aU1PbWJzazROZlN6YmFCZWdDV0hpUHROVTRTVUNKQkx0?=
 =?utf-8?B?ZnFKTnlBcG90T0FLaWQyTm0zbHZCSVBVRW5ST2FxWi9YQVRGNHlZOTU2RHZx?=
 =?utf-8?B?c256NWNrenVLWCt5QmVrVG9XT3gydWQ4ZXNMSEdjOHp3SE5XMjFIR0JrS1JY?=
 =?utf-8?B?aDdNNUZQRFpYRHR6ZHYxMEZ1Q1VoQTRzMElPenpWanVaLzNlSTMwdTdBNGFr?=
 =?utf-8?Q?0uh3mHZdPGGoSE9jO7fbjBMQ8n/AURUz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aktNRkRyeHZvN0lhN0NRTnBPZE5hVEhGUnp5UWtCK2tDZ0htcWt2NkJNdVVZ?=
 =?utf-8?B?b2N0bTBScFBaRnhBbHFaclBkMEQ4amkwUkhqWUhLYlo4cHFqRHA0b3E5b1lM?=
 =?utf-8?B?ZlROODBXWktJbEpobEJVK0FFa3NBcXBiaGF0QTlVTEtkcm1WMTFDTnVZRW9n?=
 =?utf-8?B?dVFJT3FmNmw4d0ljMy8xOEdWa0c5b3RVS0k0NURxTGtMMitUTlpsc3ZseFhz?=
 =?utf-8?B?aXBZcDNBZmExR1JrVUZVeFlYU2N1cldnbzJxWi9uclRkOEEybWxjQ1poVTFS?=
 =?utf-8?B?QWJEL1g3YjhjK0pyUmpPZTYwMStKL2NPOWF1RWNPdUU1RzAzWEN2MGk4MnBa?=
 =?utf-8?B?aUw3RVJxQ3lNTDRGQkVWRWhLZHltRnYzYXFqN01VQXp6THo2RG96TDY2MWFV?=
 =?utf-8?B?TjQ1bjZuS0gvc2o2WTdjWGtyTk1JdmhXRWZKTnhINGRPWGJuV2tjTGV4SGRU?=
 =?utf-8?B?SFp1ZWdJSXlyLzdpUUFKcWlTWFI2dU1tYy85UTBDZ0U1eXVVaFdvdjlnQWxP?=
 =?utf-8?B?a3dnQWt0U3pqaSt0Ui84ZFZYUy9WdlQ0aElTbnBUTndzdDRNS01udW1zVVBD?=
 =?utf-8?B?RkkxeUk0Tzk0TjVGS3hlcVJBSTh0QWJ2eVNqRi9TSjlhQ3MwWnZrSnFQWjYr?=
 =?utf-8?B?MmpDZWY2RDYwWXpYakNRbkpCRmZQZVgwNGxHMm9sNDdBeTJTTUcwMXovZ1Aw?=
 =?utf-8?B?RmZ1anMwdTVUL2J0ZTlIeWZBRndyVDRteTdiUUFpWWlqcnNENkNzanVsZUYv?=
 =?utf-8?B?cmNhZWxtYmdMalFTM2I2Yy85M2owNGZrNVlVUGxKSzFhemcrSDYzczJtWXpa?=
 =?utf-8?B?bnVPT01Bd2MxdFlOS2FGQlZaT3ppbldNblJlSzYwN0NOWDM1ZDNJWWJkNDhG?=
 =?utf-8?B?LzY4SVdPQUVkeU1hbm5VZndVVFZFTXBSV1ZjbFVwSitBTUpNWjFPVWJQbmdx?=
 =?utf-8?B?bitWZDBzQ3pRM1orUitTWmg4UVpyZ3FXcURYUitUM2NHL0prZEFFS3lxbENp?=
 =?utf-8?B?aDVwYVlwekQ3bHNMSkZmc2d4bkFWc3NYNW9Hby92OE03WStOMWNSWDM3b1Nl?=
 =?utf-8?B?a0U0TWtacENBajVkYUk0NTF0SE5PQTV4dmRJY2lKdVN6T01KL0h0c3RhOUxO?=
 =?utf-8?B?d0FCNE4xTERqZHpFbjdkV1hWSXVGNU42Z3hMMXd2aEllR1ZZVlZPcW1XWnYx?=
 =?utf-8?B?ckpHa1BBWURhbDlpclB6Y3pHblJ5QmFpUkJrQm5hc0ZpeFo0K2pFRWIzV3du?=
 =?utf-8?B?Wkp2RjFsdFlSUlhEbS9DMlgxUzBRUHloTWNpWVV2YTloME1iS1kwT01VWUNM?=
 =?utf-8?B?QUhTTlAzNkxQcExwazI1bHN0elBkSHEvOWVRV1lxWmYrU1ZUdStUVU1OZVM2?=
 =?utf-8?B?ekpoYmt3QUsyZEJoZS9rU0Z2UDJ5N3grdGVqTENZMEM1OFJwNEEwS054N28z?=
 =?utf-8?B?R0RyMmJ5aDg0TFpuQjhHWXpKTEl0UEpRZ2s1SEpvYmRxK04rNG9sTEVYYWpH?=
 =?utf-8?B?aWZMblVYbXB2d2F0Z0xYMjZRaFFGeGNpOXJPR2YvTUNMYnA0aHNCdnhEc2dT?=
 =?utf-8?B?d0RzZFd5VVFSNlFRRi9FZW9WVmdxT2pkd09HL0Z1aHhvMFlNYThTeXNFSFVt?=
 =?utf-8?B?d3RxRUNrUGhVbUpBTFRTUTQ4cldmQjY1SjhCZC95Skt1bTYrblNzY05HMjZX?=
 =?utf-8?B?cHRQeVVQd09wS3FOczFqaVIzRlQ1UHQxdDhsd2xMZGZxQWR0WUpyU2syZitI?=
 =?utf-8?B?TUZqakdBNVlkMHM5WDI1bG9wRTk2OCtHTE0rZm5lUktrU3FUbDJucFY1Ynpz?=
 =?utf-8?B?Tml0dy9PcUI0TWh3QXF3YVcybks3L0ZaVG9xcEJWc0xYK3JhYWkvVU5XZ3dP?=
 =?utf-8?B?TWlYR1JvYWRXRGs2WndJWUJldUdZZkFCakVkengzYnVPUS9qOVNFN0UxVmxt?=
 =?utf-8?B?RWJpZ2l4aW8xcE1talBIMEpySXBuT09vUzVQSmZKSVJOMVI2SUpmUTAxK2dy?=
 =?utf-8?B?Y0lPR0ZxcUJ1c3crcGJmTFEzT2x3RUNyUCs2NzhPOU5ZUHJxN0NkQkJsTUF6?=
 =?utf-8?B?UWRqLzFOTFdNNERzdGV0TE8vazBHemo1Sm12TnBudVc3V09FU0ZJd2VJNSta?=
 =?utf-8?B?MzM1RzZOMkJGQTlyTThzTHpwQlk4RE9vZVdtU3hZUnJlMWpJRXBWT0JwMjZV?=
 =?utf-8?B?ei96WlBLS1MxaHF6RlZueHd6M3ZEVFJtYzh4Q0RjRjJwZUMzSjFOc2psN0VX?=
 =?utf-8?B?K3RDamdnRkEyWnhJMTI4RHJCdTFONmxhVk1TUEllbndEYkpYWTZ1TzM0Rm5k?=
 =?utf-8?B?cVBlb0c2TUJiY3NKRzdoMFJ2VVpMVzc0Si9pc2l6eXkxU1lIUmx5ZFAySEVS?=
 =?utf-8?Q?vR235K3Ix7LCa4oE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a0260e-403e-4439-c7f4-08de52d077a1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 18:20:44.8147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qzUm5/PvQ3eCCz+C1XfyNq+8fXkzt1gAfCxs7RF5h5V4JfmfjDn+DwxXtVtRwkW5y5LMztO0aPefPHOI+qXuvFTiy+EcRbPMJTi6zIRdDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7531
X-OriginatorOrg: intel.com

Dan Carpenter wrote:
[..]
> If tools permit you to generate a contribution automatically, expect
> additional scrutiny in proportion to how much of it was generated.
> 
> Every kernel patch needs careful review from multiple people.  Please,
> don't start the public review process until after you have carefully
> reviewed the patches yourself.  If you don't have the necessary
> expertise to review kernel code, consider asking for help first before
> sending them to the main list.

Note, I do not want additional changes to this document, my Reviewed-by
still stands with this version, it is good, ship it.

However, I do want to endorse this sentiment as uniquely capturing a
truism of kernel development that perhaps belongs in
Documentation/process/submitting-patches.rst. It captures it in a way
that avoids the conceit of the "slop is special" argument.

Contributions are accepted in large part based in trust in the author.
So much so that even long time contributors self censor, self mistrust,
based on the adage "debugging is harder than developing, if you develop
at the limits of your cleverness you will not be able to debug the
result." Tools potentially allow you to develop beyond the limits of
your own cleverness which implicates the result as "undebuggable" and
unmaintainable.

So a simple rule of "generally you should be able to demonstrate the
ability to substantively review a contribution of similar complexity
before expecting the kernel community to engage in earnest" mitigates
the asymmetric threat of AI contributions *and* contributors that have
not built-up enough trust capital with their upstream maintainer.
