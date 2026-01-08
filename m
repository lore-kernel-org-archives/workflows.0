Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29054BD5A4;
	Thu,  8 Jan 2026 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767873448; cv=fail; b=o113YytsNwrHHDKpsATMg+UiLZOIL+Wqg6aLsfyoEcgEL9fxU5Ut/Gu7A4YyNTAj77u1kDK84Bcpcy4Lkq5Jp+rGgFhG3ZlnufG9RVyTx57HEZtYZ4JF0tUD+IYuDkfpdY92txXgusT5Y1BzyW6P6sD3BeuP70y/VeHK2MmS97c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767873448; c=relaxed/simple;
	bh=6lRb6+QBVUj4osNRgyCGJwxZn8aZuxLkgb1lEtKWs6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U9hFb138PuQf9Zxy5MKq753yzwUE1PKufnphH3PjslKiggmkUvE5Cql0+mkmqkvyr2q6tfZVHL26+H6UqJWe679M5dwVzY93r39nER9mtVBCN2LDwkGzS/nG5NN9Zj/mMA6wyo5pVaTdJSD2LyhOZTKhKyMXAPgKfoORReauKes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jYglaBgD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UKX3KB4X; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jYglaBgD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UKX3KB4X"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608A66VV300141;
	Thu, 8 Jan 2026 11:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=D1R13D68vdV/2Hwhyn
	U24do755ZuloU10v7EhyCdd1s=; b=jYglaBgDyb5vPo9QXsY6PUwCSWqfBQL4MY
	mfBmvkYGorcQthkuM2g+5RL6LHyZy1wfXezXrUsdxomSg6vt8/mkVQnFcX2EkHV0
	LKMqSSOA7DZ6gZw/nCdDoUUdGPgoNBL2cogclKQZ2SOxEmDMbWmKo4naan59xbMI
	iowbZNfnmI7eaMbmwM918ZaYCfpHNrjWMNE5fENNpCTa4wqZ95e0WiXKJS7aLB5z
	4KocB30fki0Jt443/Y3lpCByjfB8jPOYig9p1iQ/FLPclHWI2+U2wRiBnhTSyiK5
	3jYuYn8kMshW1ws2LA7/jLap8Y/Ncmum/N/cg33c7yu9CEOFYWdQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjahk044s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 11:56:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608BhTWR026350;
	Thu, 8 Jan 2026 11:56:20 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010020.outbound.protection.outlook.com [52.101.61.20])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjn95s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 11:56:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCJnv1aMV8iQZw3y3mL+HVadEAif8zLXd5TY9RNSSuV6ivk1Ax27T/e2NEM6spfI4aKdxRs+n4po516aMImFPBZvx2W2HgmoGcIoMOwIIFl7kZtCXRUOMl6GLkuu7wQFfpDYvD5B+Vd/1WIecWlCcgsysA1tD6DvPKfEY046Jt/Xdn4xzYH/pRK27mpoRvqKo2pvD6Dke1g1Ezrt9v0AGjavejzCwMRmbzyfNbPT+wirGOb3pQwMXqfcR2szQR3ZLYGcdRHv8FqgMMQW9xyNP7I0DJMYziWU0PPwZG+TcB1mdFq/Yn8BrWwibmeSc91foOiHdrCEfgJJ2sLbNtAlnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1R13D68vdV/2HwhynU24do755ZuloU10v7EhyCdd1s=;
 b=Klm9w6VabaaCYDRUsGOS8prUGunOp7bcT8HdfXKOkhNkCvwg8SPKBPhXC30tiT5AnVmHKzZKasHx2Ymg8vQLXCrH+hmE/bgq1tSZfRRFTal7jrMjQiQBnjlCkhV+Dyn4F3goOXfu7ryD4+a06PtlDLsuKlJGpBoj/7XTqUjvXmEAosUQm7Wny+fx1oQz5wZRyPd8TAnMUS2gkaoNiwDw4wtaQLloOsBb6we8Eg/y3I6YYe6O1oJHdPriUc33MGm7XVEKrU6swCvlVCNfp2Vdtf4KSfpiJxYv6Cprnayo3NDcsQdLJbWP60PQKH3xl2CYFMg2zXxC6kG4x/0ExBRSEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1R13D68vdV/2HwhynU24do755ZuloU10v7EhyCdd1s=;
 b=UKX3KB4Xbzxjt8OdQa9Ud4j6GCIryvl4aWsozou+mN250zF9rF8yTuDgjNXiKoRKmUkUZFq/mvhJ3LymkqumP4cNfHjSZmnBuuM5bugN+22B5IgKFunc+ilx1/xW6jcE3JhquqxOPM4bSgM5z/V5aGQYjIGkO7MIZeJJzZjfxhE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB7113.namprd10.prod.outlook.com (2603:10b6:208:3fb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 11:56:17 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 11:56:17 +0000
Date: Thu, 8 Jan 2026 11:56:19 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>,
        linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
        SeongJae Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
        Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
        Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
        workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
X-ClientProxiedBy: LO4P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bdf0ca7-0d4d-4b20-e4f2-08de4eacee47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SWmixz76ZmD8T/lqR7VzypVUzxQm7/MfZlpDQZYy18xzqFkRTs14R5EI6Bul?=
 =?us-ascii?Q?0PVZcBxJq+gArVusKfO6v3QE/ZaNOkPdWb55ow/7tHfRbQCXY99S3+sFOGYE?=
 =?us-ascii?Q?LgpX38Y9p3yI6J4TssmigMtWSn4l9qsBOopj8+MEodjsVFu11g5FzHgWi3ml?=
 =?us-ascii?Q?tsx4QYahi/38SXqK3EyjROJqmhlMXJfxkAm/JH5Vgh+UWGZnbbLEhkiCAtpR?=
 =?us-ascii?Q?a+wdtUUEc+1sW/rooHIpFXe1TXhDsTxVZu4doOQubZxGQOwXtu1VRqtBNTtH?=
 =?us-ascii?Q?7FbUumCwRPSjFWU1aZse0uss+MVeNbl88hBQF33p/XKOh4J3N2J2hQgEJXZ+?=
 =?us-ascii?Q?+Xks0OoBKCMRHD94YLfrUsO+YQpVKMORUW4WierHxDPH9gODepMSSWcbZnf8?=
 =?us-ascii?Q?0SjdlCIJOPu7UqNcqg35enMaD5XxKLnCeeLCukYajbyxCdZiQSOHBzr9M1Ot?=
 =?us-ascii?Q?Xgni0DE76wqFJ6YL6RUdb4+XwwcuSPYNBe8Yc95tV0e+3bL02aqRFlk3gqMu?=
 =?us-ascii?Q?51Zv4jPPY7vttLqbjqpzbkImt2QG1j1y6r9MKVrAKKiNHWk8vKA2M75WdRpA?=
 =?us-ascii?Q?msTLPcyjAtfYth/jYqLCi6nhHWA+W2TpWwxMVE9qMU7HdragI0829oarHlEd?=
 =?us-ascii?Q?BuZ15IC86zyNEuSHxetuEXRKHmSaysFU0iK/gpgOY1W3OiIeMj2SSHFxfB4f?=
 =?us-ascii?Q?dD67UwE8YoU6TxfENGGcDhqaH3/cSNnBuVSxemRHUW45VvhPvXrTq3/sbHfO?=
 =?us-ascii?Q?l4lpye694sYUuDl4RMvH2olgNal0tR5t6FGuQrvgVzTAZ7/jzpRaKWfyHGFp?=
 =?us-ascii?Q?Ep+QFX4JsQs67/Xi9ZHEJGUB5jIbCv/5tj3A106VEf/DcURJ0yCZ1kGApfpo?=
 =?us-ascii?Q?cIE0/48olgamMum30SQ6ebChqsbQ99M/pTmEosumtxiEV6ZeP9vvomh3OFzA?=
 =?us-ascii?Q?28hIKF+XJHU3Eo7oO/bwX3na4vCoOjmchp7TiTPsgiC++TFaMl1BRVFDMdTg?=
 =?us-ascii?Q?NWvsW/gsQryV1Azhk9KlRzOvDNVJ5zO0Xi0HFIyEVieghIrQ4iG5dGHlmvfX?=
 =?us-ascii?Q?4l0QDApPyPr0GAp/1WRcF4TvGY/wJDRJIPyDVZ6lnsn5/HRBb1J9n7jJqoXO?=
 =?us-ascii?Q?HekS+vSexedXyr6s5UcZHqS1GkhEjOp+eNWJXR6O3cIb/y3a1ubFtJYmSG2w?=
 =?us-ascii?Q?wo9HOifJWi8jHcFkt9AruYUGfFVxxSF+VVYwzRAC3IhMfEkOtBbn//QVms3j?=
 =?us-ascii?Q?r7l2dCR0TPVh6LPiWgnpyhIzBpVsJwlDbaUVe9i0ie41iqRVIS3A1FS6XQbC?=
 =?us-ascii?Q?PJo+8oihIaGBb1jdjyDB+LpbdA+p7jWi45T8OVMB53VLtKC0tSASANG6w4vb?=
 =?us-ascii?Q?8dMFCKgoTeFfIKIbwmzTLsOwgnelhzbpgAntalLYVzbmEfsjh62wVvaHl4W6?=
 =?us-ascii?Q?0GL6tfrZw7gauuHjIPfAuUlq0KdZb7T2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YXawNAo0oGtstOWRULljdE2m9S0aU4QZ8JbLCxU0J4hjHMzqv+/nsYIXCHc9?=
 =?us-ascii?Q?d118gsfcZ3sOsik5VzBlkLbgQpo4XkJ/Wl68w7yOWIZLUSuBrPA+SYtHir4V?=
 =?us-ascii?Q?LLHWNiP4zYMyGtLhUrUCdvlGZYvA0y4D6WEfC1ppiD+lQNEuE9xa+FvXj4zm?=
 =?us-ascii?Q?xGU1xgAxe6yY4jqnAcDZzuZZpt69xEk/jf7XIQVVjVYctiXkoYHDxxFpkaBu?=
 =?us-ascii?Q?9SiVPsuk2n0fZVVkSED8qUhO7q0k652FNChaTZE2ImS6ynNoA6amHwpXBLbo?=
 =?us-ascii?Q?ryhBH5QLBKr/JPYCbFudSg9K8ppzZcLWeoTARS5mJn1WR5hT701hxljiNnwn?=
 =?us-ascii?Q?BkdrbJgh1g8ztikcFxrRDFIpsBsz0wZyPP69YLpkaNTH4q4TXcjnO/iJ+a7e?=
 =?us-ascii?Q?G9sNKBe4dYxl/NmQIugJYN1wWBDvbZIszP7HHCAFeb5DhDezADD0CJefA2dM?=
 =?us-ascii?Q?66YHJa/gjcEHMxt1Y5YTh3yq0jEs7C0xcf9Ln/nXuQ+fPZGIfDz6EmGDoChx?=
 =?us-ascii?Q?2o/tzuctq/zu6T/CnxPwR0FOBV2oGLYwCQMlZRDtu+Q0Au2fmiEHrxYDLntr?=
 =?us-ascii?Q?Bqo5nPHTemEEer0DZOxQRZxQ1qvhLXtdHmSxwMEL1bndcDVfKhK9zr+bG9Af?=
 =?us-ascii?Q?pPL7+5XXtnTgxTu0w8MFdF3H0GOgQSdctk8smTIPwupmHlPP0TgzLYONTQLw?=
 =?us-ascii?Q?JobJRf8/CC1GQE4eldcQZPQLjIMB13TgjiE08cCF8btBVwXCSVEDfP9O8HlB?=
 =?us-ascii?Q?J6KSjaxaEM++M7pSgx4sIdg+sRQZVm4Ph6gvkzbb/uzo4xUr08U0Eu7Vh3ve?=
 =?us-ascii?Q?qcScoNLgWomb1qs+vJmSWqIAxxWl3IgoMnm298LdPiWgAV1I48slEIfXX0om?=
 =?us-ascii?Q?1KOf4Fs5cWHRLQqh+Kn1dU2WPO5eP8x2iuLcN8lOQzq2TflyIOGmz3pcFPlK?=
 =?us-ascii?Q?kSCwnX1PfXCog2szQJ7ZrmrfcVuT+DcDhzCMUZp5dyb3b0OFhIxsfOpcg1KL?=
 =?us-ascii?Q?tC6L2pCDtgXvytazC7sYKAnuthTAE1XyLejgDMUT11jeNsMWfXwMutEmuao1?=
 =?us-ascii?Q?YdwsthOIGitzYPKc8IPgsQpPM5wd5dO9ryPyak3qwXcWgAM0A1/VPBR6ZENp?=
 =?us-ascii?Q?bTYwpgvtPPVXl65nCQBXe9dhxCXTsjeMq0dQ1xtYjNZwB/rtgBGyESqAal9y?=
 =?us-ascii?Q?rR0ptdbI+NhfsQEumqXXMiBj64zBbf2IhyL+ozu/bN3PfARji51zrR/NAteW?=
 =?us-ascii?Q?PzOzQ9zNPttCS1Uhf2VQo36NUmS+9iEDjQH2aowhE4aNS5U0b4CrsKS6xIve?=
 =?us-ascii?Q?4eT45WddVINVRrU2LLSfS6sMYUI0QOiJM413nUp1Lgsd7ma4UvaSaA0n2ZBs?=
 =?us-ascii?Q?R75EbzoG4k0sxo26mR0hcfWcfPhCPr6rDcMvcQek5oYNGY/De6KFzCcYoVNE?=
 =?us-ascii?Q?Ezu9/eR759MxqHI3i18sI60AfUbCRIY+Ikpi58VIlqzAOFZktRZY1lhjJBBj?=
 =?us-ascii?Q?++HjgRdNqqfsxX1bnA+04wHgWBlVNrv1ze8Tm7n8P1MPvsWarDSxpWutknAq?=
 =?us-ascii?Q?7cotwQnylxNHvymcWB4uciJ/C003AFxSwi2xwLUVn5mPMaVRhtaUZ9HaEFCl?=
 =?us-ascii?Q?nokuvWhbSbgNZ0YI/P5LuwmXiqJuZruhLXvrFqipoOoXb2mysmlSE5ONto+Q?=
 =?us-ascii?Q?ZnkePWTVqaSgpeSOR8RWoY++6qm/329lUfiow77Exb1BoGd0jEiYocBfS96X?=
 =?us-ascii?Q?sNkH3G/xkPrEGhf8FkjB+0Nz1u448QA=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cQVErY8UAKlOLp7SVG2+bjWWs2IJRwctStA/2avD/A9hrzyVnELjdlPqqbMXNu96TsfA/x7m1SzvSwcp3lleo2jDEKUC0MEvBKNpRbMkNwPrwhVCgUYh2cYBLWyxshp7QXngepwUyTbKth1Vc0DZcU5rdzpXVYbWAeG8EKrpJJR5I6NEIhxcK/CveE2ZwDr4dE4H7j80dgEJQMw7ANbyX5E2Yl7dqHpkgXKADU2trVyeSa5GM4xaCueGsmEuJIfpSJv3/tI/6PNw+ngXyo2p5hXad5GMK0iKnOpmAdRqfPHj1caGNa93/4gMSseW5cT3f0MPdkMnCgXID1P65oAP6XH+NwzeOB3wUg4cGk+Bx+9ErqwjLXJE+FXqB0qIoHntuXsaalRDOiudeqoRm3xrM8hsCe1E/QXPK5IUtPglSRjeGzAWiK42gbUB+MzU/ewdt/isg2xeFfAKxSsfu1pt9vS/eb4gTkV4w/ui4ihEEmyiQRpJsoea/Yc9Pvk+Ort+9b0g5i9I4JwqCqo8YZhbzvdkR0OvFYEbB5255E0nz+9pP3UMycIoXVE9+h9ezjY2tsn+Pjy/HEoX1kIZXw+ZjIVjjfFxwX8niR9FoVU6Kg8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bdf0ca7-0d4d-4b20-e4f2-08de4eacee47
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 11:56:17.3225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUu4PX+E6+dTeVIcN1Zr+1n7M0YUcoP4mkN1x9GZYe9oHlHHxmcjAJyfcGt3ltuWLhw59ERi6LPa4nlshKCr0EbUEypHJtXTjnldRiOQI2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7113
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601080082
X-Proofpoint-ORIG-GUID: 0c0UnGwm5a168fHAA15SJtHfMXDZnUSg
X-Authority-Analysis: v=2.4 cv=XJE9iAhE c=1 sm=1 tr=0 ts=695f9b66 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=VVau57fKEyiWN72Ni3gA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12110
X-Proofpoint-GUID: 0c0UnGwm5a168fHAA15SJtHfMXDZnUSg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA4MyBTYWx0ZWRfX9/uoejum9gzF
 EXRpmqFvsjHEagScmpcdGkeIVpLD1HRKmfRmRM4R20Oqh61+OSFUShwvr8HDOHI5cy8BjjTScWO
 JSwjWkdLebPh2Momfu7yfGEqPIzGzOJzuE8jxeCaPoMQ0QYxpA2cSWIUNvybkJ+ydpzXwTb81f4
 xjhr5TS87s3W+blAILyRFInGnYQetNQ57MmAdiU+BsqwGOsin801SV9jX8BpW5MyPmYfOYvPhIh
 COiXELehTGJ838Coi8H/v4RqqyZpOv+B2bkf0WGUqrfK7V4Gr4zMmSjvpy6aCx0Wn0BSRIKPvYO
 fw9k1XPrF7kYOAt+AfrQs3rckhg2m8pRPOcJGr7m+MXVsVuLmnnrqRRyITpsyCMzdSmNiyU41bd
 npB/PL6r713NBsly4mJXhHOpvUe2m4dEJg8Ab+fn/GT4CE+63eWOCJjzYxYGmPwHzNG1O3A47jB
 scD+ATIb1jCtiM8JOYFUORB7qvHC/tAYwKtH9xjc=

On Wed, Jan 07, 2026 at 04:20:04PM -0800, Dave Hansen wrote:
> On 1/7/26 13:15, Lorenzo Stoakes wrote:
> > Thinking LLMs are 'just another tool' is to say effectively that the kernel
> > is immune from this. Which seems to me a silly position.
>
> I had a good chat with Lorenzo on IRC. I had it in my head that he
> wanted a really different document than the one I posted. After talking,
> it sounds like he had some much more modest changes in mind. I caught
> him at the end of his day, but I think he's planning to send out a small
> diff on top of what I posted so I can get a better idea of what he wants
> to see tweaked.

I enclose the suggested incremental change below.

Cheers, Lorenzo

----8<----
From ccefc4da6b929914c754c2f898b0eb17d7fb3ebd Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Thu, 8 Jan 2026 11:55:10 +0000
Subject: [PATCH] suggestion

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 Documentation/process/generated-content.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/process/generated-content.rst b/Documentation/process/generated-content.rst
index 917d6e93c66d..1423ed9d971d 100644
--- a/Documentation/process/generated-content.rst
+++ b/Documentation/process/generated-content.rst
@@ -95,3 +95,11 @@ choose how they handle the contribution. For example, they might:
  - Ask the submitter to explain in more detail about the contribution
    so that the maintainer can feel comfortable that the submitter fully
    understands how the code works.
+
+If tools permit you to generate series entirely automatically, expect
+additional scrutiny.
+
+As with the output of any tooling, maintainers will not tolerate 'slop' -
+you are expected to understand and to be able to defend everything you
+submit. If you are unable to do so, maintainers may choose to reject your
+series outright.
--
2.52.0
