Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12085310645;
	Thu,  8 Jan 2026 19:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767900520; cv=fail; b=FviX3MUYlOefyHlRB5eBut051PUHZ2b81u6sYxf78VJhuVEOsdPMK1Aemn2S1zvDIY2q1R3SkcQbHFtRgLDXoqs9N6thmrMcon6NRDEknHkrajTIe6ScPAAK7ZqO8KojaosRQjWSq95F61hoi9mi+pEDyq8kXtlL8kmImGEDTQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767900520; c=relaxed/simple;
	bh=b72LDsla0xEzL5Oe5UPPvHIoZp9Wn/NGkQ3ux+i5Mw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S6f9U5DI3FoMPNA1p1BJhv2N8PG6LeJ0MJffCrQsDCgl+/U8AABIaC+QztJRkzpvAvSHXRhr1FoRHIuL/bujP9IWLXP6llOw5cYA+Wa2VyzlpShBrl8rtWWw76++WgjwtuIYRRK6phr69cfyQREvCq+ayBiwuIjgxAC7z9vxdEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MZyRI0NC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rf9Wz2LY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MZyRI0NC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rf9Wz2LY"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608HMcNG611835;
	Thu, 8 Jan 2026 19:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9a30kamti0IsSrZR8zph0REuV8YYHRUxzlaKlPcfhUo=; b=
	MZyRI0NCAs5rMgdbNPVwBJR8YEosborkxjOawItD3eMmDglCklKKp/w/kqZY6kSs
	j9ygrFYEDgNC8xgD+2f1dtPGkScVmCIzYXbdnf/lTJQnC9senKHMEhjSiFFaVDN6
	SP3x+II7pzsw719KWHChqYjyDyMKWVd8uVaU/fr9oG0AYY9jVYnNBm19X4wzbpYD
	WJ+1BEh40+c+Puszun1RELzlEHQP0rZwddHq2H4BLEiSZ5X/dZQlC9lszmHPK6D/
	EYYpiVLvrLXyHY1Bs/f5iukjJiRPJ5kAqhkEMTxA7DOtpELkw7J2u9ApoiMzXRhH
	4D3AvQKSRQBkmlG/aE3Bkw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjgwx06ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 19:28:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608ICueg034049;
	Thu, 8 Jan 2026 19:28:22 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012012.outbound.protection.outlook.com [52.101.43.12])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besjbfaw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 19:28:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmIhSb6yzFVykb1oC5xEpEhbbU5erRxhKJJ57ZQRNlLPhq6VxU9cMeoUb2qzTweo3KvqRkEry7Iut+tdm3cV9UfkE1I4iPyZTz+7NJCN+2qdoFQjKlEfRXhSkhqfVwIwr62apYjwXrEP/2lZ11GRwHIPa6SrzNFXUF1AnXoNPu8riPw2p8XSQscE8xMwWC7zPjQcTtkwIQpxmkwm6oPbA/skME+RzPVI8MqaJrIhPwArgWiyAlb3z5nceVkQGJPoF87p5f9QTGHB/nnE3teVMF23gCj79QvDS4nc0aIotGwNFxOJxOO27ySagFCvQzXKRaaFqWDwxSH8UxoLXfKiPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9a30kamti0IsSrZR8zph0REuV8YYHRUxzlaKlPcfhUo=;
 b=RVwgDx3ovofeuWuqDmw4SgX89tFu346KTXzYRrhqzgaOc76Njisf2cWyzQWtXY3mgOsH94s+2HR/koZw8P+L2VxfXNMx6alDCTNPOzZ1VmZ7r3pbJu5p3KBfjY9OEM0C5UWvEwjjtvy7Zv+fzS1lPqFr3mZiqe4Ekse/kwRCz2J6cZ9hGB78gWHLXKS5Z4IJGjownCbNIJUwJPSEDdoTwyj2CEmNrHDrImpwtDQ5vFx4dfEBzmkCH4ZzHgvDl9epKt57Ayycbl6ElJu3grFsxX1pDJqu0F/ueGf5heXJX2S0Q6G5RigwjVzb7FZtylfeCefAywM1fEqmDeVq/zGXug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9a30kamti0IsSrZR8zph0REuV8YYHRUxzlaKlPcfhUo=;
 b=rf9Wz2LY77jtk28T2GfQIqoXCWQQH80llJ9JNfVHq0y4qjdjIsTNLSTckimte7UsZBwva8BFs4+j1eyN/DQC1FgiHV2Fqcj4X6GVCD8ctdeVolmKwytdtlwFWiPBYx9lD3H5BKCcAxvtq/Cyh5o6VrOY+grs5mDn2Q2vwqJDbuI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS0PR10MB6775.namprd10.prod.outlook.com (2603:10b6:8:13f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 8 Jan
 2026 19:28:14 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 19:28:14 +0000
Date: Thu, 8 Jan 2026 19:28:13 +0000
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
Message-ID: <b7469e4e-d711-467f-839f-4a9688d25a23@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <aV_eiRqUsK2KWkww@laps>
 <CANiq72mw1bis7aE9b=Htx9=Sd9jZH1rJmew1xqhPiCWu=EyzPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mw1bis7aE9b=Htx9=Sd9jZH1rJmew1xqhPiCWu=EyzPw@mail.gmail.com>
X-ClientProxiedBy: LO6P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS0PR10MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d917cd9-643d-415f-b462-08de4eec111c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0R2dnhjYWJKdThDMnVaRjFUY0V6alcwYlVYc1pzbGFKVVpnWTdUQ2pVTk4z?=
 =?utf-8?B?Z0JPMW42M20ydVByaVAwaDZhNTBVVkxpVFZoUzRsTkdxK29VVko3SkdQaHpZ?=
 =?utf-8?B?bENUeVpzZFBvYjlxMXp6OHV5K2tZWFllTE5uczBoS2hqdXliTTBkR0krWmtl?=
 =?utf-8?B?dnB6MU5RT2NBMEZkdnhlMmh2VEE5OUVkeXZxMFdyNHZXYmFlSFVweU0wZktI?=
 =?utf-8?B?SVdhVSsyNS9GSkZjdjl4YzhCYjUyVGdSTmNVL0pXWm9pSllhdmgwOWMvWjZJ?=
 =?utf-8?B?dFNBNkhYTitLOFRQVmljUmM4N29sbVJqU09oMXljVHVjc1JVMHFUY05tZ0t4?=
 =?utf-8?B?ckZMT3RNNTl0dFBISnVkd0tFbnFNL0RvdUI2K0kzdE9CRTA3WnRMM2Q1OVY1?=
 =?utf-8?B?OFdQWmR6dWZRZjhiZUNJNy9NK0plUGlHRFhwN1hNZ09xVk5QTEhEUDh0cmhF?=
 =?utf-8?B?eGRKVTc4SDFZbDJBaHFYRzFBaEZaRUM4WVhkK0p2ZjloVklWZnVSOW55MzFm?=
 =?utf-8?B?RUxucmFhTzBYa0E0T2JHRFFPZTgrQ2FtZGZDT2lOZC9oTHBEeHZZZHhKeFUr?=
 =?utf-8?B?cjhZS2JWNUFXc3RuSk1LK1ppSyt5MUMxcWJQdUhkeWN2cWJKMWk3dTZybG8v?=
 =?utf-8?B?QVN3TW95TVNvWXN3Mkh3S2pDVHJHQkNOUnpUdy9CaGlQU2JHRk9UR0Z5V1NI?=
 =?utf-8?B?Z0g5OHA3QThJMEFTZWU1dWlhTnQrYnRJK2lXTjd2cSt3V1FqVC9nL1RSZ3pO?=
 =?utf-8?B?cTRxaExxdk5NOHg5eW5xbDZGMnNocksxcFRNQU9rOXJKQkN2cCtjakpqbSts?=
 =?utf-8?B?amcwQWNZQ2wwZDNnUjNQUk9ydldMUW1iQVc3N0JYMGc4aStMeHpwc2FzeXkw?=
 =?utf-8?B?NkhBQXFFejdINTY4Z3c3U0RwVHEvZCsyVlF4cFhhbmR4b0dMVEx0WVdzQVZP?=
 =?utf-8?B?S2doMVdEU3EzZ1RKK0FyNVlJdEZRSDlISUFtZEJWclJUNG56T1BmcDNUakZQ?=
 =?utf-8?B?WU4reDZwNk53UCtybUgyb3draStLTkpLazFaakhpRzNld2dSU3lYL2FyZnll?=
 =?utf-8?B?WEx0am9yS0pvWk1qYWJoT3E1c0pKWGtPVjFZRTc1aXpLYnBHaXQwVHVUeE1q?=
 =?utf-8?B?Q1poOWY1R0gyL1ZlTW5POU1meElQc0hvbndIMHAwYlMyZWlobjNFQnhmRFRV?=
 =?utf-8?B?eGdnRkJyNnJTYU1IUk9oYmJoT1dRT3RGdkNpRlpYeDJRWjBodGpTcFg5RUhv?=
 =?utf-8?B?UWt3UUpXTVIrUGxPcGptSjdNOVBJeU1TTWJvVWpJcXNaM2I1c1FJQWdwc016?=
 =?utf-8?B?UVRGNmV2SkNpWGVFY3lEQVpRUk56ZWw1MHNBZTh4MDBpekRHcUVwRngrQlJ3?=
 =?utf-8?B?WUtLK1ZRWGlpTkpxWmxGU0dpbG5JeWJacm5mc3JzSFpxN3RsRVFyYVpCd3VZ?=
 =?utf-8?B?QWE3SFJJYW9nM011R0VOTXhCN3hZQnBmdVN2bkY4YWRNeTdHYTFaWUtTYTNK?=
 =?utf-8?B?Yk9KVFZvY0JCMDFvUjhDL0lUaGJoYjlkNUo5K1dqUVFYNUhrSFo3R1BzL2Z6?=
 =?utf-8?B?bENFZ2lUUDJsSzR6ZnZOREZndVkzNE83RFZTaU1Qc3pwZlJxUGpIZFgyZEN4?=
 =?utf-8?B?aEt4Rm1ITzhVc3N6MjVYQ3JFaDlGSGRaNW9HY1ZCa2RON04wUlp3YU1mOGlI?=
 =?utf-8?B?aXJxOXcwK2NHSzQ4MGdHbnlsaEMyZFNJQXgyOTR6TGluRDBqcjFvWTRrRllF?=
 =?utf-8?B?T3hCRGdZMFNIOEdsSENpcGptTlNNajlDMW0wcW56SndwSEhSR3lKUHhYVFBn?=
 =?utf-8?B?YUJIWGIvdnRqUjg4aUNIWUMvOG9MVjJGVzVWbzV0cXNLUlVLUUpUQWxReWNI?=
 =?utf-8?B?ZWFUZzNGcGtkMW9XY1JMaUd5K1hGTmVpYVpqeG5UdnRZaEQzME0zQWRiaG9X?=
 =?utf-8?Q?ufY08ZjVI6adA3YEIz5TQ4bLKjZOXoyv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk8yYjlFTjIyZVA5RVdTSWFsVWU5STYxeU1KNHJQQ1cyNmt6MDNpRXVmeEF2?=
 =?utf-8?B?ekpiNmRRT0pZeS84MnAxZWloUlgzNGd3dDI4b0NmWkUyMlFoTlh6UUxMNDJr?=
 =?utf-8?B?c2FaUS96UVRlRVZNRlZEUitaME5Md2wzUGpPc2lBQUhNZTdkeGpGZS9scTBx?=
 =?utf-8?B?dVVUY01NaUxRakNLdy9vL2RVRXRZaFRRV29OL0JReFJFOEpTZkxCbGNUL0xE?=
 =?utf-8?B?a2ZDMWlyVUFYa2dDK2RHd0lVaHBTZ0JIRDkrMCsvK0FsSDRKS2E2U3RPVHdO?=
 =?utf-8?B?b2s4S0phZWcvdTZFZUNhdnlOK0htcksyRXNTQ1FlTk4wOUp2bUNGWVBaOVVP?=
 =?utf-8?B?eTQxMHR3WTFycUloUmllTlFxRDB3cEFlUGxYc1pvcFgxOUF0MEN2dXJPd0FM?=
 =?utf-8?B?OHV6a3pVT3NGMGpXTWUzLzdOazV5cTcvUUx0ZFpVMzFJWVZhMkZVMjRDYmVp?=
 =?utf-8?B?OGV0eDhjVzIwMVhXMTROYUYzdWYwR0IrMkkrSDY4R3lrMkM5a2t5NXpMR21u?=
 =?utf-8?B?K24rNUYxeHJYcDlzSFhTbmFkMHdEM1kvUmlZcllOaWczVzFwN2o2OVNYNkg4?=
 =?utf-8?B?Wm1YMk15YjRDODBWNnZQaStYQ1BaR01lY2ZXcjkzOGRwMzBhemFqTXQvV1R5?=
 =?utf-8?B?U0NPbFZVenpzREdsQllJUTVtTE01Ujh0T20xNndyYjg2QWdtZVY4WENWS0Zw?=
 =?utf-8?B?QTlRUW1KaG94N01IakZiNnlWYUJrY0V1V1R1YkQxck5CdTVnYUQwZ3JLNE9i?=
 =?utf-8?B?Q3IvWmx3bmdId0RBVUdsbDZZSS9ObXhlUXJublJ1YnFscGxzWTFvWncxaXlK?=
 =?utf-8?B?TU5sOHo2MnBLQmxBMEFXaU1OVkJ4cE16ZmM1cFRsRy9LeUtla3AzY2l6Q1lC?=
 =?utf-8?B?ZEJ1WHFzYTEwQjQzVFVkcHozLzllSWFqdWNQM0VnWVRzK3pRazFDQUZTOTBX?=
 =?utf-8?B?K3RRdmg2WnFMcVIrSWpvZmJ6c25FZE5GcmNNN0t5TDc5UXhxaWlkWTFKdWt4?=
 =?utf-8?B?dkxwWVo3bVk3azdScW5ZcVhxUmN2dXlzTzJiQ3pOS09XMmRHUENHUjF1b2lP?=
 =?utf-8?B?K0pGSGtzOHhiVUJkY1VhUWdOVWIyelRGaGE2RmtHTHk0T1JLRUJ3cW1VUDFJ?=
 =?utf-8?B?NXFxTytjb3hTL3pnQ0dLSEd2VjcrYkVNZG84QnF1aDYweWZtU2UyeExDZXhK?=
 =?utf-8?B?aHZVdnloMjJXK0o4N2t5TW1WbWpNVDZ1ODdrWDVYS3d2RURYOWpXYTVIRFIy?=
 =?utf-8?B?bHpKQmRQbEhuUWJHUVVWTXM0TDI2WE5CUGFtd05GY3lyVlRYOWdNZHBHMXNu?=
 =?utf-8?B?cmhuQWdES2dUWnNnVy9sWngwdWRDRVB1VWFETllhUHVxNGdRd3NOMTd6cE5w?=
 =?utf-8?B?UWwxRTNHell5UUI3a2ZHNkg1bGNacU0wUWNFdnVZNXo0U0czUWRxR3NCS2FT?=
 =?utf-8?B?ZkIydWNvSlVIaUFvcHdHa0hZcSs1RGpNQW93SFoxalg1ZkRQbkNTY1ViWDh3?=
 =?utf-8?B?MlpFc0dSbXBTOGxWVXRVSjdNYTVnNXlvYzA5SEpCTy9Fc1RHV2ZuMEMrY0d6?=
 =?utf-8?B?ZGR1eUsxdmwwT0xlZVBtdmxONjZ3OEYwSkl3NnZKMWdVUkhrS1UycG84eTVF?=
 =?utf-8?B?aVlVL1owTXZMV20yd1dYLzFkbE5Kbk9wT3BCaUR5Z0t6RFVkWUdrZkZxVXhz?=
 =?utf-8?B?OWRRYWxteElqWnUzVkFjNGFhR0ZVZEt3aldqbC9OdC9zOHdBN3FKcFNFN2Uv?=
 =?utf-8?B?TmZrNCtiK1Nhd0lOcW96dVVySDY5K2pwMC9KR3pVcXZoSlE2TGtYMHBNWWVi?=
 =?utf-8?B?L1hybWJ1OHp0L0JYMnd2dFJ4Mm52RWc5RnJOUTRFWUZndDNXZVhqdXBlS1Jy?=
 =?utf-8?B?UHVncWVGZVNKa3RBWU5TaURvaE9WeGxnOFhuLzdhYVdkT20rNHFEejc0MURm?=
 =?utf-8?B?T0hNSVlIRkxHR1NxV2s0cUV4ZURxZG9FUXNwc2tUU0lySGVQUFE0SEkrUEFE?=
 =?utf-8?B?QWM3UTlRTFVpRGJwUlZpejFRNktyeEU0SEViQU82NWJEc0pPR28vSnQ4ZGQx?=
 =?utf-8?B?WVpNdkgzMDVkM0tOekFjT3BZNnZWUCtZQnJ3VTN0VEkvRWFDcHA5clBtbEJE?=
 =?utf-8?B?RFliOGhreVpFTVBnZHlHSHJidnRRdkpkLzdDbG55b0YwamJ3UmdHZjI0aHdP?=
 =?utf-8?B?U01McS9ubkRDc3pNY1Z1TEF2YWJGUDhXM0Nsc0lHZ281YmV6OExGTkpoVGs5?=
 =?utf-8?B?emJkR2NtYlRxNFdyN1JBR1lucGZ4SHJEL3dDZ2toL3JVOFZPVWdtMjZvTFRh?=
 =?utf-8?B?Wmtqb0Zoa2ZndVVEWVdUQm5yZ0Z6TnZFREdYanpqMVlBcHArcUUzejFKVjk5?=
 =?utf-8?Q?hwyNHscvqtvS6dwY=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xf4cRR1CMLObT6oswmXtnnkCjQXfov0Ch1lS6BQQPw3/v5auisZjIKNbmFBLSzoLBVCA1Ws4Rs0dVYwMTuIv3+HLrKWEkZwXGlZDdDoZXPGrQMbz6gKgI3/bHk4FKZry/0sYI25P8gWC2l6YJb/FdklitfunJcdqY70RfPzyh9d1ngEAjGTrfPJMUeFIq1fH3gZsNB8gXZ2+ee50cpMp7kl+FBB2c2qG6hfmEufhmMAMJIbyl+nKW0XlHoJeq3U5Q65rNupBZ7QHeC/HyjYSIYUaFKdKgzc//whwUm2e7WUrQCWJuVLNsonHf0nngOPwJ/RWrSYAJy1CEyEK0sshFda8I4dmpq+kSTcdp8EgP6EW3cNlq+Ec9OvPQ6UXYYZSd73Gcze68ZJOcAJ+L7sSwwTeGXcxHxIsPo0taBAfm/4S1QEy54f4xmTvejhTOXlo+2hEa3Z9/cmHp8TyQskVzroqONkVYMrBOwxm0wU2EyBIknLTXZFQGJoknOScUDlmPNqJfnyjD3BIxjoBhtjON5Ctx0B2qH+2zRMyb4XsFl6GdEJU/j24kVj2TqmCq+XMjUSILVzW2QECzvatnrexC8DnY8OOZLCd4UdhDf0LDpw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d917cd9-643d-415f-b462-08de4eec111c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 19:28:14.0644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZlw18KGgQG4rHvDjyG69PdbqZvUKu1Wk/ArsZgKpKHzLzZCvOuMI2QivWeDW0tz3ij+fgUmCTSMnhhadwK6hJ7yYiiZjHDX7RYmlFexK/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6775
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601080145
X-Proofpoint-GUID: j-ChagOvRxZQAh71F6aqFnoZPIBe3kaW
X-Authority-Analysis: v=2.4 cv=JYSxbEKV c=1 sm=1 tr=0 ts=69600557 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=e_--e3afx2caKE8z0AsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: j-ChagOvRxZQAh71F6aqFnoZPIBe3kaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDE0NSBTYWx0ZWRfX+Mp8X/WNPgWy
 wTTB3YZKRqvhHx0UCfDzmP+uWAKMSfMOZDo6cxhkd1ANO27QcDmr5+BsrVI1EOmZV9ZPIELoEdR
 FTGyum/aYT6UuAyXXBsaw+qtrjXVO6YGGToyeKEqLWQ/54t3oPY4XcC0Ew9Ic+mnz2ilw2djNG3
 pKe6A1/W8zZfQpssNcrwRYHKPGJXqQKmHGr0GT6v0C+kbw3wQcm6pQ2FBOv6Jr3zCCfbWvxDFD7
 a6PNXZ/3tBXLq8HuY//Rcet3DlEVHX3ICmAaqKrLaU+N+m/j9Kab7tJKSDmsW04nG4+GECNT1mG
 OEfQRefyiGm4l8IL6OpRA4q4OjLXHhu8CUleVXk1a40C1LGhbEUE25xJvMxn8pNHsT/O+wh4RvB
 XuemypV/85MMyTvCnLg1YlJjDXo54iv9So2qJoMl1FvVrY6vSQiIhp+n/j8iKGp53c4mQ8OMOa8
 Vm0VLPDWe9nPDQSEBdQ==

On Thu, Jan 08, 2026 at 07:27:17PM +0100, Miguel Ojeda wrote:
> On Thu, Jan 8, 2026 at 5:42 PM Sasha Levin <sashal@kernel.org> wrote:
> >
> > We already have something like this in Documentation/process/howto.rst:
> >
> >    "Before making any actual modifications to the Linux kernel code, it is
> >     imperative to understand how the code in question works."
>
> The patch already mentions something similar as well:
>
>     Ensure that you understand your entire submission and are prepared
>     to respond to review comments.
>
> And then talks about the maintainers discretion and rejecting etc. at
> the bullet list at the bottom, so it seems fairly clear to me, i.e.
> that patches may get "rejected outright" if one cannot explain the
> submitted series.

I understand that of course. I feel I said it already but perhaps I wasn't
clear. The issue is that this is put very softly and in such a way as to lose
emphasis:

'You _can_ be more transparent by adding information like this:...'

'As with all contributions, individual maintainers have discretion to
choose how they handle the contribution. For example, they _might_:'

'[They might] Ask the submitter to explain in more detail about the contribution
 so that the maintainer can _feel comfortable_ that the submitter fully
 understands how the code works.'

All of this is a little weak and reads like 'please if you could take the
trouble we'd love if you'd maybe abide by this'.

The point is to say very clearly - we won't accept slop.

For all the various arguments I've seen on here, none have amounted to us being
happy to, so I hope that it's not too egregious to ask for that kind of
emphasis.

>
> Cheers,
> Miguel

Thanks, Lorenzo
