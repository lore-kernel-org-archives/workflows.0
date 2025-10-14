Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424F91ACEAF
	for <workflows@vger.kernel.org>; Tue, 14 Oct 2025 18:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760466527; cv=fail; b=iCjZOVmO/fD4LGEKj31corGFq1tbAZcnHX6tnmjRRdhGs2+L8eNn2UGl2KR2b2TvaYqwAPC4Zb2RJQeWnqGghMtz+h9cJqqqqi4Uq3AkJQf7si47m4ab5IV1GVlrvQNg5tiAHKhifpDDNa7wg9zqnZhpKBgLIXBhDmSvj1F7m0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760466527; c=relaxed/simple;
	bh=Yxsof6wsvbVSnebKQSiwSedkiv5XcNGCsGjZ3W9x+6o=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=L7kqN0PJeb6v/RXFQnotrcVP+iElKKHzOHRy5rLVTkMKNqmJlViIc4o9Ocnhxw06cbrbUgeSAih9OfbImIm/DmO86YbRulMpKnCqEOB6oUGTEghHk8eBhLuyEAWN9+jtF5sKW4vNrX/BkmzYXCyQZxp/YLu7zxx7xtfyCn6Wpi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWH7xMSn; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWH7xMSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760466526; x=1792002526;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=Yxsof6wsvbVSnebKQSiwSedkiv5XcNGCsGjZ3W9x+6o=;
  b=HWH7xMSnQReyXPNNHTidUPV968eNq6j3YDDcFq5XNU9c7RMBQK95QKOO
   FDUbv8UsXQHEPtk6uGIFbaKS6aaBQAlPWYznfT/Ufph06p7TlKelMH76Y
   6oFGnE2KPpi+8XtERbyvXI7YuDiUzS8yUtEk2afYBvvdbmGPzOu0sbGpo
   uRW3BPdhcsYNNAlLo9l4VZ/CjhRBl6ltVmRinIgHmKIvg5enfDVv8OYLQ
   wjbxW/89KMkaVwC+v77ZbZ1l02UyD8RA1cCFhkkra2HzF1cNDkeY3T+dG
   BmGh16WBDKQAeKPrQ0brzf/r8H/w2l2EONqijjapmcA9gjcVpGEhA1y6C
   A==;
X-CSE-ConnectionGUID: WDyqQbaPRkicU3RMC/lAoA==
X-CSE-MsgGUID: Gx2nAWQsQcaFnmPgxnbYwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73737514"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="73737514"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 11:28:45 -0700
X-CSE-ConnectionGUID: OgG+1psnQgeVVSCFafrSCw==
X-CSE-MsgGUID: AGvn4qn9SO2NJ2ssUOF0Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="182740899"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 11:28:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:28:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 11:28:43 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:28:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M8h5mxS+753AOjqapMYyzBrncZHAaIr2PxzmBY6Mhj4IAlp7Ft7MstdoRleXU6K25siZvR18NnSA4cOa1Hl0AOV/KEX/A3jSTuk65To0FvrQBBOJJnhf3Xu5HEfHvo2xJMfeNiIcqlJlsCftoO1v/JWe9gfN0s2iqUoar12Y2M6jak8XyFSs2v2AkkEYyIhGcV8bZvYXL5Vp3c+XKbdpqyiavcNR7uH4DOfvXllp/30kIZ5NCsgpDBCHXUYV3miHXJmJQrVHT938wMJE94+UkL6rKIGPXFLdg78ltPGHPtYtQXQyHkHv9qCHqaOLnhep84GPVZXIaZgn8ZUyjNVPDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxpN2VqpLeFeK+xfsaMkB/8gIFl4jUSPMmxDmP/DVSw=;
 b=fPyIt/ZjFor4WxO0wsRp5AoEmmp3SDP0Yj5Gx1hHo1GQIohitgsVpGpdhar+nnId6lWlbutvf8NBEdHS2lIw0x3WePYHjkJYoxUYBQoXYRwk7n0pxo9j/S/mF0rFRG7ZqQwEY+hxtd57s+fB/msoGXQJz9ZafcEJU4l/r9zXjminu2LYbz+Hdo0XJ1esqyAUrvV1VmSaTXLB4NbH+ghQUufV/b0SbwtGDFPrEVyZzbC98nkwItwYWYQ4nIjQSjgqyO5uk3UtSTZZpABq60SBKBnZe9isH5o/8gVi3fWrz3vGxu54nVsbcJaUOKkNIfx1ahR2/71r/tEa9LuMsHROzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DS0PR11MB6544.namprd11.prod.outlook.com (2603:10b6:8:d0::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Tue, 14 Oct 2025 18:28:41 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 18:28:41 +0000
From: <dan.j.williams@intel.com>
Date: Tue, 14 Oct 2025 11:28:40 -0700
To: Dan Williams <dan.j.williams@intel.com>, <konstantin@linuxfoundation.org>
CC: <ksummit@lists.linux.dev>, <workflows@vger.kernel.org>
Message-ID: <68ee965885b90_2f899100bc@dwillia2-mobl4.notmuch>
In-Reply-To: <20251014071530.3665691-4-dan.j.williams@intel.com>
References: <20251014071530.3665691-1-dan.j.williams@intel.com>
 <20251014071530.3665691-4-dan.j.williams@intel.com>
Subject: Re: [PATCH 3/3] mbox: Add a --add-link-note option to shazam
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DS0PR11MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe9b991-42ce-467f-be36-08de0b4f7ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekdIdnUzYzdwSzZFcEkySnFTSWw3Mk50a2c1NGw2VVpUaUJ5d2o0ZExkbHpQ?=
 =?utf-8?B?RW4waVBRQVhueGg5MDNqV1NmMGMzM0czcjRzS2x5ZUZuZFdzZGJ1M1NjeXFR?=
 =?utf-8?B?Q2J4VG5BQWcxK1RhbFRzdHBybW51QUdoQlZtbFJYWDJ1MDg2RnNTOXNPRVlk?=
 =?utf-8?B?aEVmeVo1ZHArM3RudzZiM3lDaW9kVDNGT083UGlIWmJmSkVtc09wOFVaNjdY?=
 =?utf-8?B?dG80ckJGSmt3Y285N3NMT1U5b2t6S1dKOXl4a0twOXRlZkdCMmpTOUFmalpq?=
 =?utf-8?B?UUgycjc2S1Zib3B4S2wvU0tIOThqY0VEZFJQQkMzZnd0enFYNk9VY09sT3Ji?=
 =?utf-8?B?dStLVGhRY1lQZ3p2Y1hYMWNUNkN1cnRzQWZxdXVveEtxRFhWeEVHanJNSXVI?=
 =?utf-8?B?TFluMEd5d0VnQlc5Vm0vN2hDSW5LQ291SXhwNUZCK0Jic3Z6U2w0SUZhNWRM?=
 =?utf-8?B?ME1DWFlxTHY4UCtwZWxhRUJ3bS9NUHJ4QzcxZmxvc2pKWmV4anl6NUR5Q1Rn?=
 =?utf-8?B?RlNQS2tmQ3NrLzZCMUsvVmFnenFLTDJqMFZub0NKcVhsYWFxdE9FZjZQTEU0?=
 =?utf-8?B?WUlzc0NWZS9JYTVzcjRCZWJLMWdURFJjVDFMNXRjK3dUL3BLTTJ0NDFZS05x?=
 =?utf-8?B?ejNuOE5ZMDk1MGtkeU1kdzdnZ1pyU2Z4Y1FBL0ZPanVrM0RCL2p2SGQ2aDhv?=
 =?utf-8?B?QzlHUU0zTHFDa0ZwcWlITFNlK2FCRU9rQS8yb0I0dDZNbXRHZHIxaiswSFVY?=
 =?utf-8?B?NzFaKzFOeUVrMFFHYXNaYk9GRVVLVWxORnQ3dWd6cUhGRjRxK1NLVHZjbjhV?=
 =?utf-8?B?TTBWQ3VaRGtHYittKzF2R2V3RlNoWmF6RklacWhnRUszY2t3KzNPeldNSUZk?=
 =?utf-8?B?dENVdXk5MjU1RzM3bisrRi9JSWF4aXNRYisrSkg2RzdTcmZ5SFRnNDdWNmNI?=
 =?utf-8?B?a1Q1NThtMGhkYzdzUUp1cytmcmpLa3owSVRsN2NxQnY5WEZtZ1BKL2Q3WWYw?=
 =?utf-8?B?NUl2NUU0b2ZSckRteE1DNkhrZjlrcmVSbDJlTWw2WjlGZnVrQVU5NTYxekE5?=
 =?utf-8?B?MXg2Q2tndzBmYVdYUjVXbDBJampIR2lFQ2dGZFR2cy90V1VGZVN2cVlwbHdS?=
 =?utf-8?B?N1ZEcVllNS84RFlnMisyUjRheE5kbkZmUEV0TmdQVFlhZmNnS05LNTBNMTVi?=
 =?utf-8?B?WnJWNE40eDZRc1kwbG52N0g4b1JzRWR0VHF3TGV0NEYwT3NrUTlzb1VjNjB6?=
 =?utf-8?B?eW9KYlRncFNaV2NUYjg0VjhwVHFXTzQ0WkJnQU5FMXBkbjJ5MFl2RFV2RzVZ?=
 =?utf-8?B?ZXlPUGUyOS9reTc4b2dsTDU3aHB3dngvSFpISG8wRGREdGNuQndhSitXTFBR?=
 =?utf-8?B?VXZHWU9Wd0hhaXFlOWhBNFF0Y1VMOGtKUHVIY0hMQ3duZEI5ZmU0UFFlWCs4?=
 =?utf-8?B?cGxucnlGL0xsYytnck00WFk3OFY0Z1JmaGZRbGJuR2pIcUF3WkkxVjFpUmVm?=
 =?utf-8?B?c3NXRlVFTVp1NTQxVTRHV2JuT1cwVmQ0VlNYNnM3dldhYVJaelZCUlEwaEtC?=
 =?utf-8?B?L0cxQ0pIUTlxcE9UL2UzQUJZTlk1bW1jcmdTczVxU0dDU3RKbThqWWROa0Vj?=
 =?utf-8?B?THpwVk9qTnBoMGpxMTg4Qm92b1FEaWhibXM3WDA4M3IvL2JQeDV0eGsrbmU4?=
 =?utf-8?B?Wm5SaFRkdFFBK3MvYkhrSzhueWVsYkdRekNyZTBvc0xic0d4dVRxTnBFUXV5?=
 =?utf-8?B?ZDY2VkVLSkRqVnpyaWwzRDFiODFHcVpkYWdDd2JKQkZLMFA4enhHQ2NqV09G?=
 =?utf-8?B?NVRNWHRNcTY5dURoQWhFT2FWRW03dml4UEtiYWJxdG1QZ2pyTTFLTVFEMVky?=
 =?utf-8?B?SE0vMDYwbVNtODJ2ZTQ0aXNZQms3Y3NwM2VIdVpxdEJJa3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXF2T2JqUW1oSkxQY3QxL0duK2Q1YlFsS0FsSzhTeG1xWGttclI2WFVlQU9H?=
 =?utf-8?B?dDdwUWZTaXhYU0Qxby82b1ZNdG5nSVg1NktJZHJ1Z29aTXl3K3F4YVlSd1ln?=
 =?utf-8?B?bVZIRmg5VVFibFFFWFNMTW92MWN3V1Rrekh0NWZzQXBNamIvUEthYktFUE1m?=
 =?utf-8?B?NVlqVFRUempYMjI3NkJlM2VWL0laY2ZNTE1OeFFiUEFuTngraXVDTDZjODJW?=
 =?utf-8?B?eFpFamp4Z0x1QWFoUkY0cnJpVE04YVk1UjJzSTNhWjR1VmpoZkRMTlFtcCtn?=
 =?utf-8?B?MGl0VWxhNFpoRnIvV01aQXpPT29XUno0QXEzU3A2WVBGWWJCUk9hZnFZWWlW?=
 =?utf-8?B?V1BXRlVTZG1sMHIrWlJYRDgrcitZaWFzT0VSSU5zMlo1SXZidTRFZXE3T1Uy?=
 =?utf-8?B?a211V2pNVUs4anJlcmtjcEw1dXNJbkVXZ0tGM3NYWWNDcFJRdUl6cnpBdmN5?=
 =?utf-8?B?Q0xFbm5CODRMcXgvemp0ZXdpWk51ellZL3h3SEh2RjVFRFBDcHlIK2ZLWjBl?=
 =?utf-8?B?aVVYZEdpSlVDRElTT0dBMFBGYVduaHVyWVpvV1cyaXV2RjV5RzY3TVVmNnNv?=
 =?utf-8?B?VTF6N29aazlNWU82QUhEWnVVcittN0pvZFRxdTVHQy9ubmxLS3JnNjNIZ3F2?=
 =?utf-8?B?bG04MlNzNVN6d2J5ZGlSeWxRcmJ6dGpneGFYYXZtSlRYQWY2SGcvbHE4RGJR?=
 =?utf-8?B?Um9lWnppZ1NucVhFQXFDMDR3enZvbmV1aVBVU0p6S3ZjbERGaVdIaEdFL1ZC?=
 =?utf-8?B?S09XNHQ1RjRucUx4M3hmekhKRVV4amdQVGhZSVFZcVlxdkNkVmdWY2crQ1VR?=
 =?utf-8?B?U3UwQlZsZWZscmxpbGdaaTF1UkRUWGZpOXM1Y3E1RmFTaGJNTGYreEVtVkJo?=
 =?utf-8?B?ZVJJUzBjWUI4WXhUVmJGaEFOY0g3VjlhR2MvTkJYMExoSTlMblpYNnBZeFF0?=
 =?utf-8?B?b0FvTU8zVHpTVk1YV0ViMjdiS2FHaERCSGxoYm9scHJjd3Zsd0YwOFZ4RS9Z?=
 =?utf-8?B?QWMrMG8zM3BpL2xkS1BQcEZacjMwRFJwQkVnTUZlL1BTTDJwTGR6cWJKVDl6?=
 =?utf-8?B?cURaUkZmcDhoZWNWUUROUVZZNzFvdmdsTCtKNTdHRENydGMxb3pRVlFOb1FF?=
 =?utf-8?B?ZXVuU3ZQVDY0RmdRZWNJU1hoQjg5YU5YRkR6NzRRZGpRdnF2S2wrR1c3WVcw?=
 =?utf-8?B?WnUwWXorL2RrMUUxdy82SC9mTFcraEErSE1rdEpObisyV3pIb2RpY2g5S25V?=
 =?utf-8?B?dzBPVUl3djExaktTaytiNDl4QWJmTlV4Rm1aMUV5NmxVdTZHU3MyQTlOMU5m?=
 =?utf-8?B?V1ZTVUtRTE5uZ3dXRHdHMXdVMVpSb2xrNmludlJwN3VUY0k5eStWU21xTkUw?=
 =?utf-8?B?bXlkcW9DbFJ4UDMyYlQydjlCcEJFRUdicTIrUDMxaEhQWGFlaUNRakQ3S1RF?=
 =?utf-8?B?djEvZm1uTU00Uk5ZVTlUTk4vdjNGRmZDemtnUXR2NGMrSk9MMGRsaEMvVFhO?=
 =?utf-8?B?VTNGYXdaVmdtUnozaGFvTjZucFBJcmthK3FsaFF5d29KRndYQTAzL0FBL3RF?=
 =?utf-8?B?aldmenIzUXFQZDVKR0cxTk8wOVBlTTRhbjVwbXdvQTlzcTdwZW1aSURIRmt3?=
 =?utf-8?B?ZkNGY1Ezakh2Uk1yR3pBMU56VUt4NkdyeDFvMnI2TTZIdXc4NmU3TVVTOW1P?=
 =?utf-8?B?ZjF3RkpaZG54SmFKZTFESlVYODVvb2gxVk5NVjhrSlpieXVLc2VRTkduT0tH?=
 =?utf-8?B?MGp2bDFCcXJoWmkwMS9KYkprTm4vRmtsSExGMUxtN3JRNnBHTGdHY0hrbnJt?=
 =?utf-8?B?NzZYQncyY3VDOHpCLzRSV2FhVHRtN0NNMjUzeDBxR21iVGplSkV6MVpDZ05M?=
 =?utf-8?B?S0xyZHpsTEZxN1B4bGp0RmYwNStTNU81eXQ4UFhkR3cwMkxuSjlqWmtlbDVl?=
 =?utf-8?B?em5vWXdSdmhUMGZJNXVKZldoY3M5cGRyWGwzQk41OVdmU2hHQUNwOXpMalQ1?=
 =?utf-8?B?bGFwb2dmMkhSN1g4Q0Z1djBESURpZHVpWTdhblFDUHl5M29wOGcyQXhyRU50?=
 =?utf-8?B?UTBHQmx0dHBtc3VXdEdWMnBpS0FRZUZpaFE2bExWaTJldnBNdGVtcUgzcXBv?=
 =?utf-8?B?SXp1WWlwNTgvd2JJU3I0KzFHWm5kWEV2cnRuc2tFNzJkTkN4enZEVHJ4aC9p?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe9b991-42ce-467f-be36-08de0b4f7ffe
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 18:28:41.2963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mBFoz05BpI3qBWcekJRuzdGqUNbw8++GWE7rZDCpgFYkafcMBfSaq25rPmQCUQkLlvYcbEAZyXsU4zqYMOHNnJ6OGmAcEg1TIguPLFvTAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6544
X-OriginatorOrg: intel.com

Dan Williams wrote:
> While the Link: tag is disruptive to some top-level maintainer workflows
> [1], it is also useful to a significant number of developers and subsystem
> maintainers.
> 
> It is also the case that dynamic patch-id lookup [2] is an incomplete
> replacement for having the submission Link: trailer readily available.
> Specifically, navigating to a patch on gitweb or displaying the patch in
> the local developer tree it is convenient to have the metadata inline.
> 
> A method to have that metadata available without polluting upstream is to
> keep git notes locally.
> 
> Add a new option to shazam that annotates newly applied commits with the
> Link: trailer of the submission. Honor the b4.linkmask option to use the
> preferred namespace (patch.msgid.link) for these links.
> 
> Note: Claude Sonnet 4 was used to help early drafts of this patch, but all
> submitted lines are authored by me or copied from other parts of b4.
> 
> Link: http://lore.kernel.org/CAHk-=whP2zoFm+-EmgQ69-00cxM5jgoEGWyAYVQ8bQYFbb2j=Q@mail.gmail.com [1]
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  src/b4/command.py |  2 ++
>  src/b4/mbox.py    | 58 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
[..]
> diff --git a/src/b4/mbox.py b/src/b4/mbox.py
> index 8810ddd71b21..9479b8995019 100644
> --- a/src/b4/mbox.py
> +++ b/src/b4/mbox.py
[..]
> @@ -547,6 +552,59 @@ def thanks_record_am(lser: b4.LoreSeries, cherrypick: Optional[List[int]]) -> No
[..]
> +def shazam_notes(gitdir: Optional[str], lser: 'b4.LoreSeries', branch: str) -> None:
> +    """Match commits to LoreMessages using git patch-id and emit debug info for later git notes processing."""

Whoops, this stale comment is from a work-in-progress debug build.
