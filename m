Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CF422CBF1;
	Thu,  8 Jan 2026 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871812; cv=fail; b=UbVOad4FBshFqHIkp0CYU2cZgUe31bJobYfn4CINHhxFrwFefVvbeIlhC/LgUbh5XhKLq/SEStfenBbig8EaebOYHZe4yCLuRXsVymE2Hifa4u72dqFPCxF8UevaENxbmltgSsOTbTXDOsDO9pObMG6o2jvFBChfH/rnORd54mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871812; c=relaxed/simple;
	bh=TLfKg6Ljb6SMq1i/Pj5fDOkStNQewg6SJpR8j0tnL08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=goquWV4aZ1HLoIy/ysJLXgavxrqE1wwW5Y2+yi4YvQM3Uv3r0hFvOKM0Aga2cAZyGveTbgpXKws5oDOLoqMHbgr1GsqsQMUgtvA7DkoLC4ToA0/3zgrrsADGpKaUphl58/+k1r4eYqdoflq7e1fIW3CqsqNni0XmcAfjQctpBxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=at6sZ/qo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LIm3fgoG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="at6sZ/qo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LIm3fgoG"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608B50JP524084;
	Thu, 8 Jan 2026 11:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=b2trd1RxfM5kWNT/i5
	zsinNKd1x7sc/Mdk6qg8NGed8=; b=at6sZ/qojKlWXBSnTaSP8QZMHsysTtXsDR
	SC2zeP5iOgovKnPyr/vUbNgzTc+DyHQtoA662LnITv+IqDzbVAADfPPEYn1XAqFW
	8258COAmbpUezMQo7S0B7/n2prA/CzVv7fqPU8U7PqJHN3tXRmIRK1MPSUswHvXD
	PJVS+Gy6+Vb6t9iOGCD3BV/XJu0kgaWMq+UMva5mj6Qfn4NL5Uw16P/19rnwLhVZ
	VM+8iiRNZ1bVafO6AHXXZa3fii51McxiYZZoHjbUSfMp4FLZPZq00y8GNnVg+j/t
	sZ6RywREK1KbVd/qHH6RLcyNc6Yx0+K6yGfLmRdrdUr/+2qEJIQQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjbd2r0qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 11:29:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608BEOb1020440;
	Thu, 8 Jan 2026 11:29:48 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013021.outbound.protection.outlook.com [40.93.201.21])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjn0dv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 11:29:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/0DrvWtEcrpmglyraF4JjQ4bVLy9U6ZqsgbfO7ChU73/O8xgC8xYt9UTAvLBD8QF8rMDVJ8NiUoRTVRNOzNPNQRDhAS9p1N7BNSm+oT5UQLZxghr1xBDJqXGQZoVU9v2JRa15PK274oyyfMGqmT478j3YlfMxOfPJEnxcR8Zz7qirhtAuEsQH/JkRbl/g3YRlUYTqym0wGSW4pwwMynWsUnIWTRIh60kv2AXLvMqHcXl9c85IhiP6wNRfP7bur3JtIkG+okEs80LzImFqv8uZsmZ/3kGq52wFoJJDOzDaViSVpZu7pb9NtpuEB0fp6IYKyIhVJ0pGq6s/nDGqxpNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2trd1RxfM5kWNT/i5zsinNKd1x7sc/Mdk6qg8NGed8=;
 b=NDkrJhu+1wbZ2M/gGBEwaCg7toZLquntEs6vm177DWLOCy1C55xU6LnPNlzjibfHBukppREM70NajWIl2veouyxlAlllJKLxpqcDc1gcgOiwaF95T+OIAP6jY4PO7CsFPL/ReodYhsQZ+cQQFws6s7aRk7IESUxk7mPS+0wNVJoFqG/KI4lVcq+4SqkBWmG4QGmRtMtHNbwFwLI0Bg+eQjzrkeZ0eDPCmpZJUMs2lTRBGR6iFrmAMarMqCt7tVVZm7L1ZjQ6tnPmnf4SORubH+oY20IwR3tulvKx8Mn46QDUPns5tw3oll/Fko5nC+q0SGqm5Y8VPzIsc35a6W3Tog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2trd1RxfM5kWNT/i5zsinNKd1x7sc/Mdk6qg8NGed8=;
 b=LIm3fgoGDEANE4nhZWv1Oh/tgLAk8tz352PvEcEY8pbO423PwS6qFxWqPobyY/K5AGUpkAxajzF5RoDL84RQFO7vVqJ55MGWAkjr7h0gYCQcemSKYIvo53FH8OvcYGKvFeTTxhO2n+oy5m7f37LPqmjulMB2rVLh9oiD6vlW2G8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO1PR10MB4418.namprd10.prod.outlook.com (2603:10b6:303:94::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 11:29:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 11:29:44 +0000
Date: Thu, 8 Jan 2026 11:29:47 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>,
        linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
        SeongJae Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
        NeilBrown <neilb@ownmail.net>, Theodore Ts'o <tytso@mit.edu>,
        Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org,
        ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <f72c3894-f83c-4bb9-abfb-afc2aa22c705@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <20260107165816.63ff25ac@gandalf.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107165816.63ff25ac@gandalf.local.home>
X-ClientProxiedBy: LO4P123CA0615.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO1PR10MB4418:EE_
X-MS-Office365-Filtering-Correlation-Id: cd29aabb-9380-4487-79c7-08de4ea938f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Csv/vUzPgK790pByav2JmJXoRMSA82UR1MBMHbCfAtODgNB5zhBU8SF1rktM?=
 =?us-ascii?Q?aRU0aI5JwHFjUMOh6WtKSlsteEHgi1wB6BzpI1JgqK9Um9zuiHMxX1vpAFtz?=
 =?us-ascii?Q?o+3VcLbCJAbftt5BYeDR7ZB9d6TN/Nd9dafBT+bEKRp+/bW0ar2+4EW2Fh1q?=
 =?us-ascii?Q?20AEk0+ZATmp/W9oNcthA3m6zaGCM45DzUFQOlV50HEawJ9YiLb1XE5AePyV?=
 =?us-ascii?Q?2iGxZz4h5hLVB03g+lFUIJN8xTgrngjKfPXfe5ROj67fmRSPJA4ebibrK8Dg?=
 =?us-ascii?Q?7ST07Wl9MLfdl4XGdjXCBDLlKtsQtdQ6bsinRCEOq3dpBflXvRcWH26PFphk?=
 =?us-ascii?Q?w32+AXWC8luFE+0ctC+bvsgPZA50ENNhgqa9XIQEPnIQmSgx3SuqtvVE/WRi?=
 =?us-ascii?Q?PVMHAE1jm5x6Cps+FJMQauari3a3C+/ravh6hTsd81/w7W6Q42sQUmUI+nBA?=
 =?us-ascii?Q?qSca4pl5QVGSmg9IdExjWDIpTB7/CueBxIaZwCvMIGPxzB+g5/H032vCUtsg?=
 =?us-ascii?Q?uCCXb0ju9lurVyCQWS8HrKQK7dfPwv8nG3XFURIlx52sGdy//XrGu33xJdpP?=
 =?us-ascii?Q?nlUOAmJ1OfFUBltOBM9oHiJSOG2FmwqQzSOc84fPC1/7GzRi5revMNT33xuR?=
 =?us-ascii?Q?C5gW2fCBFyRAw1wpuk53nOL/+u5efqyoOIxShXQVfuNzVefr7Gp1X6e8zcnk?=
 =?us-ascii?Q?ei99OCXbovJm/Fwrkz8z4nq49kXs4hpjfh0XEI6iAZI6A6W/hrlVcyB3EJ+A?=
 =?us-ascii?Q?Tq4A/xRhXTNF1HRJXZvQB/Kvs/MZY5u5ZpfgfhT0WYSEobyvpmsdelZRY+M5?=
 =?us-ascii?Q?UbNDN4mUxQUezlLIib+0pdku/G9gS7aiuKKwK2fruaFujTJHNtTN5gI+YVMV?=
 =?us-ascii?Q?bT1C9ixxjFYmNBmeOY+jhI1UzBFScy6Dy4WTPezkc/A+SepoK78+i7BUVFDm?=
 =?us-ascii?Q?/jQVEvFKoqN6iRDCgO24DT9PDUXnfOoi/70mwl6vBkcxYvZu2KiZG2volZSq?=
 =?us-ascii?Q?na4GJMTc6nfmOUZgZMs4FMlOyA4vTnp1WvQeC/6R03KVPP0gVKYVY6BbGvlr?=
 =?us-ascii?Q?QGVZElCAp+wvMLzCNbkzEAd9yQeHI/creTw9sXBLAzAsXA1S/zVElhqRnJAz?=
 =?us-ascii?Q?T+26gJ4uXoIpCWtrvlAWKuJG+VnmksAMahc+bPurZJLgdRJEnAnpW2vVfjH5?=
 =?us-ascii?Q?dZ2xlP5+gl57Jt6PXOowErHyI2XqAmNrGoCTFc+iLHflTskYX/OqRQwjYzLy?=
 =?us-ascii?Q?Z7i0tFqgEDLMNj7JJcXWjh8Dyw77aRUz1J0SZ5aSAHL4/j7YVfaykSbenJr9?=
 =?us-ascii?Q?CwCK0WzB2vYo5bBeo88SmTdDZ11EpJomCiF9WmFid6zJroosJXEGthpp9EI3?=
 =?us-ascii?Q?M18nPlYtJijdNfyirlqi5sebdT9kZouIp8XRwBQ2Koo9XXbS29YOAltXqmn3?=
 =?us-ascii?Q?hVfY9ULRpfa+jBfrMTRxSLcYZW9WYwKFDjyau9V0bbGJOrins0Cv9w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ckKmy/W6mpcFVOwpfX5cmbjwWMx3SC3P1Cr9VI38yr7iu186Cm89/wzmfQvu?=
 =?us-ascii?Q?9LYQ0K7FOMLpYYutknXQAtYm6XnQvG08ccPUnFLbslaJr2tx2X+bwZYnqdYT?=
 =?us-ascii?Q?bKlwmpvZnEfTWdjzgwVQmVRgcR7cKZr7hcYFF2TXE9TciMVWQr2XwI+tUSUa?=
 =?us-ascii?Q?dBkCG9Ezy9GEs/YDMNLah/yl4fcbB0Jirc0MdMQsIN4dfIeFemWlY0JhwE4B?=
 =?us-ascii?Q?2562TooMWcdwCfE0q3YyO0V/3aTJjOWfjKD1xxzfcJAb8C5xLebiZZ9nODX2?=
 =?us-ascii?Q?rICbaLI+coJhElW7Irp2xldlsFRDXuHgOcnGY8b6/Z0s0zRuOrgphRjQRhMn?=
 =?us-ascii?Q?dOq7X8w+7HjPk4pAroiFHIGyXqmdwJWHJ3zEZrwB9u0zyhn0Ifch2fDsbg90?=
 =?us-ascii?Q?1HeJWNpXjJ3xfbb9bJs4iP14euD/CgQykoPdTd3o53IsNG+WNo5KuW/MKqcj?=
 =?us-ascii?Q?BI+mpKHw0r3KxjAkXcpEDYXnEyHu63JFWmsATmmRhYuK1S0P65paGB+d+ENj?=
 =?us-ascii?Q?UJ17lx8BSbV2S3dAHE3z61bNT9yR5fDiREJJ9KpjjCABl4vDscIgYjpQlIDL?=
 =?us-ascii?Q?rNWoXM1UxxWnq6NJi+JiE4iiC7To2QKwvDWtUIuCvnwHnfOlmQOEMEVRMf15?=
 =?us-ascii?Q?eXSJh4fhxz79CTQ3j6U1DUvQzTgpwP3PbclC5kaXUPh2DodLrD2BuOYmC3Gq?=
 =?us-ascii?Q?TqGauR4oHZS+Jl4EEFzZI8njassHKcHHXYyrRZ6jQQ+RzExp0Zjr/6ctMQOu?=
 =?us-ascii?Q?1+IqdF+06XmauN+PDPMPuyrKByZSu9kxVHPLlMMRcGUgluX9ftwUfWsdlvX4?=
 =?us-ascii?Q?/yNX00bCpOErV7u6GNLUP5Iod47UeMOIsjFzQlPmlaI+gln8By5Ol8+Zx1hh?=
 =?us-ascii?Q?7S8ZwBQpcphqKTH+ZYHZB8IUjOwn2G9ZqkgwK7e/fn38SDgHDe9oNuXXN6Ih?=
 =?us-ascii?Q?9m+kQcd1FlUxr6H0mevOXi31wBirk+6jeUVrwV2wX+Qon/vgTcdMYgBO0YkQ?=
 =?us-ascii?Q?5Pygjq9t67o+UO9hh1ZaLvRksuEOmD4EVD5zDEJfg61ElETkXAMZ5/jufncN?=
 =?us-ascii?Q?2qhSWmfUvBbt7IoOTmXEbupz6RQoEmuMlwfrKn4TGUX5zUr9IKVdE+lMk2b1?=
 =?us-ascii?Q?RVwf1XkA0lSP3nPrd9Rb+5Qex3+Jc9QsKiS4orFsupC2AJUseYtwy75/Pmnf?=
 =?us-ascii?Q?IPit9KnD+wAnDJjPdYErSTaf96zuwkT7NW+hSdsNKNAiOGi1czuuDuzWw0B9?=
 =?us-ascii?Q?tonVqfbCJfqtUFBjlp4lm1mxODZtNqDZLrMg8r3FagAxeqHRRsURQ4kwBl0S?=
 =?us-ascii?Q?f3Srg5fCOtuCCDPk2pTzY6d87U3fxaQdsZ1Ky7GxMWv9T7b5mlruMzkufBQE?=
 =?us-ascii?Q?MkAy3ak4vQzqDnh98lvScBsY34iWwEtgziM/6fbiW98cfboaSw8ZFhc9+e02?=
 =?us-ascii?Q?fz4STH5fPaKPtfyJYFJ+bfD2StyUDOVAkHAxeA23MzxTRR/Ym9yF+FL6R8fS?=
 =?us-ascii?Q?cLPcC7W7zE/zlTtHpFPN4ZZgm3vaV1LN/FDGfG7cMzUBQvVmxHKoQow4ZTKd?=
 =?us-ascii?Q?7IIef26CgLrbJFmuTUTBO7JUiNSVRCyRHwoMWUuBnG1oyd+NquLMxU7LPeJ6?=
 =?us-ascii?Q?9dVaSsFuUlzO+7Iy/cARJiLr+d+a53oYCP+nya833myCNQW9VjPEMV8CNR/2?=
 =?us-ascii?Q?vsB5A85LTlAosyLTI/YsTyikYKCk3+cswfIx6aZSt/azUlwrVZVDWedWBW7c?=
 =?us-ascii?Q?8/H2no34uzi6XWHELsrf3Fanw4zb/gY=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ijP/iQ1PZ4vRav6S6xjZ4bwc76P5IGE6xMn92zfkEmyk1tGXFQ2D0wEpob8eohjfoawQwchZ+0NSyUrKPChlN39lWP1frTyHqP+2OkVCibo3hCurjA4UjrA2XD4rDyOlGvDsslimxsFlzxqBqdacNgGw7D2enWiYlcmy/R3cmR04noiGgshun9WXGI7hf1ENBwQ7vdQFZtfGTKVmwJ0Os4cGOOtBamDvUJf8i7YbzQvT6Z/g/oDOi0i/srBuYi43Xf5KkWRpnZcrN2NQU8pubo5CAOQHIEbgui1EqGFkBppd99s+YfKQj1JLiimgAGcX9ftsDIZQYnffyTuika0Y9GDu4rE6dqFeYGX2Eubv6xuTcCeeOPCc21ckaIaLMxyAlxc/nUDWNzlMLhnPKpaEnO+uRA0ldZ419CIsaNY8p61B2qA9DsCYermFY3Ad/J4AGDuCaUcvn7rReCAMZKTTodOPrRJGzv//TJWrWlQC396vcW+gX3EMvdiWivYh8jRwG+wEc+qaXtcvNS5lDndt3+IZAn3Edpahkj9Qs7R1yIaDB7vBjfn7MmDicde4ADlwgbnwy26jXqMvbwyPeJQjexuorcLqercFJVEP0PWaCas=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd29aabb-9380-4487-79c7-08de4ea938f2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 11:29:44.7179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SaFc1tHMopfrmhctghVe3Uipaw95cjg2kXlvlc1rICXYU8dmfNnu+g1jqwhB5891RDS8ukZtNbtyD4DxLcXVtLbTtMhp6/bnkcdyBpjv8Zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4418
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601080079
X-Proofpoint-GUID: Thg7ATWpm2UVDH6i1zDQLdRV4tAH6lcg
X-Proofpoint-ORIG-GUID: Thg7ATWpm2UVDH6i1zDQLdRV4tAH6lcg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA3OSBTYWx0ZWRfX/0QwhwIneDFD
 jBNnBI7rVtQus5G0/HtMrW9Zygogai+azq/c7Fb4Gwf+iu+zkju5r7hbl16eImojBEnBwsBRFtG
 7uUp7LYSIe5PIHgLQpRGtkhk3wZX9UGqrDNs0h6bOAw7TX1+3HoWNk4eknmd7TlI0ytQU+TLINa
 gHruQHXeNLhdvWx32oAkeQRUy/OpMVeMinzwmrBavUpyjHguSY4BYQ2Z0+0DJ9pJQKstQ1mESPN
 UcMw+n5cnZb9h3s2Wti/FvnakFO0AKDyi7pUSHv9iTv3XhdpeV3PSZiwMJ9X5D4vfwrB9N0FTcq
 lRTEAlqjbXp3hZ3L4FkrGF1X9lQQF7t1XUak8PapqfU+1CkOBqCxAz5k+HgCpxOZ7HajPCl4kuK
 KsSiwfBMlz9aO54eFzdqSi0KFPlz5nfasg4FpvshAynbVeSXnUlsdZ9BjYce8hB928/gwWZuIiF
 x2Wexlu8clDh0xgNA7nhv6e4JWqc7x65+t2/xIvs=
X-Authority-Analysis: v=2.4 cv=U9WfzOru c=1 sm=1 tr=0 ts=695f952c b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=XzVkiYWBBffcxIOjpYUA:9 a=CjuIK1q_8ugA:10
 cc=ntf awl=host:12109

On Wed, Jan 07, 2026 at 04:58:16PM -0500, Steven Rostedt wrote:
> On Wed, 7 Jan 2026 21:15:17 +0000
> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
>
> > I would simply argue that LLMs are not another tool on the basis of the
> > drastic negative impact its had in very many areas, for which you need only
> > take a cursory glance at the world to observe.
> >
> > Thinking LLMs are 'just another tool' is to say effectively that the kernel
> > is immune from this. Which seems to me a silly position.
>
> But has this started to become a real problem with the kernel today?

It's becoming a problem. And as I said to Linus I seriously worry about what
news coverage of the kernel's stance on these kinds of series will do.

>
> >
> > >
> > > Let's look at it another way: What we all *want* for the kernel is
> > > simplicity. Simple rules, simple documentation, simple code. The
> > > simplest way to deal with the LLM onslaught is to pray that our existing
> > > rules will suffice.
> >
> > I'm not sure we really have rules quite as clearly as you say, as
> > subsystems differ greatly in what they do.
> >
> > For one mm merges patches unless averse review is received. Which means a
> > sudden influx of LLM series is likely to lead to real problems. Not all
> > subsystems are alike like this.
>
> But has this happened yet?

You're doing the 'repeat for emphasis' thing here which I respect as a useful
literary tool :) but addressed above.

>
> >
> > One rule that seems consistent is that arbitrary dismissal of series is
> > seriously frowned upon.
>
> If it is AI slop coming in, you can say, "unless you can prove to me that
> you understand this series and there's nothing wrong with it, I'm rejecting
> it"
>
> If the series looks good then what's the issue. But if it's AI slop and
> it's obvious the person behind the code doesn't understand what they are
> submitting, that could even be rationale for sending that person to your
> /dev/null folder.

Right, sure, but I feel this sits outside of current norms, I made a case for it
in my reply to Dan [0].

[0]:https://lore.kernel.org/ksummit/12d910d5-0937-4aba-976c-9872289d21a4@lucifer.local/

>
> >
> > The document claims otherwise.
> >
> > >
> > > For now, I think the existing rules are holding. We have the luxury of
> >
> > We're noticing a lot more LLM slop than we used to. It is becoming more and
> > more of an issue.
>
> Are you noticing this in submissions?

Yes.

>
> >
> > Secondly, as I said in my MS thread and maybe even in a previous version of
> > this one (can't remember) - I fear that once it becomes public that we are
> > open to LLM patches, the floodgates will open.
>
> This document is not about addressing anything that we fear will happen. It
> is only to state our current view of how things work today.
>
> If the floodgates do open and we get inundated with AI slop, then we can
> most definitely update his document to have a bit more teeth.
>
> But one thing I learned about my decade on the TAB, is don't worry about
> things you are afraid might happen, just make sure you address what is
> currently happening. Especially when it's easy to update the rules.

I mean why are we even writing the document at all in that case :) why did this
discussion come up at the maintainer's summit, etc.

I think it's sensible to establish a clear policy on how we deal with this
_ahead of time_.

And as I said to Linus (and previously in discussions on this) I fear the
press reporting 'linux kernel welcomes AI submissions, sees it like any
other tool'.

So the tail could wag the dog here.

And is it really problematic to simply underline that that doesn't mean we
are ok with the unique ability of LLM's to allow submissions end-to-end in
bulk?

Again I'll send an incremental change showing what I actually want to
change here. Maybe that'll clarify my intent.

>
>
> >
> > The kernel has a thorny reputation of people pushing back, which probably
> > plays some role in holding that off.
> >
> > And it's not like I'm asking for much, I'm not asking you to rewrite the
> > document, or take an entirely different approach, I'm just saying that we
> > should highlight that :
> >
> > 1. LLMs _allow you to send patches end-to-end without expertise_.
>
> Why does this need to be added to the document. I think we should only be
> addressing how we handle tool generated content.

Because of maintainer/review asymmetry and this being a uniquely new situation
which attacks that.

>
> >
> > 2. As a result, even though the community (rightly) strongly disapproves of
> >    blanket dismissals of series, if we suspect AI slop [I think it's useful
> >    to actually use that term], maintains can reject it out of hand.
> >
> > Point 2 is absolutely a new thing in my view.
>
> I don't believe that is necessary. I reject patches outright all the time.
> Especially checkpatch "fixes" on code that is already in the tree. I just
> say: "checkpatch is for patches, not accepted content. If it's not a real
> bug, don't use checkpatch."

I find it interesting that both examples given here are of trivially
rejectable things that nobody would object to.

Again see my reply to Dan for an argument as to why I feel this is
different.

>
> If the AI code is decent, why reject it? If it's slop, then yeah, you have
> a lot of reasons to reject it.

Because it takes time to review to determine that it's decent even if it
might be obvious it's entirely AI-generated in the first place?

>
> >
> > > treating LLMs like any other tool. That could change any day because
> > > some new tool comes along that's better at spamming patches at us. I
> > > think that's the point you're trying to make is that the dam might break
> > > any day and we should be prepared for it.
> > >
> > > Is that what it boils down to?
> >
> > I feel I've answered that above.
> >
> > >
> > > >> +As with all contributions, individual maintainers have discretion to
> > > >> +choose how they handle the contribution. For example, they might:
> > > >> +
> > > >> + - Treat it just like any other contribution.
> > > >> + - Reject it outright.
> > > >
> > > > This is really not correct, it's simply not acceptable in the community to
> > > > reject series outright without justification. Yes perhaps people do that,
> > > > but it's really not something that's accepted.
> > >
> > > I'm not quite sure how this gives maintainers a new ability to reject
> > > things without justification, or encourages them to reject
> > > tool-generated code in a new way.
> > >
> > > Let's say something generated by "checkpatch.pl --fix" that's trying to
> > > patch arch/x86/foo.c lands in my inbox. I personally think it's OK for
> > > me as a maintainer to say: "No thanks, checkpatch has burned me too many
> > > times in foo.c and I don't trust its output there." To me, that's
> > > rejecting it outright.
> > >
> > > Could you explain a bit how this might encourage bad maintainer behavior?
> >
> > I really don't understand your question or why you're formulating this to
> > be about bad maintainer behaviour?
> >
> > It's generally frowned upon in the kernel to outright reject series without
> > technical justification. I really don't see how you can say that is not the
> > case?
>
> If it's AI slop, then I'm sure you could easily find lots of technical
> justifications for rejecting it. Why do we need to explicitly state it
> here?.

Aha! Now you've honed on _exactly_ the problem. To find the technical
justification, you'd need to read through the series, and with the
asymmetry of maintainer/submitter resource this is an issue.

>
> >
> > LLM generated series won't be a trivial checkpatch.pl --fix change, you've
> > given a trivially identifiable case that you could absolutely justify.
>
> Is it trivial just because it's checkpatch? I gave another example above
> too. But if AI slop is coming in, I'm sure there's lots of reasons to
> reject it.

I mean come on Steve :) yes it is trivial.

Apologies, but I didn't pick up on the other example above?

>
> Are you saying that if there's good AI code coming in (I wouldn't call it
> slop then) that you want to outright reject it too?

No I'm saying that maintainers should be able to reserve the right in order
to not be overwhelmed.

>
> >
> > Again, I'm not really asking for much here. As a maintainer I am (very)
> > concerned about the asymmetry between what can be submitted vs. review
> > resource.
> >
> > And to me being able to reference this document and to say 'sorry this
> > appears to be AI slop so we can't accept it' would be really useful.
>
> Then why not come up with a list of reasons AI slop is bad and make a
> boiler plate and send that every time. Basically states that if you submit
> AI code, the burden is on the submitter to prove that they understand the
> code. Or would you like that explicitly stated in this document? Something
> like:
>
> - If you submit any type of tool generated code, then it is the
>   responsibility of the submitter to prove to the maintainer that they
>   understand the code that they are submitting. Otherwise the maintainer
>   may simply reject the changes outright.
>
> ?

I mean of course I wholeheartedly agree with that. But we to some degree
already have that:

+ - Ask the submitter to explain in more detail about the contribution
+   so that the maintainer can feel comfortable that the submitter fully
+   understands how the code works.

I think it'd be most useful to actually show what change I'd like in a
diff, which I'll send in a little while.

It's more about emphasis than really radically changing anything in the
document.

>
> >
> > Referencing a document that tries very hard to say 'NOP' isn't quite so
> > useful.
>
> I don't think this document's goal was to be a pointer to show people why
> you are rejecting AI submissions. This is just a guideline to how tool
> generated code should be submitted.

It might not be the goal but it establishes kernel policy even if it seems
the desire is to say 'NOP', and would be useful for maintainers on the
ground.

If nobody references kernel policy in how they do things then what is the
use of kernel policy?

>
> It's about how things work today. It's not about how things will work going
> forward with AI submissions. That document is for another day.

I feel I've addressed this above, but we're already mentioning things that
pertain to possible AI slop. I don't think the position here can both be
'well we already address this with existing rules' and 'we have no need to
address this at all' at the same time.

And shouldn't we perhaps take a defensive position to make it abundantly
clear that we won't tolerate this _ahead of time_?

I obviously take Linus's point that many slop producers couldn't care less
about norms or documentation, but with the impact on the press reporting
and _general sense_ of what the kernel will tolerate + those who _will_
think they're abiding by the norms - that it actually will have a practical
impact.

>
> -- Steve

Cheers, Lorenzo
