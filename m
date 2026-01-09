Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3880435CB82;
	Fri,  9 Jan 2026 16:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976681; cv=fail; b=V+Nqj44E6aYyWXKodEKiUso9viKyizz2WfI4FPgmyB+q+IXXQBWd91b/lgOV4qOK4eKUj5Y2Mkfie8zw9kWuOCkb6eP/hNup4Rudge8fX8eUKWs6fzaBW7pxsqlUS9g6IFM4Sa82yhryRZ5/lgF4d1lZIl9nBjPR5ZZNljggRBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976681; c=relaxed/simple;
	bh=uxBip4lh0o/3Vg6xl62QPTXPGxCe8YvFa3leBkiQDCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AWCnmomBcY88QLPUW6HYT9lIeM+/ahfb7NJ9MOcngXSFVAdGwNicnwM3j4qYRVxTflUcYxBKXZiJRXcZfAWe/rWriAZjNfjUKuhawVwlOt1tPB1TqaWve01afHZD98lE0EQY0agrgdTuVJq574H9DrVzBm4SzScg2m2sIYT2LHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k6XTWgTu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=taniVqrA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k6XTWgTu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="taniVqrA"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609GP1FU3943444;
	Fri, 9 Jan 2026 16:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=cD4LfcTHPLsadxHF23FzmXt9v+YoI3T/UMc6j5SaX4c=; b=
	k6XTWgTuWwn38kC+ZnO0v11FLTJX1GDaXEw1Sxk5GZwBXi4VwH6vXiwF+ZAn/9ee
	Nr8oBp431qxtFiltNj8puo569a39XatuyNw/yFiv2hwLWcsvmd3qgirJRLwUxAQI
	NUU3Z2aRLAe868o+HKBY95N8qhxdD9p8iTE7SRVuI5X3WilYG5BnjgZjlaCBNun4
	JokGPaL4+qBYsF94EA3kf1w4KV6XzI2Kz077WgDiAmJFa1AyjXogPjSCAlqDJvw9
	e0yk1TSbopEMpq+KcPFGo1OnWLoFsx+726txRaMcByvJZ5ORKQ3ePnppdbN7zx/H
	27bxUNHXWPJuYwSIMTi9Lg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bk55tg0nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 16:37:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 609EYMlV017260;
	Fri, 9 Jan 2026 16:37:39 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012022.outbound.protection.outlook.com [40.107.200.22])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjptu0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 16:37:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erzkmthKaxsWsLoZLjHi3v6uKjWCdyvjZahcpK1/Pf/JrpAEullEBt/+/PFAiBUKpJ9iPFquwybJLQqDLFYO3Pp9DyoPHFuLEZ/+kiFPmYXNIy/nEk7tqtqCmd+o45mfbwWRu+uWLPtCwBAIKxQvlC9uUbywtGyRw31pV4YjZQaRNXP57wEJgV2ZfTNPKgzOj6KoxNRw6SpvG+/AjBUABaAGDGDn4LetAzCj/2/iBXFnm3O7BZiCYQsk2w0Xfi6Ii0GZJVnOaiNIeomO/B47r/9Qr6NgNehl3YkHUs+nSL8tGRPiiLOqboWqQXyUBW6Y5LI4znH5w6DkDVRP0qrUfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cD4LfcTHPLsadxHF23FzmXt9v+YoI3T/UMc6j5SaX4c=;
 b=jyyfsVK6cEyKzYQjzMnQI/9Dd4Wt6Ibcxt8P4ml3KOEHqPddNvp/9ZoMpNt7LcDDVHEswkmd+GmSNylIiAhCOoEUZnDerHjtVQqvHL+HqmsyRppX5E2kwiNbza1XvO3ri4m8oCooAMW8MJcm975d9I5AiXG4UENZtXd2WGt0N4/3I6KEm2K6AbMJNpIxEvP8jkElkZnGsJUkI4t8EM6fehmPhgz2yZ5utfMlbaUqWRiN8O5Qd+vswCESlKFCaFGc4C6dQG/Gcx1QVykoPiX+SLo5dGXqczY2PUHhzXG5amS2Wo2fQ7WZK9e7Ah45g3Y78fpKfrWSAYG7Y7ZG+W+x4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cD4LfcTHPLsadxHF23FzmXt9v+YoI3T/UMc6j5SaX4c=;
 b=taniVqrA6U0+UQm25LrenB+xti3xFyA/zb8bci3YfCwHJrU/RIRt/RgnWAIm/rzxHfL+8Xt6XnFZ5g70/kv5O/4IDU2xyz8Gcbt0m243Aq4I2acwuJi+poE0PHFAW3+tVrcScqunEJ6hCCPI33GsZr/ALBo8VPDYacHvB6P7O+k=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY5PR10MB6214.namprd10.prod.outlook.com (2603:10b6:930:31::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 16:37:30 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 16:37:29 +0000
Date: Fri, 9 Jan 2026 16:37:28 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
        Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>,
        linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
        SeongJae Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
        Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
        Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
        Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org,
        ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <d7625ea9-21c4-4644-b61a-0736b040edc2@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <aV_eiRqUsK2KWkww@laps>
 <CANiq72mw1bis7aE9b=Htx9=Sd9jZH1rJmew1xqhPiCWu=EyzPw@mail.gmail.com>
 <b7469e4e-d711-467f-839f-4a9688d25a23@lucifer.local>
 <CANiq72=yOkv_GK=V5k-WTYE-Fv++K+OtVUdrLQcH+75qRMN-Aw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=yOkv_GK=V5k-WTYE-Fv++K+OtVUdrLQcH+75qRMN-Aw@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY5PR10MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3f58e5-e398-4979-e581-08de4f9d616f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHNZTnU2eWNGYnAxd2UvN29MOU8zc0FaTEozZCs2QTQ5WlFJU0tlL3RNNHlU?=
 =?utf-8?B?ckFhekVUekc5MkxPRDBHLzRlUTRRcnVDUG9Ed1dpd0tFUGFGYVpER2NjOHhw?=
 =?utf-8?B?ZHZ0ZGF4MzJLODBzTkhMTjE3MER1MEJlREc2Y1kzK3g4RHBJdUhpLzBkMzNx?=
 =?utf-8?B?ZktKMXlUWmVQQWVmSW4zV3JRTytpT1BrdWY2eWZsaTdFWVRSTnJUNXVubmNj?=
 =?utf-8?B?enVEV1l0Q0RyZDkwbm5rS2x4N1E1R2pwSXhaaVpYdWFyWHFtQWdGYTVreUVy?=
 =?utf-8?B?T0lDZjFRNyswMWtsU2ZidmhZMnMyTSs5TDNFNXZZMit0L204MzZBaThqYWRh?=
 =?utf-8?B?czdzclFQdC9oOXBxc25qZXBIdUQ5b28rR0JycW5ld1gwTXE4UE9iWTJ4Nkhv?=
 =?utf-8?B?QmdnUXRQNWhVbTNLQ1hFbVlSeDd2aURlQlhUcURpaHZZSVJEbWxRdzE1d2NB?=
 =?utf-8?B?blJBeFRTSW1MYmlkNG5VNGJ0MnRxQi9uS3MyQmJWeW5JalNXWlhZcnptT1Nw?=
 =?utf-8?B?Vk5DcllQZlhKY0lTKzAvTldlWDBqSDJMOGR2T0ZmNno1M2M5eWJtMDMxTkFl?=
 =?utf-8?B?RlpxczQxd0tJRWtPUW11cmhCV09uTlVkQ01rOVlPd0F1N3NSYWhpTXRuV0Jn?=
 =?utf-8?B?RmpETFJ1a2tONWNpWTZFbGtoenNDQXhLVlRTYnlRRDVmTHFtMjhZWldOZmd5?=
 =?utf-8?B?eTdyUzhoT1lFQWR0dU5HMGxURjhtYXhrdlBzSVprUlNqZlpTVTNVVTl5T3J5?=
 =?utf-8?B?aFBXUnUwa0Z6S3I5UWdiZXlrcmNLT1Rua0MxV2NGTDhnWmJEeUF5UGc3b0N2?=
 =?utf-8?B?RXlWWEZBWVRibkxwV2t4Y3JNa2tMSVRLV3JMYkh5NGxGV2F5UExsSXVyakFH?=
 =?utf-8?B?QjBsQUNOTmVjeW5iS1dGdEpzVGY5VjhvTUQrV2FPV1pveG9Bc0JGeGx5c2g1?=
 =?utf-8?B?M0VabGxaR2lYaldGZW1MVEpudmtJak04cWhWRUdXZ3RrVjNUbFBVQWQreGN6?=
 =?utf-8?B?Z1VDUUpGMmtyZlF2WmxUSEJPU3NpMTJsSEhlTnlSRkFoYkdHSmNPaTNWUTVE?=
 =?utf-8?B?S0RvVnVNRk83cDlaYUlMa3Z4dHIxdkxZZ1VFQUdqT1FQU2x0UThPcnJERmxR?=
 =?utf-8?B?NXIzMVdURGRGZGtmcUduWGlNenkyam5kUnNobm00aWMvRWd6cmt4OEJ6QUtG?=
 =?utf-8?B?TllDL0pSZldONGhZUW5YNE1Bdy9MVTIzVjlMZ2R0bVZlYUlCY1B5U2QvSTdx?=
 =?utf-8?B?MzFZeitQRXpOWGFSaGo1ZEs1WVBBcWR6VzdVMDR1Rm4wOURibFZjdHJZSVlF?=
 =?utf-8?B?VExMK0xlWVluVmYxb3VTRFVJVkJVTjNrU0lVNmpkeWhmU0ErYXRJckZZb3pU?=
 =?utf-8?B?blZGcTg1VkIvR2dPb050bXpIc1Q0S3hYVDlpRFBVcUJuS3VSQkZ4QVVIYXEr?=
 =?utf-8?B?K1VuTUdOZWdjNGtyU1YrZzZnQlowK3dJR2hVSXhKMC9tTDFnWGQ3OWJSdXg5?=
 =?utf-8?B?Q0dlZlRMMWpNcEpTT2YxQ21GYjVvbUJQNE0zL1RadlB4ckFpRU40MXhqdEpt?=
 =?utf-8?B?RmI5c0hJQXg0OHNaYzRTazF1RTg4V3VqcURxMEVnd3o3OEMraHlNbmc1YmRq?=
 =?utf-8?B?Z3Uvd1IxMi84a0FKcFZibTgxVlJKS0Y5anhSOVNIOWtjRVcybzlpZUpwWHNo?=
 =?utf-8?B?Q0lQY25BNE14eFU2VXBGaVcvTHZBWFh2ek5JS2xjeDBtZXB4RWorSGdLeVdI?=
 =?utf-8?B?VWROb3llcFpPVnBOYWhtM05QeGVlcVd1ek5IdXNCdVZFZXdnUHBOZGRvaDlO?=
 =?utf-8?B?NnMveU9VazY5RWNSaDUyK3BvZUU3TDRHL1NteXFuWXNlZWdWdUttRk91MXNR?=
 =?utf-8?B?OGRSWkQ1WXZqMWdQRDdRZWUzTEx3VUxBdHJvd3Y5Q1RqZWFGa1dKNkpwTFNE?=
 =?utf-8?B?VVdFK1o3VDFGZG5XcTJ4VStOOGxlbVprbXVEUTdVeXp3dkgza1RuUXZhNWlz?=
 =?utf-8?B?VG9SbFd3eWZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0F3OUg3VjAvcnB4WDk1bFdxNS8rOHBOR2NhZ3I2Z3UwaG50RFpXdW1ZWkFr?=
 =?utf-8?B?aTZjdUFqc0gveHNER3p2a3R4YjdOdm1aSVRrTXp1TWl5Rit6WFltcUlLancz?=
 =?utf-8?B?cEhlaHRBK24rbHZUSS80ZXhLbXR1ZlBpWWpMZlhROGtUTjVHTWFkeldpYW9v?=
 =?utf-8?B?aU5uUVZuZWZZa2tTT2FjYXUzekZ5cHcvMkJHOU9yVGduZEgxVlhNWU11RlV2?=
 =?utf-8?B?YUN6T0N1WUZ6WDNDTlFlT01kTFRKZVcrSnVxMzZIRkZHMVIxNWtsTmZ2NFFW?=
 =?utf-8?B?dS9aQ3JTS3VYMDNWRGIvSjRvOXNNekhiUWp2c2Jwb1ptM21MT2ViUnJxcWVz?=
 =?utf-8?B?VEh2WEo2L2NDL21sWUVWdmtQczFnNmp5U3NXS0pKb3BYd1ZQQ1ArOHlFMmdh?=
 =?utf-8?B?am1sZ0Fld1VuMVo4WGx1MmhqU1dibXpNSnJ1akNnc0d4a1JCYThzV1BJaFNw?=
 =?utf-8?B?UC9SRnA4aVVpQmJIU3F0OW56WnRTS0dpVFB3NDJlaDBTYkNyRXBIc0xWcmc0?=
 =?utf-8?B?RkNjUW1wQ2VpZWxZeGF5QUcrMXBxTTlvRlMvbTB1UStnLzh5UFI3OGhFOEw5?=
 =?utf-8?B?NWE4cUtsWU1Jc25aWTI0U05MWlFESGpYL2kvb2dZZWYvcmNrcFVXR1BPOHRh?=
 =?utf-8?B?cXVLRmtMMVFZdy8zMlhoMFQ3a2I3ZWVObm5BemQxQ2RFL0RKSFl5K0Rvek50?=
 =?utf-8?B?TW80ZDVpK2hwUURJRmQzTnBDNUVWbVp3TTU5ank1b0xPUysvM1VLY2ZaQkY1?=
 =?utf-8?B?dlFsWjZ3bG9QMmx4S042V3pxWVZjTzg1WlY5dTJnMFkrWGhiZk1DR21maVh2?=
 =?utf-8?B?ZUlmQ3Z1NVgybEJDbHFXSGh0dXhXVGpqOUJab0ZlZWRZVnNtamg2WG9iWEdr?=
 =?utf-8?B?emZtQ29nNEU3ZVBkSE1pbkJYVHZWV3dVcnV1RWRFSlhXQ082MTY3Tlg4dGNm?=
 =?utf-8?B?eER0OVl1SWExV0hHUVFST3NFeFlmUmF4MDhMWDMxbkR0cjFpOGE3T0NKSVFk?=
 =?utf-8?B?NnJ2WU1FSTJYcWxnRFBtbEJwNllJaGFsUEhkSVRVNTJLSmVKdzkrbTFqODRN?=
 =?utf-8?B?MVBiT2gxcUlMSGxObFN0WmdBanNFYXE5ZVNwU3VheS8xU2FzMys1VjNRTWQ4?=
 =?utf-8?B?RUtpRFNHeEpJUnJXdFVBMDFIVEhTQjBJYzV1YUM4bW05OHZnTkJLaSt0amhW?=
 =?utf-8?B?d0o4bEV1cUFZc0kxdnhPc3JrQmhTcTVTdDZuWWp1eDhmaThDUWpTUUtRamFC?=
 =?utf-8?B?cS81ZHRyenU1M0F2Qmp0aTYzVmM3NG9qUkQxZC8zNHJDZUxnNk13MnI0WUJ3?=
 =?utf-8?B?TlB1VmN0V2U3MEdwenhXK0pvYTlqSG1QTVdmRmpzUGxTWjVnN2hMY3Evd3Yz?=
 =?utf-8?B?cmxkOGJVRE04aURSakZXUnpUbUlSaytQa2RNeDU3QUJycWJnZEUzM0RybUM1?=
 =?utf-8?B?Rnk5MFgrMURLeHZLbGd1ZzJaR3pPeUJsZitUaE5zUk1lSlJVMVN2cW4xMURV?=
 =?utf-8?B?RC9zbkxPa04yR2JEcTlGYUdnZUs1QXdnWDZ6QklPQ0FFekIyN0pwMFlka0Jw?=
 =?utf-8?B?RGtheW9ROFhkT0JVc3F5YWtrTUtLYTFOUDNybE5vNVFCVU1DeGhiRlhrRDU0?=
 =?utf-8?B?VWFmZ1gzWXhhWnVTa3hkZE5JcTVBQlB0SHdkRTc0Rk9CRHkwaW5SSGUySkZt?=
 =?utf-8?B?QlZPSnBMKzBoUktnbWxzaG85MG9EYkwrWWNXZm15V1pWWGtoLzhZYWxSaTJP?=
 =?utf-8?B?Z1kyRDd2cjFCMnVyUEFrRUlMZU04cFByLytxYlN6aGowdFVNUFVyYjBpem0x?=
 =?utf-8?B?c1VnNHFpSTlNeFV0K0djU001WHVvV2g4WWQvVGxldHpsU3NFcTJzalV2amRQ?=
 =?utf-8?B?MzdiT21yWEJybkJxc2dReXVhN0k2bXcwQ25DL2pUYzhiRDhNbVRlRUpGTzh3?=
 =?utf-8?B?RzR5bUJaK0VQTlZUMm5RSWJoMzdOQVFSdG5nYXBFcTBMMHg0ek5nRTg4WUd0?=
 =?utf-8?B?NVg2OWx0N3VxcEQyMlFTVURoVHBUdTZQUk5Va21wODhQNTNqUkYrdm9HeUh1?=
 =?utf-8?B?cEh4Z3lnd29nVXN4MVIyOFBzZEhyVUpxZ1RKTVphMVk5cVo4OW03OXMzc1JH?=
 =?utf-8?B?L3VnRkV4Q1E1di9lZm1CTEFBTjBPYnl3L3EzOTBrYXVwOFczZlo4RVpuRVRh?=
 =?utf-8?B?ejNNWDdKbXcxeHJOZVFCVXdwa3VDczlnd2RwSm81SGo4SlZXcGhXYmZUNU5h?=
 =?utf-8?B?b3FSVTd1cmZaSVp2OUpKSmJjeHVhcitocVZRWS9rUVVhdjlsWjZvWjJhV1NC?=
 =?utf-8?B?MC82SnNLYk8xWTdYQ2pUTWRibU9UQlhyTmVFNmlXZVFwRVBiTmlFeVhtRzVt?=
 =?utf-8?Q?y9PaZuC4DmRgmNnY=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	23n9paa0nArueFWjvuXl+MvnwLBahE2PhChT6rBG/eNZwu0xGda0SC69MnDQfIVcfMsbV+8hxZiKGkUBxjxveJZj/mlQW7dhN0Xlo3RfIKMK4ery+SAnmV41pd9AqpzPc4zTRCKfiezvg40yWba3N889bti1Zytm29MKZfg4akTs8ZYFiFNAJ9IHs9/UHulQVdZi1+gLROkrBg3k4awpCUFPCEAdmfb+kOc6/JKIUQEIYR472JstsuaU+jYD/xv5Ov7k3m3vic2VyaIkqkqd55svIHM/IW8hARmTroHEqZsXb7jQEgyCRLf1JtjUoC97gfyqm+P0v2PvEcynU3lYA1hjdx4x7ZQwvF/MzScKikPNPsVff+B6fsw/cdqwV/6LPflE5VItTQeU6ss3UqDshsnFyAdso3q5EytecxHdr7dhjGkTm1Jkfy3C9o/jbHJs6ffQNnQSC5k4ADABj0NYo/ua1wHz4VZYXkG+KKwpy5U6Cx55qXYtJvFTKwvCrj4VJGYUkIpSgAxnySXGLS5mQvxPTF8OQLFo6h9D0rxqTNvTTak8Q7LnXxq5U8Qz6OGBXkkFHkfJMsbUnvo37gz/BvGNOOlYFglLfY6VAkKh9eI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3f58e5-e398-4979-e581-08de4f9d616f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 16:37:29.7531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujZ6GZ1jJogLT/SOvDJjvVIoyape20xebDQ7dyOAHSX7KpCHuERWEpHuUOskHRonwyHLwYudDjXta8XN4e3t6fzNJfg61/WkHcSHQUktlTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6214
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601090125
X-Proofpoint-ORIG-GUID: 3nC3Od-Q1ZCxf3gO9UFUZ_zN7gj5EvIn
X-Proofpoint-GUID: 3nC3Od-Q1ZCxf3gO9UFUZ_zN7gj5EvIn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyNSBTYWx0ZWRfX6qMSM79savKo
 ogKP58qryFI3Nvaie0IGZ2Q/895XaA2GcAdxTu12CUnsJqHlRv2P0uOI85J+S3jSZUb25kc7K0c
 eq5Gk/2YijVVhyGS3amcrMwyJ0Gv3MFW2WuOXGlxdAP8Mt+lpOYL7sJsiV9Ml36rjKsxJDjMdVl
 gqLEJ66G0Rg+BmdDwTvmZlwoVEVdmwmag7hPhn4kMOF43AWcWvmzo2lgMw4yVO3lbS0cW8MMWIZ
 zlCeJhQ0PQEEx4iYEbPlkvcZSVF5ElOXs1rsScm/tfsvKWUVY2ANLXLZS9P18LCGyijEzqdQV0O
 KajROvCqbRco72e1K3Blm0EHqaumYsvM/r76ffg7On1UbKKhurM48BpfMx/SKGID+BXCQUAhKVA
 h0/Nn77Vn1TfO7xzIf99o+PojrO3jQ3Vi/d5C0jbuKX/NsInyo/rD5jo6NuhReprbfQ3A6S7A9w
 rEDXE2adLXh2YnsHMDBUyPrOyZUbA1knNXP0N57M=
X-Authority-Analysis: v=2.4 cv=SJZPlevH c=1 sm=1 tr=0 ts=69612ed4 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=JhGVn7PApFXc3DF99NMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12110

On Fri, Jan 09, 2026 at 05:30:17PM +0100, Miguel Ojeda wrote:
> On Thu, Jan 8, 2026 at 8:28 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > 'You _can_ be more transparent by adding information like this:...'
>
> I am not a native speaker, but my reading of that "can" was that it is
> suggesting ways to be more transparent that may or may not apply in
> particular cases, but the requirement of being transparent was already
> established by the previous sentence:
>
>     Second, when making a contribution, be transparent about
>     the origin of content in cover letters and changelogs.
>
> Which is reinforced by another imperative in the bullet point about prompts:
>
>     If code was largely generated from a single or short set of
>     prompts, include those prompts.
>
> Similarly, I read those other "might"s you quote like a set of things
> that could happen or not (and is not exhaustive) in particular cases
> and/or depending on the maintainer etc.

Right I mean I'm not disputing the logic of it, and the document _is_ well
written.

>
> At least that is my reading, and as far as I understood the TAB
> discussions, the goal of this patch was to document that non-trivial
> tool usage needs to be disclosed, including LLM use, and to me the
> patch already did that, but perhaps the wording can be more direct.

Yes, exactly. Really for me the whole thing is about emphasis.

The current version of my proposal is (hopefully) reaching towards quorum as it
takes into account feedback from Dave, Jens, Steven, and others probably who I
forget here (apologies) - see [0] - so I'm hoping that this _should_ be
acceptable as a means of establishing that emphasis without disrupting the
overall aims of the document?

It pleasingly is applicable to _all_ tooling and doesn't take a 'position' per
se on LLMs specifically.

[0]: https://lore.kernel.org/all/1273cff8-b114-4381-bbfe-aa228ce0d20d@lucifer.local/
>
> I hope that clarifies a bit...

Yes indeed :) thanks for that!

>
> Cheers,
> Miguel

Cheers, Lorenzo
