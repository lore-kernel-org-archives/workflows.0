Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E42128395
	for <workflows@vger.kernel.org>; Fri, 12 Sep 2025 01:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757640175; cv=fail; b=sx7olVnc3evHu1eGH2m2iYsyFriYT8/hC5M9pcO2+XzNKIByvCBwFvHv91Di3/QqaA+Zrmlu1xDv1ZWsZq8RKDJaHJOpKTWBKmif4IPt/5W/FFg2E54lkYfjySj+TukDU/fwLeJkaSKxqYGp88gdnoX5nlvGIPvRqztajlAV3LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757640175; c=relaxed/simple;
	bh=JWlC9xbGez6ojIlCuI/P5WspGwiaP3GmRNNIHCTNpHc=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=dZ1NNAewaybBeZs3U4qxwDay4PI923IpVMCd77GtsArTw8NN+TIciMfcyhYjA6XrpT975rTC/IoYVaaMCJBIfF+rUK9zA6d2+zq8i+zyjxzIplYDFZzguYrPFezi6kl4eTO+EqHyDrCG1oNGJx58lFsmMc+GFkA3Jqg66Iqp6lY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPKusxMR; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPKusxMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757640173; x=1789176173;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=JWlC9xbGez6ojIlCuI/P5WspGwiaP3GmRNNIHCTNpHc=;
  b=DPKusxMR4iiy//cmMKOWrJKwiGPWtElytbQYz0Ly/aanfI5kFe0IL9xO
   wRtysFVEyfaZx+F0CiGiouFlIcdU/mXyDtWC0BRmJH6kvChAjX+cG5inI
   pgKTKc8zmXiuNLjde4t0v3YoDUr+8voE+zywtCIgXA0C0dGlWqpOCUcMU
   rYVg8UKplJ7H/Et5bv++D7OJ1d7UrXjexo29NphBKo6Irl8h5xHskqUDt
   vqlBjuvzkq1KNhrAXkHWZ1SSq+ox74nJ8w5gaZwcvy3tPBCgX/X87aaxO
   csONzUwhVGA8+lV/0a8/u6XeGd4Du412MnsrDzDcLjqtRzFbVTqP9HG65
   A==;
X-CSE-ConnectionGUID: INVkg7INSvaulQUjO826UA==
X-CSE-MsgGUID: AAntr04NT1S/GcjWzvThcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60044064"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60044064"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 18:22:53 -0700
X-CSE-ConnectionGUID: U5IIDzS8Roi4d6auBSRHqw==
X-CSE-MsgGUID: JpIUJcbiSOWf5ErKmU6Feg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="173013743"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 18:22:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 18:22:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 18:22:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.54)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 18:22:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3vhJiKQYWzDf/pjm2BFib8GDOSIW0R3zbK64FVqIYEORpUh/zHS8bPQ/r81eBOW6vqTKDJ82N8OGt3hNLoOSov0e3d2DmwyKJMlGmQsysL2028nCukl9EvW1J6sVvjmFmd+Tn3+seV2F7f8sljk9qthu//yzhW3KqE3au6dvNXS4Xjy5RiA38FxBCTDHRgqBaP6h3GKn6Wjg/JGT5iiiGmVKPhiv9lyXONqfh4rg81xw3IdCoMHT5uTwa0vHGRCp0c+ZClxrfqen1ovo5PfKEbelw2RJumAyqry4dO0hV5nKlUNbIJg354Sl8g+CyfnGw1hEJxRM3kU8diQHQUngA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Qwe0AN9wgI6hJx/2fx+wB0i7H5XB/Ad2xlvfuCWzrg=;
 b=sVFFgfwQbYbI+G9VQ+h1I/+qY8IAz1eBh1ReUretmqeBJNG+baJ2A/MLupdzK9H9M8RNK9z5LB9kpZ/RvS3Nzbw8fgCnicMskZQjiaYgPyLVhqaxC3RKmFJbbcSiDHKXoWT4y93ezCxtQuJE3Niw7DCYo851ug/UGXLvEfdgo/14n0FHpLpCokxApyIp6d1c7yOBv8k2cKt/YwXpMaPCVLXLy7RixTExnz4qran8vHdRKphruzDlWLGGhpKVL42M4k1EcqMhGWopacQImQ6uI6pvXJrs1/qAGD/u4h1Bwvt0cRXoDECpTBnLBoA+ChJ4ZMqB4WjT5RtwQ+3Xz933Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 01:22:47 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%2]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 01:22:47 +0000
From: <dan.j.williams@intel.com>
Date: Thu, 11 Sep 2025 18:22:46 -0700
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <workflows@vger.kernel.org>
CC: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Message-ID: <68c375e619355_75db10018@dwillia2-mobl4.notmuch>
In-Reply-To: <972dd368-282a-4255-9b88-6324c1924512@oss.qualcomm.com>
References: <1bcfbc51-18bb-4a5c-8a1e-a2de794ff00f@quicinc.com>
 <972dd368-282a-4255-9b88-6324c1924512@oss.qualcomm.com>
Subject: Re: Is there an integrated b4 + patchwork guide for maintainers?
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::21) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CO1PR11MB4867:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a8e57d-7ed3-4bf2-f81e-08ddf19ae1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkE3Q09jR1RXaXc2d2d3emVyYkVMSnVzN1pPNUw2aEZTVlJ6TXBOZXpiZWhG?=
 =?utf-8?B?c2lkd3VmVUV4RnE3TVZTY25iei9OL3IralNQRVpxbm1DZC9kdGZzVm0vSXdO?=
 =?utf-8?B?THNGYlJZWTBHYW0rQnlIdS9rZEVxQ3V0cEVpWStoZjBjUy92Y0R3OFVMOFlx?=
 =?utf-8?B?YitLSnBJaVdrd2M5Wnp5QWVIUisyY293UWIvaVg1MU05dFpWcVZNSVVyNHZ0?=
 =?utf-8?B?MGpxWWFwWFZEQzdtbjNjZTZnNFdqWE51N21kalBFdFdDcFlvaWVXU3plUVBJ?=
 =?utf-8?B?dEdIWlZCckZ4SFZJUjlNSjh1MXdXRVgwMitnR0x4NnFkR1N6L3JDbGVlOWtE?=
 =?utf-8?B?MHlkYUEzMlF4R0pONlVTbWM5NS9ZT1dYUEVEMWdxcXF3NEI0cy96enZkcllG?=
 =?utf-8?B?QUtLWmZVazVIbFFJZzFtVzJOYWhYSm9BTzR4dmZZYStNTTNIMnF5Rng4M2s0?=
 =?utf-8?B?dldub0lxZDNncjE3WW5aNG5FdHlYY2s4RjJyL3pBNEx2dVpsdnlmc203aTdz?=
 =?utf-8?B?NHQ4aDBjYjE5S3VEa3lUQmdJZFBQeGd0QUNlNjdKOHoyZ2xVVlZ2V0MvbktN?=
 =?utf-8?B?TjJhMDNzUVgxZldWcnVIN09iMU1PMFBneWFZbVg3anQ2RytyckdmUDNZNWRR?=
 =?utf-8?B?eTdzSE11bFIrbzhtMTYzNUx1eW11MXpwdnlDODRxTmZQV3VOT1pPYnlIYUxE?=
 =?utf-8?B?MytCaUxvQnA0Zm8yT0ZtWEc1eDZqbEZNSUpsL0tZYkdoNXhWdXpCZzU3WnUz?=
 =?utf-8?B?UGU1WnU3NnY3dmdRWThGb2FkZ0JkTVJ0cEZrWjh0OVR4cWVrL3ZvaWVrb3I4?=
 =?utf-8?B?MHNNb2Uwb1FOV2JIWldoTkdsNk40dWcwMDBGVmpjYm1hSEYyWU5GYVd6Q1pM?=
 =?utf-8?B?M2VQTmZUTEVmaFQ2R3FldU5YekUzclYrMFlGMlpSK3FlOUdQZmVKTmZUb0Mv?=
 =?utf-8?B?SEgwTmZ3K0NTVWhKajEwOEp1MlB3bCsxOXIrQ08xMFY0UUhBNExybWM1Nis2?=
 =?utf-8?B?ZWo3aFdGaHRXTW5BcEU4MEZVdXBYS3NVTnpaNmZLTzJKT0FRUXVvSnluQ3Js?=
 =?utf-8?B?TXRTbUlJS1pvUkx1UnZvT1B4Z2tGYXFKaWI2enlmdEplK1o0OU1PN3FtZmdJ?=
 =?utf-8?B?NFVhSDN1aTJjTHprMkxaOTBaOXRBZ3RGSzVZV3dJK2FVVXZUQXVxWU1UbHJy?=
 =?utf-8?B?dzltKys3NFpWSGR5a1AzQWZZTWd4blErWG1ZTFZRZ2Z2dXRtUDNUbEdyaVNB?=
 =?utf-8?B?MGFLQnByYmRqa2d0K0ZpMnJWd0hKbStMSTdRRlFmdnczVnZyZ3FSTHVBQVBS?=
 =?utf-8?B?eWdKWnpIcGQ4aStZL0FRcmcrM0U4dVo4RGRBMGdwYnNzSDhjbklaWnVMRnYw?=
 =?utf-8?B?VUNRdUFJeGVZRVFHSWtEMUhaSVR4c01FQ3dqRjBzdUtnYkxsd3dJejVaRkhB?=
 =?utf-8?B?bXBDakhqaEYwTzFTd3BRV2c5R3lKRmNTb2dPYVNHMXVVQWFQZVVmTGVuSzJO?=
 =?utf-8?B?T1NHQmJUKzRTQk5DWHdlb3pGUVM0cnZ5VzBETE1LZHY2emloV3ZreDllTE1D?=
 =?utf-8?B?aHRsR0FUR3NqTEpKY240RVVwN2JjNnNoL0p5WjIxR0hCbTRmVnlLenZ6OVRz?=
 =?utf-8?B?bjlrclhrZGtnZHBmMHplcmR0VzNoTGcvZ1VQdUtkV1JvK2JhVytrZUVSQVZw?=
 =?utf-8?B?cHBkdnR0ZW8xc1hnYmNsWmJiRmJJUitmYWEzNEdHVHBuaFJwQ3dXNjZlSGMv?=
 =?utf-8?B?cW42Rll0d1ZhWU42U0I5ZlYrVHRpeC90QTZZa20rNXE3ZUJjWU13aWEvS3ds?=
 =?utf-8?Q?mrAiX6Qs4wvPNXDUFkAttPM+E6Uxih4CCpOF4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVVUNHhDUytrZGh4Z1E2dU1qcE9lNHNMM0RYUjVXMEhiajdUSFpYQzdKZHRx?=
 =?utf-8?B?RjNGYTEvZEo1TDVWZCtmdHQwRzUvTVM4S1lmK2JiQVhRbEw3RlYyWE1iV1hW?=
 =?utf-8?B?RHFUT2VEekpiODltNG1uaVZ5c09vK2hLVTJhTU1zc0lVMW1pQnAzeW4rVmMw?=
 =?utf-8?B?QzZPaGlGSXBDVW8vc285OGUxVCsxZ2p3YWtrKzRVV1k3QkRydGdMcmlKUk9K?=
 =?utf-8?B?MTJiazRNS0tBRzN4OWJCMXlnZWdhYmhlVTFTS1NTNk5Ud1Y0RGVURkV6NDhm?=
 =?utf-8?B?YklxeklXQXdvb3BmSXd0SGgwLzQzRDZ0TEdJVkZDSEUrNmJBeUdRRnordjBD?=
 =?utf-8?B?N0dnQzJVSVRrd0hoVnVyam1VeCsxUlF4QkJtVDdkVm5FLzB2ZUNONHk5RThD?=
 =?utf-8?B?cVVXTXVKcUVHRklkZUZteHB2WlJnbzN1QWxLNkxMaG95WDBMYWJhb1ZiTHRF?=
 =?utf-8?B?RmNLQmw5VURoVG1oNEZISHBaSE1nZ2w2elNVYmcwWWhhbUxMWU1tam9zdjFh?=
 =?utf-8?B?L3BzK1VNWnhlV3Q2dlM2c1ZOZ2FoZEpsZ01kd21JcDBjTWYrK2dPd2ZZOVlM?=
 =?utf-8?B?V3hiYUdYUjI5MWV3SU1DQ09mZFgrM2hWREJtQVhqUW5DWE55bGs0c1JrL0ow?=
 =?utf-8?B?UnVCMFMvOWtMdTlnRzlNVGNHMlY4dm1FSlZWdEJxc1loQlYrbUV2ZGhhNU5D?=
 =?utf-8?B?MVl2RVNZWmdibENSYldrRno3amgvdzdMaFUvbWhob1NlWVY2OThuZnBoSHZz?=
 =?utf-8?B?YnF5Qmw2S2MvdnA3dTZaS1luN0ZYZHUvcTdIUXBzUUxEbWRQSTRsWVZHdG9t?=
 =?utf-8?B?UDlDbFhLYVIyYWNST2EzdHVuUEo2cEdkUFM0VWtZZkhXeHFFYjg5ck5xR2ph?=
 =?utf-8?B?V3puVmQ4NDVhSUZCQ0Uyd0hjQzA4QlA0L2YvOXdYb3V4WkZFcW53ZXlTTW02?=
 =?utf-8?B?UGtMcHFQN3BBaXkwdWNXazdIL3BoNEw2QkVMVjJBYUZLU0RSVHVQbVAxZmx1?=
 =?utf-8?B?Y01mY3gzc3lsZHBRKzdxN1dNNEhsMW4yMG9vMEpsQW5xdE5lYlB0SjRrc2p4?=
 =?utf-8?B?c2RQa1lxYUdFVDRUVUhwQm9oOU9lUUlQL2sxUDVTUDRESGJlNFBtVHlma1Jn?=
 =?utf-8?B?M0xzMTRGZDNMTFhaSmpHdFUwNEZmRVV3NWl6SW1UcEx1NitYd2RFck83Q3hQ?=
 =?utf-8?B?S0F4Mm9LcVNna29VUWZ4a3paVUUxNEp1emVybkJwSG9KR3o5SjFtSWIrNEtp?=
 =?utf-8?B?eFJhL2J4dnNZRkQwV1FBLzFqRVZJSDQzQnQzM2ZiOTNlNUdJWHozNm9KWEg1?=
 =?utf-8?B?bFVybVRSU0QxVDhxR05XM3VKTExONitUNUtRSWdwQkc4c3ZHVEJxMFNaUkNs?=
 =?utf-8?B?bEtNK0lDYlhhdnlYV0pLQ0YzQ0FFUmp6L1A4aE1lNkMyNFZMTzBCTDd4UEhu?=
 =?utf-8?B?RXYxbjRReUIyWXdYbjBlYVMyZnVhcFlqQTlzeVB3aDM1Z3ZDbVRwUjlCSmtR?=
 =?utf-8?B?dmNmNlZkTndldmVsVThybXhNTDFUK0JjL3BWN05GNVFNZGY5OTNpT3FXQVlz?=
 =?utf-8?B?c3dQdWJveEtla1JuQkl0ekN6TEhmbWF1VUhrNG44MHU0QUZUWFJwV2V3MWxi?=
 =?utf-8?B?cGI0aDk0WTQ2TnV4bVVsU2ErQ0JRdm54MVhjL2c2TWdsbkFYNzNveFRzNkVy?=
 =?utf-8?B?ODlUYVFWMEkvZHRCd2tiSXN0Yjl3ai95anJ2Um1Vb2JTUjNvaCt4TUJBZXhP?=
 =?utf-8?B?UFhUZHQ0YzhDTlBITVVxRUlXS1BSZTIzbjBpSkZMTHdlS250bSt1dVdWRzlq?=
 =?utf-8?B?VkxmdjhoRU4yNHRhRS9SQVNHbzhQZHZrZVZPeW1DeFV2c2d1bVdJelFqNlQy?=
 =?utf-8?B?SnBjc2NXZndiSWZWV25VMFg3K0p6cFlwa0lBZm5VSXdtNXgzS0ZWTEhac0xX?=
 =?utf-8?B?TDRDS1Q1ekNKTTJ0cFhXZ2ZIWVJ2NkxCTVJERENuK2dCYjNOZGcvL3pQN01v?=
 =?utf-8?B?V3JEcUUrR3U1QjdySTAzZkQ2K0pzUlhtcU5GblV1Wm1oOUkyRThBS0J0Njlm?=
 =?utf-8?B?TXMyVStJaDRhL1pZczUxNU5tTmEwamhJeDFQMVlSRlhLNVplUTExS0wzMVZW?=
 =?utf-8?B?NEhWSytzQ0haK1BjWW5STUs4RC9XZDdleHcvUVZTaW50OGd0UVp5ZlBHaUJh?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a8e57d-7ed3-4bf2-f81e-08ddf19ae1ec
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 01:22:47.5534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RaKydfLYFWV7B1rMMWxuIbw40NbqqLJ3ogMdxXMbfxiZ/QfVQACO2yaIvRg6z1MflyyL8CC5reSnCJUVzYVp6m3pIExUQwEG/nX/aM7Ps2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4867
X-OriginatorOrg: intel.com

Jeff Johnson wrote:
> On 7/17/2024 12:30 PM, Jeff Johnson wrote:
> > I'm in the process of taking over ath.git maintainer activities from Kalle. He
> > has shared his workflow, but much of it is based upon using Stacked Git (STG)
> > and a patchwork script he authored. I seems like many (most?) maintainers are
> > now using b4, and Kalle fully supports me using it, so I just want to see if
> > there is a guide or sample workflow for using b4 along with patchwork. I'd
> > like to adopt a proven workflow rather than stumbling around on my own.
> 
> I sent this over a year ago (using my former credentials). I did not receive
> any responses at that time, so I just cobbled things together.
> 
> In light of current discussion about using Link: tags, and related discussion
> about how multi-commit series should be treated (applied linearly or merged
> from a dev branch), it seems timely to re-ask the question. Is there a guide
> or recommended sample workflow for using b4 along with patchwork?

I am not aware of one. I have maintained the CXL subsystem with
patchwork and b4 in the past, but did not use much more than:

https://korg.docs.kernel.org/patchwork/index.html

...in terms of a guide.

b4 mostly does some patchwork flows better, like pulling patches from
the list, and patchwork-bot handles the thank-yous and marking patches
accepted with their commit-ids.

Outside of that it quickly gets into subsystem specific flows around
patch states, delegation, and submitter expectations.

I would recommend going through the subsystem handbooks if you have not
already in terms inspiration for setting submitter expectations:

https://www.kernel.org/doc/html/v6.16-rc1/process/maintainer-handbooks.html
