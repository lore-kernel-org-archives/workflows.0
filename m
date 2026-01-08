Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448213B95F4;
	Thu,  8 Jan 2026 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868388; cv=fail; b=aCZ3fhvd8va8bHINJeMXwgq+gbY2bHuXDhjeRn0vsUODnqKdcgIU/V9P9gPaX8DLKF4H1QSHZ6eFpdEYCm6St/ntv/XHfalwFGNotf/gRaTzg0p3nKOuWr5PbreRNsvUPNZt80x2ZNqCwRE7i8RipjpRoLZYMY8t1kooRNpXMqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868388; c=relaxed/simple;
	bh=n+Axzouizs4SIB9cmzvEuC8f6X5XyqJ4ic4IQipK9ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HhDP/BcKecmabnX2FbQwgU/t7YyzzdAE7rnBLCvIZCMBKkseBDz4YMqDl00OTOGPEOdB67mNcs+0WEt+vtRzY8e5pl63uSn2owg8EYEIbWjOGU5MylyKQePTu9TMg03yTmTuGtK3E5RxTABkLdVyuPBOLAhM2phep6Zql+wfqiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Hh7nzEAr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ddzinIv1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hh7nzEAr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ddzinIv1"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608A69a7300185;
	Thu, 8 Jan 2026 10:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Cr009KoTtDJE9QEXTe
	+o2Ce2qgZ1NhqKux1eZCgiRNw=; b=Hh7nzEAraIXgnhS62EaC7yEz24fuMAOARk
	UtauFxkrndpDFONQa6APii0+Ox7QBP9SxZSPXR0kIQAtI3LLK5jJu1TOegBJltCR
	d5RaKVdEkGg83lIaqdG+ADXwuwpCLraGWeBO+Wh4bEMr0XTNAleI9rzlFV0BYamd
	MK6129VgK1zDtsRqpvvBM9Hm/niIZrx1NyKLf77fhelhzFjeD97zEBby36732XYt
	x3qfOSLA5bdmsnmAOPbRF2ONk24tZAcJeeg0hAqtexcXigqTerQz7LEtHENBpDv0
	QapPqrigsHQfiBST2GkS5a+A2ekgW1VMZZSbSmcIJwuC2JDE6N2g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjahk018k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 10:32:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608AKHsx030832;
	Thu, 8 Jan 2026 10:32:40 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjeyepr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 10:32:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCmuswX2nzF0uUT/iqtUYDDod4mTjm+PP3U5WLNfQMpyLdikZwgKhMGLvViwLTtokfYwaLjdx5Y1bUYgs9rXObdx0Fp1CDjL81h9O54xD2997c8eeFG59a0nCbg/Nq8W/0FjcLjUVYI+3PZuSdaco2LSXUQsOkzrMQJ0BPJu0lWBfw1mAhnybyrRclTgStGkPeC4C6alUxcMfHwN71hreZmecPOzcUPUmQZxv4B+UB/Am7GB44PDn0+H60oV8m1LOpt0+t7jPz0rfr3gKI1qj+bBhUWfHFl1BbNkhAo8m96Lc2LIbLJ28+5IiI2c2n7xDVrGMIFygM1UND4rBIULEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cr009KoTtDJE9QEXTe+o2Ce2qgZ1NhqKux1eZCgiRNw=;
 b=w7+xmg2i4AUbk+FpMxe/x9f2ilu70Yuy5HVknIuadZFjlV3ApUwrbKO9UxVND9+vfQ6mhPlQdLBG6ccjwyMLSQBGMTMIDsQ55c9Q189owhaNq67s5TFaHpNfxLT7Ie/aJnG73Zv0u1P/C7umUzqg78pt0kQlsnDrRRvYS6ed7QnYJC1Zhj+T/Tzn17OY0uIbE1QzXMArPPGcLPkHBr3AYzB2TymOPqFvo0dLcc7VsMkJK5ODM5h3ukkvEIvmn7JwRwVTkZkshr8k7qSXqpmCcBs18pRL/JQ8xlSVSgPpqCZDKlgVGgs3NVx6p9PpkSRiMfkNJUbM+2/hj/mt0szFtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cr009KoTtDJE9QEXTe+o2Ce2qgZ1NhqKux1eZCgiRNw=;
 b=ddzinIv1/dNFpZxXQ8g1mGJuqGNuPMtGfLayU0w8aFZVCfkJBbYpHjmwhDI8LHVHsOMyS91nZ4M7B/ppdZbygsH8EZXyP6oZj2MogSEiwHMuO0Zjonb3YDhiEDTsWBSAYRapNZdMAtMNbg9joGRI5Hu85jS+T8HBLZ36P4Xkq0s=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PPFEABD4EF1B.namprd10.prod.outlook.com (2603:10b6:f:fc00::c53) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 10:32:37 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 10:32:37 +0000
Date: Thu, 8 Jan 2026 10:32:39 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
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
Message-ID: <3e5b8889-bf3a-4436-a99d-0396081e65e0@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6ec883cfe97bf9eb50f71b00c24723f5ed4c273e.camel@HansenPartnership.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ec883cfe97bf9eb50f71b00c24723f5ed4c273e.camel@HansenPartnership.com>
X-ClientProxiedBy: LO4P123CA0213.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PPFEABD4EF1B:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7917a4-6a9a-451e-7ae9-08de4ea13e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UTEip+gCKK3uqrWMZOJM/ng9nzkilcK1QZ+VmHSM0SDuInPJlzM59i+hlYw5?=
 =?us-ascii?Q?OU6r3oxXZ4sjp16R53z/nfDWC2I+0zRYGq+02I3eCTAeGv9Z8Bcmv3Mryn2v?=
 =?us-ascii?Q?2ZPlgQZxSwiUA2ypaj3yHUUG54OiK5t8gRbnDn47Vxu8651rDcVpPrHHBlAX?=
 =?us-ascii?Q?sTEsSm9g+AveRF865CwXmMeixFfWcXatnwWNIpvO3bjWS1lQzBLrh6Z6ELvF?=
 =?us-ascii?Q?/vzK6BbZ8yE2g3Yu2Zo9jiYC6N2/U2w/+5wBeY2/kftI+q8CslEesIBx26HQ?=
 =?us-ascii?Q?A/i6MwwLaWWXteXXsnzmxGff7fargyOxxpN35iMenI5d5yj1Q9iDF/Y6xV2m?=
 =?us-ascii?Q?S/BxD6w47SDLwYqj4zo3DSPqO5OMfVa8216srnxnKa8w7XYD1qLO7Nn6hThT?=
 =?us-ascii?Q?/wJwp6cESbrDw2/u/121Ov3qOlqhrPKYaKf8oAqYveBb4NhqsAAXpqFHqp4z?=
 =?us-ascii?Q?9hbdpITk4qbReNwuogXtap4PkK1qU2zPitNrnlUnvzUcxtCDU7rSp5O4qB33?=
 =?us-ascii?Q?LduGIBCnAXQQWsmpZrkz5AXjkhwz2BU+M8r68L9GqN8eb0YHxCHHBnyDLqrP?=
 =?us-ascii?Q?ZLW6RKXPXMGXWUTgeHKj18cFEpBi/qcog9qScqfqVpy6RgwgUTcYwalkIghG?=
 =?us-ascii?Q?5L9w+WFZZHbTcTu08v6oSjohewqx8NKIlP+KeIBKCPqBp5LHi5xv5DB2ec5k?=
 =?us-ascii?Q?qja2FqmW+NgXWqEaRIKbOqROaL7Y78p8JvCf06HLrEp1oRRmcLVzMDs0UF4G?=
 =?us-ascii?Q?jGVVCJwOw3kJ0FqfkV661dioyrJA/UEHah5TKXYz96FJW6hB05W+uIKjVdgB?=
 =?us-ascii?Q?wFoO7cIE8XkXi1cyYavbP5EZ+kqPRLwgNXFX0Lo4+TO/rRfHOD+y/0+ssLHi?=
 =?us-ascii?Q?zpBSidI+jMNqVUudrW72bz8t3BoN6NSjXI3hu0L6Ma5Yarf1RQXCMOwwnF38?=
 =?us-ascii?Q?0Bv9T8I1NEordRs5PfHiKjI7lg+/beoHSvZQJbjCIXSZ5l8R37BjFEBJGqAg?=
 =?us-ascii?Q?qGGOZUy+3haY6HNwJh/rxMveoJgBtexBYeYyH3geFDmFfi/GIjHbDWteiTrw?=
 =?us-ascii?Q?q7dMMqhtbuIlx/xVvncbpZfPUSiQqxhq0CKh4ECNtgEWQEZ2W6DvtTHP+y8y?=
 =?us-ascii?Q?SYqFtuCtY+yyPyGCN3YygZbXAIviGpThMpOPQudNLP9vhu0yntguB26STOrE?=
 =?us-ascii?Q?gxSAk5Sk882AaAe0myJZbEtJmHPX68Np53ntGIPBXnmujfELtce/Ovi8Zcy0?=
 =?us-ascii?Q?QYM8JGDksQRcxrsVd2RU8tjA6KUJz//1ox3yExbrf3akiCg2EIPK0BTAd08Z?=
 =?us-ascii?Q?sxTnzuwXjsmN8ChYXl6SQVmh2VQqFpORH7Ngr7XE8fUdQQ2SpehE2nxSjfx+?=
 =?us-ascii?Q?5y51vumdii8WfmrAqKFCWmx9sIHQ1YEV/mMcaGTEuCHvOug+JZzcx3C3Kf2R?=
 =?us-ascii?Q?yKS7+WENghblmiDheTOeWPXJHzWXNcqs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cbHj6LDTXEc5Iz2LTAQDji7XiddHLy70XpDBTCk0zUpSyKaAt6Mz0qFiahim?=
 =?us-ascii?Q?LLhup0H+d38EYx3WJXR17mGtXhfqVgtWZe+SYVjtBVd5sX02IA5KBAlZvXca?=
 =?us-ascii?Q?XX6T3QWzT01dZohrj5cDRl0hQZO2EQV/pEO+cKdOz18UiU8w61k/i0xucWuu?=
 =?us-ascii?Q?rQzjSKf8JLTak2Wd8q5xd1gVhtIKPgBOfZUj8lowX7MN+8A3oFS2NvRlANpN?=
 =?us-ascii?Q?++sciQ6uafZ0CA6+SDJ9uTgMl/Uyk2hMg6fVzOqVeSQAhD8d0sp6AaBC6kGI?=
 =?us-ascii?Q?8lmvCuDud6FR17fGETVYfC4vZVo1MrzcduGmUyCUxsOpHFhD4t9vOlWHUhhl?=
 =?us-ascii?Q?sDrCAVThYTq4Z9W3GIVZ2+CKArS7GA3fjZH8OO6R6iCGca01sm8PNqrhVHUj?=
 =?us-ascii?Q?0jv8rRNA7RBC/e9Ofl/Wyva6+vquJLng3cI8GA1jbjI+9whMrLizFHMJvLdJ?=
 =?us-ascii?Q?1MlaJUyPpXlWfb4eU+4lm/euSy8tt9WF4L5zomA5LmdqB9aChQi0ni2nT7pw?=
 =?us-ascii?Q?qqVl462Y7RUTRSwL3r2UxuWERu2Rkbu3qZ56oGGVgpF5LrdldU+lc0knqENO?=
 =?us-ascii?Q?Vgvh+QgIVT2OCJMK8wRmaaMhFTMYsqJXSh2NG3jDQ5ctgZi8/H46fnKOzEAD?=
 =?us-ascii?Q?SUmai4n2/FS1CBGtQ7buspYmN2y7YEF4KpGuvCuEP75AIxqBK4HvsYsfcoDF?=
 =?us-ascii?Q?twH6hmgOvSa39/iTaEI8FDZfbN7V8UjcryiAIRH0kjNkmf77FNwcy0cu8USE?=
 =?us-ascii?Q?p1mbQE78E/p1uMYCrzYucej1Mu3/eAUnKMLJ2L6xpLtxYAQQ0k+LjMNBj+ba?=
 =?us-ascii?Q?3OsrOf5nhdXcT0wrSqETSwu8XaQnbzgymFVZk6ojyJYH9BCcdlo6n9CLzw3H?=
 =?us-ascii?Q?f7+qgde94gjVyY+XbYmkk5JT+mGNV4Z2ZZP36jc3f/37htGMdK+/gB9Y0TAi?=
 =?us-ascii?Q?yy0yh8AUye2H/+97fL9FVUFgk+jJhc05E7XAnqmeT3skpjwU9KR1TP5OfNjF?=
 =?us-ascii?Q?n6hc3Q08moFrc68/aWkzlluWJhQ8oi5vSOORL6tuoZMRXxFZgbJkeJ8mgTss?=
 =?us-ascii?Q?vGI/xjfcey78TFSI4F0W5WlUQAxXK8+B0e2NrwXW9TRqedBs5bW3w5UOaVbZ?=
 =?us-ascii?Q?udjIcFru4qWuSoJQenxH2H9a9geZ+4ewZAbLPapO1D4fwUxCaDPVkYWjFTyq?=
 =?us-ascii?Q?uEyi4zFuP/UOR3vzXVU7M+wvzIXkN4cnukMTpie+SdJN3uUXeXKvFkqUawrI?=
 =?us-ascii?Q?NlzNzKQ8f0jnOdQv57xTx0Clu5Mbo0GePSQNUHIkG0q3nPz15oyoS8NOE5Sv?=
 =?us-ascii?Q?Md7YUSb/jwdBdG1HNxMOixIca9joJBVMgJLdo8rFn6C0a676yWDaAvPsQE93?=
 =?us-ascii?Q?w14xqptgDbKGLxf97SiVCYafGOqgRUyEHK7qyOeiA/ICxwGf6fqZ3jge0ZEp?=
 =?us-ascii?Q?OlshpVaQ/k6E5V8orGu/8S4+DRPfU/MDgybW0S7cCFZLiEL4mQdIqgcpmitm?=
 =?us-ascii?Q?q+Bny/pRd5zXi78YT+B8f32ScFp/XLbR9CMOgXNLZyE0Cs+6B5HVO0q0yH4x?=
 =?us-ascii?Q?BsUd4iiC6qyrMyyou+VxJ1ojynQ77VXY45z+b3tNHCD+iduoJicVVOSuiLP9?=
 =?us-ascii?Q?mBzsIdD1YWNEcWDwbkk5v+4porWOI1aRNFOkQixcKEahsp/Uxe5jELYE/szG?=
 =?us-ascii?Q?ytnlFoq1bYnTuTUi+NUmwHcWf2/Yb4i6AD3U2NSa6nPgAr7KIBNyKBwD6IFM?=
 =?us-ascii?Q?pTL8AybKDf4+qS5K8Ns0p/qZqZ9B8W8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ja4slhjZn26RVSnUGBT+EnaPyUi+R94wdmlVuLaEqT+Ds7WVCRqIxK3OmhyjdSg+pO5E1771FwZtIhYqEfmAlemuy1pTgCMm/0Pb4mpHduJjSkUmj10QdyurMubvoFnC+wqcnH2inidQVoFgyB4Y/3/aMpvy0DZny3ooyZ6nskBvQ/Pn2Yk0nzfs2umhK3vpLaUgFTCupFRQV9/3YHAQijWdnEZOcqMrQGfKRXD2BMtTgJhkGwqMR0QBUqWyOw86V3J8NHRZsXuCjKHbcT45a3oCRLQgRl0IXDO8ApsohCwfqetcFPhXa9hBwWIbjdslmfYXaI0nK9KBOk4oepvvxtc6mxgBeNGj1JD2QovzlUcS4uU5rdKKHFpQ13Xg9eyY/VmOv2Qcbtc/honPuZjj8dCZsETfGkT5UY4kZn9xlyVNMUN7VuEmq4V0G6dRIk55iBArLtc3nhZ2JTsCTswhx5+4uzwyd3m8Y5loq4Smz4d+WOK5GJ7LetoL4PsCJkfWoZTf4X4LGQ5o//nKsUAJILE8dDYfaESU4hdV9JK3E8ag9NU2GYS9f77wd8FlMqcOfAtlpTwW2eazg05W7EzYg2pRG/eCTu2nZ44e7hBZ+5Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7917a4-6a9a-451e-7ae9-08de4ea13e3e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 10:32:37.5107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKNGhOd6yXRkuz7Gj4VGKMrKDnr6ppOmwQlAXn3p9opxI28Ere/V107roJCyL9HQ6Au1MfzSY3emsrDbipUiWZhIXqRCbyRKV0/F9sJOXtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFEABD4EF1B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601080070
X-Proofpoint-ORIG-GUID: 9bPCPegis-1QlD480Cos7URrI_qV2Rhz
X-Authority-Analysis: v=2.4 cv=XJE9iAhE c=1 sm=1 tr=0 ts=695f87ca b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=co8A1OSWRGhSUP4S1o4A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13654
X-Proofpoint-GUID: 9bPCPegis-1QlD480Cos7URrI_qV2Rhz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA3MSBTYWx0ZWRfX+QZb+XkPaNHz
 5Z9i76Tv2jo2mCdcqujkRELH/m+kQmBSYrocH7kPX95EQdEnFcNXrXoF5elvdIH/KmwjM0rgbMO
 8EipgaBCTvToKaVjDSpVCnLtjCCeQLAFl9EKTtwIPvScvBXmyYgkOdAB7pKik1LjgYD9wbSx1Cz
 8vm1b+QAgk6C6YnXCfEKKDL9weH8aYwy0g+MTIBHspvBOkXlT5P9/qCdrD78uM5qcFxaOkDc9yd
 HiNTmm1buCr+e6ZHXx9qxNY7trxvXaQZAQ/0YF0diVd8UoK4iNV6oJV1RyTP3OROJPRRGh2zKvH
 8R6q2rigM4FQWIMgISxIwVxxy9sA5fJfR8Xqu53XqWVsRXDzvpNmCHPQbw68EjRiF4QgnG4hnyx
 FnBJmkQnjOu3jgJAbhLV7ZDeAjU86JFcwfPQeFcn09XyFJW+bA3ndxTdq/ro1yioWtuwNKMMqYo
 7Doycd1RG8F/Wc1EMETfBFjzNyaZtv/k8G024DZ4=

On Wed, Jan 07, 2026 at 05:39:48PM -0500, James Bottomley wrote:
> On Wed, 2026-01-07 at 21:15 +0000, Lorenzo Stoakes wrote:
> > On Wed, Jan 07, 2026 at 11:18:52AM -0800, Dave Hansen wrote:
> > > On 1/7/26 10:12, Lorenzo Stoakes wrote:
> > > ...
> > > > I know Linus had the cute interpretation of it 'just being
> > > > another tool' but never before have people been able to do this.
> > >
> > > I respect your position here. But I'm not sure how to reconcile:
> > >
> > > 	LLMs are just another tool
> > > and
> > > 	LLMs are not just another tool
> > >
> > > :)
> >
> > Well I'm not asking you to reconcile that, I'm providing my point of
> > view which disagrees with the first position and makes a case for the
> > second. Isn't review about feedback both positive and negative?
> >
> > Obviously if this was intended to simply inform the community of the
> > committee's decision then apologies for misinterpreting it.
> >
> > I would simply argue that LLMs are not another tool on the basis of
> > the drastic negative impact its had in very many areas, for which you
> > need only take a cursory glance at the world to observe.
> >
> > Thinking LLMs are 'just another tool' is to say effectively that the
> > kernel is immune from this. Which seems to me a silly position.
>
> All tools are double edged and the better a tool is the more
> problematic its harmful uses become but people often use them anyway
> because of the beneficial uses.  You don't for instance classify
> chainsaws as not another tool because they can be used to deforest the
> Amazon.  All the document is saying is that we start from the place of
> treating AI like any other tool and, like any other tool, if it proves
> to cause way more problems than it solves, then we can then move on to
> other things.  There are other tools we've tried and abandoned (like
> compiling the kernel with c++), so this really isn't any different.

I mean using the same analogy I'd say the existing norms are designed for
spoons, you'd probably not want to apply those same to a chainsaw :)

>
> Regards,
>
> James
>
