Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5E6329E79;
	Thu,  8 Jan 2026 19:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767900637; cv=fail; b=M1JwWs8D4VaQ0hp8jy7Ng+k6XwdADFEIhXrDveIkKXCiYiMTLxewU2CyBwEGtRLIWhdd5BnI0FDt+KwshciAl0hX10WEmaye8wZrSkJL4i9Q4PhNK6FQGCVipg9xvXMB41fg9A3QbC3zzFunVHs05vMaHpI7mVLIKl2V+5GDF/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767900637; c=relaxed/simple;
	bh=pC8pCTo1slfay5Lw1ZaWahiQMWBZ+ndBR2CP1VC46t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cGZShfIyriDx/rQ3aR/qSBzpxNWPpDeDaACfVIK0UoyolvIDLoEUXLXJWWIjJiP8qyP52BbXHhXdycT9gPezn6EIIKzx50+4QoRPN7H1eDwGv3Sv/CPCP3HynCHxx9Dtdb77zMVLOvg20vk1zsy3bAn7ovZrz6chb5GXDWlbwGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FFkuGRGl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nIDzSLZm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FFkuGRGl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nIDzSLZm"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608JRMGw1878775;
	Thu, 8 Jan 2026 19:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pC8pCTo1slfay5Lw1ZaWahiQMWBZ+ndBR2CP1VC46t4=; b=
	FFkuGRGldR+5YhYWvmElsKO2uaPXJCPfbob6U3sq1WN+AGfRIehcSPU7GmnX5xCv
	lzsZ6tLsZQ4vVX+bIhFG3iQszUWPDEKU9sYOhTO53CLK3QE0E1GYca9VlNWsFEtN
	3wi5zoE/uQ3ZzJf4nlBMisufHUtDKATAw8bE1xQu2FJRucSikb7ZmIBr7AuKbycy
	Zcm8gVI1LIj+Y1vmJ2m5snIbnw2kzNaeKqfLnhSnePPJb0LeRSEo+cLUicIVCZPR
	jQnICg0Ie1+xWup6E/WyMkCu7kGPi+11SsQcmv3WTLrlFVrhMRE5198Qh23nGSeL
	PodvVEVLFSr1WBji6OB1TQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjjrh007x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 19:30:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608HQbvS030735;
	Thu, 8 Jan 2026 19:30:20 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010015.outbound.protection.outlook.com [52.101.46.15])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjfgust-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 19:30:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHDDXQBLxGCDbFhu2NrXLdGZfS0KVn7X7NIwY2jZkxIFGdGxXCUFoSOXwgg9D+mj8/GMRISXxX1y/JWXFZugxI1e6xwgUsg+/SMMeGMDFFx21R+jEDye7RLtSEtspyr8EvRSFzempLhMQZRC6TDzsF7OmIyc+5ko8SX8rFfj96H37Qqel69tNGR3MOrbdHMIVMnZT8I19xMx7OOdLraGDVScaUYES+xPS78fGPmOl9jOFIEVhO5S93d6f1GX2onBEaD8oajY/2rbD+/RXHwIEEVhAghuM6uwclC5PGiii8IENv5m0fz6qTrQRbxPVNvtB7HQILLOfbI4JIFsCSLmZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pC8pCTo1slfay5Lw1ZaWahiQMWBZ+ndBR2CP1VC46t4=;
 b=KOjcw8oC7emhULQ6YhfaAk4857T6ThVlECd6aEpk6QRKwpudlaFqmKFNgDuaSAl0p3Ym5bZw5eyg7RzcawIRZEATfb7Ldz73jYMKH5KfvoiKUgTJN5jBMAmbX8vlOFTZ1JjvjC9xY1wDPE/qZ7T9lw8+OYNQ9cITZQa3jkUZz9qiaGQaS1Vm8IRxRMl1DE2216YgISTHP4sB8kINuMu8N7opfa14FfZfbTppR5hfyV0RcJeFssbD3pKtkrKui6r4pKuzZE6i3o+z4PFtL4RzA7xev/CYCRkupT21lWB8BZXx832skHj2cu5vVOjJ2hHmqRHCDz0PB87dgrF4lxOsXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pC8pCTo1slfay5Lw1ZaWahiQMWBZ+ndBR2CP1VC46t4=;
 b=nIDzSLZmtnlriIegyUnYVEQlBAuen9LDER3RoLqZxbUu7bREJBLgbdFVZrZ7dul/1BIlg0uUvUo5Wk0WASI+kSUHyqzdQCtB/O4s2plpWpcSmVkAcoJlJaSMJdDeeXI6sOFQ0zZZskWicsI0PGGASdyEgh+3A7PvOyC10JvBL6c=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA0PR10MB7547.namprd10.prod.outlook.com (2603:10b6:208:493::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 19:30:13 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 19:30:13 +0000
Date: Thu, 8 Jan 2026 19:30:13 +0000
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
Message-ID: <709fa6fd-95b0-45e1-aec6-bd7432662b20@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <aV_eiRqUsK2KWkww@laps>
 <CANiq72mw1bis7aE9b=Htx9=Sd9jZH1rJmew1xqhPiCWu=EyzPw@mail.gmail.com>
 <b7469e4e-d711-467f-839f-4a9688d25a23@lucifer.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7469e4e-d711-467f-839f-4a9688d25a23@lucifer.local>
X-ClientProxiedBy: LO4P302CA0022.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA0PR10MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: 3600b22b-e67e-4063-99c4-08de4eec583d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTZueTA1SWF2TDROajdWRWp6K3ZMaUhONFFYZ1ZsdXFRSGZKZXY5VzVmSTIv?=
 =?utf-8?B?c2E0QUtCdmhBdStsR0ZUUG1oOVFubTFSUlNaMTN6bzB2MEpqcUZSY2V5Z0VF?=
 =?utf-8?B?bUJ2UC9TZkJuUGo2N1VJcHBKK3pjMi9YUy84NHBqTlBjRHZBNHpuTTd2MkJL?=
 =?utf-8?B?b0RTU1AxUUlQY01taHp1NXJ0blA2TXRyRTBXY2tjQnhqeDdxVzdrU3JQOVFH?=
 =?utf-8?B?NHBhT3orTGNreVN3OS85YVJCSHJ5SVpNazEzd2Y1MjJLbHgrQ2F2VFJoK1Rh?=
 =?utf-8?B?YWJ1eVpqaS96eWI0Q1h1RFlmVHlVS2J6OTM3ZFZvWFc2SExVRWhURWpGSUJF?=
 =?utf-8?B?ZFlRQmlxMHYzNmxLWlo2RE5EVHJORXppQ0JIenZONis0Q012OFFKb3k2N3kv?=
 =?utf-8?B?MnpoMlUvODl4TUg3R1o2bjZCVi9pb0o2ZjYrVUpLbEV6L0MxSUJDM0ZFK3pI?=
 =?utf-8?B?S1BnajlTOXRhUXhua2lsYjdsR29uM0xidEdIZE5aTHFESUdvZkl1V3RtbU5k?=
 =?utf-8?B?YlFRaG1jd2MyRnpkcHlRVy9mY2RGbWM3YUlIbDFCKzlKZ2NobkR1QjlZU28y?=
 =?utf-8?B?RStua21VVzJWV0h3WjFnVzF1bE1uMXVMcTJJZEljaGJ6eTdlVVhrMndNQ3dJ?=
 =?utf-8?B?UFJWZmRFVldkLzQ4N2RMSE0weldUNHdqeW92VU9UeGxwcDA1eUFRRGlNVzNv?=
 =?utf-8?B?bnd2VHpZYjVIclc5ZGtacGJrS003dStxU3poZEkwcDI2M0VXNkV6MkNFTVhl?=
 =?utf-8?B?TmFZT09waGErQys5SVExSmlqZEo0YzExc0pGbk1KYWFWSzdTYm5sd2xMelNj?=
 =?utf-8?B?TERGdjBSbHFaOWg3Y0swaVlOK3llMVZJUFhHSGd1Tm9wa3EwU2F4ZzdLNExr?=
 =?utf-8?B?eWtDMks4YTlJRExza2Z3T3lQbjNqTlFmNDdTQXU3UGRKZEErRjhzaHI2WVJu?=
 =?utf-8?B?azJQU0dZaWJ0MjV4MklMYm5VcUlRNVgrSTFmMDlEdHF2L3pFbm9hSENRZnlt?=
 =?utf-8?B?TWkzcTdGd0RkUW5rdUUvMXFUeWs5NjBkWXJGajE2M2dzSmRuOEFDUTR2TUZM?=
 =?utf-8?B?UHRqZjdBNlBWOGtITk9aWnJJM1VPc3FIK3RhVE5XTTNVcHQ3ell1ZlpGU2My?=
 =?utf-8?B?bmZJcU04OFBBeUp2Q0djeHM3cVdtOTBMdjRFQ0loTGxMaW1SQjNYYkM1aU1r?=
 =?utf-8?B?SnZVM1ErZ2Vwa0NUam5qNzQxR2hvR3NrOStOS20yMHRQUTMvU0h2eDlEYTRZ?=
 =?utf-8?B?STd3MmJkTFN2Q0xDWFlWdjZTT2RVOW9HY2ZJTjRqY0RSVjEwK3JDYkNEb05H?=
 =?utf-8?B?U3o0UU9NTDEyTEsyVDAzZkhPbVhWWW5WYUJtVmdXYi85dG16V0lyNWpqcnlB?=
 =?utf-8?B?aGpFMEhPdUptMkRQNStlRkIwMXNzcklGRUZncWtKR1ptWERlckEvTmxuMnRL?=
 =?utf-8?B?U0wyajViU0dxOFMyUDJxSEZMdkM0YWpVWFlVUW9rTjI3M0Q3Wi9Sdkw4WEVm?=
 =?utf-8?B?cm56V2l2Uk8vaWltK1pNeFkxSGhITWlvdHlrOTMxam5vMGY1Z0x0NTdxS3B6?=
 =?utf-8?B?TVdESmloSFdKdTNoajBQd0RmQWhObnNZd1Rzd3JkK2pkRWphM0pvajNOb0kr?=
 =?utf-8?B?VG5XYTVnczg5TmRickk1WWRDaEkyZTg5U1FWMmQ5Y3dMR3ZmUWhVZUpHQVgz?=
 =?utf-8?B?QTViNDI2UVFIOFFMNWJ6T3FLRGhuN0w5NEJOdDRxR0NQcWhINVd1dzlJb3Js?=
 =?utf-8?B?OE5GVCt1UlRBU2tVL2QvUXhuLzlmcnFiWSs5ZkhtSDMyMzMzcnFMeGEwRE8w?=
 =?utf-8?B?eE5nWk1PSXJLYm1SM3hmb3B6VDNHK0tQd1A2VXIrcm1IUGwyWUptRnVsYmxM?=
 =?utf-8?B?RjAwTnV2YkZrUk5hMXFOZmt1blVhUE5Qb1dCalVQVnpueVM3cHB5VzBIcHZ6?=
 =?utf-8?Q?Tch7w/TY42SVyQBz27DE3Q1sfoY+OuG5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXlYNjkvSzl5WHFTckt4RVhaYjNlSGpFRE1xWXl2bkJRQWVoWnRVdy9JcGtG?=
 =?utf-8?B?VENBbXFWRVY2WmFMdjFUWXVPODVYd0k3WjRLbmpOeFgzOFlpazdqb1Y1V3By?=
 =?utf-8?B?cy9iV0pxc1NldnNYVi81WEJ4RWFCcnJiamNCc04vNXJUZzlsa0U2ZWZjNHly?=
 =?utf-8?B?bUxpR09MemMySERIc3JnWjY0cVpJamVVdzRaaXNwcWR6d3JZRGE3aWIyTjNK?=
 =?utf-8?B?TGZnN2kzQ0JzTHhoVGpUOS8ya1Z1OG9MMjc5cjl2OGlJS1hLbEFZOWZ5aHY5?=
 =?utf-8?B?d3lOQmhSaTNoWE1jTTkrUGVEOWoveW92eDZCTVBnYTdpbURXditnMDNiQ1gz?=
 =?utf-8?B?VWcrdU1WQ1hneHJVQzFTdkppSHNGcEtpeUpWeE9TelQ5R2lzS3h2RlRhTWhr?=
 =?utf-8?B?YllLSnFCN2h0SmpXd3FiMGFsL1ltam9GZ3U1SHJwUjBVVGFMMW1FTUVQeStV?=
 =?utf-8?B?Y3BZOEFvaGRPNnZ1OVYvS2lUa2p2QW1hczVXOU91VUZTUjI0TlYyaE9wNENL?=
 =?utf-8?B?WHhqY2xHaW1PaXQybkNWRzdTVFBaQ3JSVXFFcVVOOXJlRk45S0NONUNxU284?=
 =?utf-8?B?ZXh6KzVHM3hDVUUvWWlwTU9OVVRRdzFjMituWjNmUjhpK3Btd0xGSklhZyt2?=
 =?utf-8?B?NHBaVkFqMXg5STVrdFNqSkJlWTZKT0tqckRESVgxOGJMSlBtTnZWcnZ4d09B?=
 =?utf-8?B?U0lIS0ExelorU1gyQld0UjBvZEExZm9FUnhnUmorYjZocjN6Wm04OEdiRzFx?=
 =?utf-8?B?and6QnFneDBvTG5YYk1SSGl3dDdSTDlXRjR5ZEpKemcxeXZPUDArajZibFVh?=
 =?utf-8?B?NXROWU9wM0dqWWwwRjB0YnAxVUt4MGRoSjE4bnUwbjZZd2padGI4WTBESnBo?=
 =?utf-8?B?QzJrYWwzNDU4dENmZk9ZU2p4SFYvdDZFa1ZTekJyMWRheE5IVVlPaGw3OGMx?=
 =?utf-8?B?UmJJallJZmFlMG9LSW5SUzJ0TDlqNlNrQUdvMis1d0VYZTI4bDVYU0YrcEQv?=
 =?utf-8?B?Q1BBTmxHOXR3ZU1CMFFPWE81UjY4NFpIZ1hpSVdRYzlOcFJHd2FqMXlOQXdB?=
 =?utf-8?B?ZEhERzVvYlYyUkJua0Z0ZXhMSE1QempJRGZveFJuNDErV2Fpa05RSC9hcGQx?=
 =?utf-8?B?dU5McjJxZW9EbStuWm5sWW1iUGFwQUNzRThSOTRzT3JFTG9nV0k3Qm1WVVpP?=
 =?utf-8?B?elFYUlJCM09GdkZXWm1Gem5nb240K2pvQXk0OXhKeTh3M0FLOUxKR0VFK0RN?=
 =?utf-8?B?cEZ5VjdnK05UUDhtanQxbkdPM0JtYkp2dFAxdWpOa2psYUJTQ2EyUG5hTGN1?=
 =?utf-8?B?RnRpM0hvd0FqRDFoWUpXL1ZNWGFFU1dxaTBUc0VnekhkTDJrcWdXbXBSTWRM?=
 =?utf-8?B?ZWdnQ2R4dG4xek5qRkxycHU5U3IxQmJLTWo4dnJZek10bEQrWUJwUUJEWi9w?=
 =?utf-8?B?UmVXd20xN29JTjFjMHRmeXloZGdubjEvQTErZnRJT3ZjL3hSQ0ZqWENOTlhz?=
 =?utf-8?B?SmJLNThLRFFoM3BEMXJPVlVGWHVVUGZhN0ViRkE5dmJ6bFExUnIvc0JiMUVE?=
 =?utf-8?B?MVZMalFGWmtlUUZJd3ZTb29qRytYWjRBVnRKNmdZSlRhQ3lGYzVoSzdRa0xK?=
 =?utf-8?B?QmJMV0MxUzFsYlhCWFNkemMwcmpPa0hjcnNEdER0OUJOdDFVRC96UnRvK3pI?=
 =?utf-8?B?bDNWTXVQei9HM0pJK3lVemNnK0J4dksyZUU5d1IxeEdYWmpVYURKQlFBT0dO?=
 =?utf-8?B?b3ZzblVKVEdpR2FDNkJzUWlQQzV4QmtLTXpGQllZeFd5d2lTT1R3K1NYYVc3?=
 =?utf-8?B?SjNTeGRYK3RZY0xEYi8yOHcrVEgvZUpIS3NIeit5NEZUMnFOSTNHMk9tbVIz?=
 =?utf-8?B?T2xVWGFDVWwxbm51dFhVeDdTVHR5d3JmN1JHeGFmbDdxclFtUnBrdmZOaUtX?=
 =?utf-8?B?WTJpUVJVNDVPSFBtMXAzeU1ML1NnTVhsK0ZrMUk4a25JV2NWdkhOcVdBYVVl?=
 =?utf-8?B?T1VwTE9ySDdCS3dhOWdFdUEyRVJTZFY1c1VrblRpN09xN3FZTExlRG11MVM4?=
 =?utf-8?B?aEg0YUVxaVRIcmZ0VExlMVU4YU1ucmFhWGtKcXlxYlIwQ2RSenlJRjlOR0dV?=
 =?utf-8?B?SEVuZlp3MmNFd0VnQUdYMG5tNjZLNDFJaVNqZnRVcnp6aVpqVTlrQTZXSGI1?=
 =?utf-8?B?UWFYakZwSk5PQTJJM2JpbFJtWkhZWlNXSEFrc0haZXhKZkFiTkFnWmVSaTlk?=
 =?utf-8?B?UmxDVlZ5aXBSRXJGTVJCSC9PTnJoZ3VnUWJzTzdaTkNZWmMzdzlQQ0svTStF?=
 =?utf-8?B?anFIa2xSQXNJNytKa0NiZTJkNElVMVZNZnF0RExBZ1pGRFNNV0lnR0FzWkV0?=
 =?utf-8?Q?BobWLxYy1AChFUpE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GN19d81DTtFzn43wh/JlA5mrU1r/GIGKAQQVbqF024o4iZR9ANpRf6NtYgmjtPYJ3Fd2sby9S51CJjiXo1TzJTfoJJ7MnLn76tZCeS9bAWFerxPJaB0p2/bkTW9s4t8nlmfkRTWvTOMkbH5ipHbCtZVvqQ92xgfs2thYH9js+f36QfDIP4Dh7cYiyR4l3LlgRH2ZoB1BXh2L8be2YrV4ezSS5Fg4c6W8D+j5wAkFBKIimcu7TD/R5QZtZOmXY3PgzFO4xOV78eVRODWIBXmhF4iulqBn6eJlMksJ2NQYoXdwyiBY6QL/22k/O8WgMuhjZzJq1jsAHxKwb1QD/FYhmpEKwcocFxCuMACzxOGphqpUxqy/uzW8tpczPcDSlMuIMDLWaBAx+5zn41MJin7KnU9dSQHIVrFznthodLBvfl8LeMEPpZnTMVyZTZPGeusEK52VNj698ie4SxKLaM1FWygGuNI5zOvR/dEVsD64+FVk4Xoe07IbF5Hphfb0vZiK8SPecuufY8cdNX6bEoW57epr5xtmcbzAj4A3a1FRNe13GxgER12mmMaPIeL/+HiPqgeQSyVArRE+IB96/oM3RivcQx1f6RSZC/1pKrKlsFQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3600b22b-e67e-4063-99c4-08de4eec583d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 19:30:13.4066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxlvsZawuP6N+K5Vh9MqMiv65AfjJHo+rCc4VyV+ELgZjybp7XEhiFQS5rvm8HHzDKfPwyQdUv7v5avJovNRpcEfuKgx1P9VfMAQvfFxDkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7547
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=812
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601080145
X-Proofpoint-ORIG-GUID: EYCs7-2vdZ5YjtDVvJzfDUL482FKHy47
X-Proofpoint-GUID: EYCs7-2vdZ5YjtDVvJzfDUL482FKHy47
X-Authority-Analysis: v=2.4 cv=V/VwEOni c=1 sm=1 tr=0 ts=696005cd b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=px-xyUgyJLMXkY6u5-8A:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13654
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDE0NSBTYWx0ZWRfX10nR9mh2LwB3
 z9j1IqBswcaJsNftZ1i9Jmx9Moa3S2k82nzrChDI0uiiwAB2KW6s+L6cOsten9XfMHViTzhfzj+
 mnUZDspkB986K70o/Ehe266cluzsY8mzJfxaXwaNAUEcNQU9k8u91PDprVYHIaDVzSLMBzoXCkY
 jla4gFkqcJ6z4ydCVAaCnHW+3atbJ4hTc/H+wR4g2yfeJylVsBWER/hhuCubNkKVWPOvKPTAre4
 WqZbtItzh2CITbn3MKJ11Xu3jkLd73ai7j8D3t0StIDBo00U/f1GJD7QMwF6EIk55+nkNUL0Mxn
 cmGG+q95AIuNbcSktxH56g9Wg7yl1WXUw5fKJ7k13oO0pNMd3FSNFu4miFp6jBwc1MrwlWh4GiH
 OBoEtsnDzP+PkZFHY4rhKqn9Mep0CrDQaojtEocm+zXR9Z2dQJsxBAHWxroVEk5T0XmtmdnEZPG
 M9rv3zTRu0yNavSYJ8Z2yGCNjQruTBSqwiuMkDH8=

On Thu, Jan 08, 2026 at 07:28:13PM +0000, Lorenzo Stoakes wrote:
> On Thu, Jan 08, 2026 at 07:27:17PM +0100, Miguel Ojeda wrote:
> > On Thu, Jan 8, 2026 at 5:42 PM Sasha Levin <sashal@kernel.org> wrote:
> > >
> > > We already have something like this in Documentation/process/howto.rst:

Sorry I missed here that that you referenced another document.

I think it's useful to have the emphasis I mentioned in a single place so
people can be referred there as to our expectaitons re: tool-generated
code. People are far more likely to miss things if located elsewhere.

So if we have emphasis on this there, it should make it even more sensible
to have emphasis here too.

Thanks, Lorenzo
