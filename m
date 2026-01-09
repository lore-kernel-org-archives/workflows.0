Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104B41FB1;
	Fri,  9 Jan 2026 07:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943733; cv=fail; b=HPHFvGUb08IvbP7cY31FC3zCMkEnZJmTHtDkoe3WhhBQB6PiJjuBjTGvMoHtgVQr7tG4ouQKKp1hHNvVxz8jxRrnTaaPS+dD5z5SNUXqpB2xWCePHFKXWmgnmZS1HM+z52nHqlJjPggFG3BxMMkNNWjKEwQGinafbvmXX+HgJsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943733; c=relaxed/simple;
	bh=AnWz7VDcggJIb8pxeXf7VES2ukhHkm/yhqplLN6Wc3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MxzH6UOP5Wmix7Hi3+oxLiIFt7jsuRGVbzX+Ei030dEjdgusUJQgc/ppkDE2OtawBJQaGHaQsTCVSbBK9wZczrI/nWdn0bYBvyYAAo9LP3ly6M06Op+dHjcQyKScbGN+OG4VuLC92lk4jqSD8TFDSNIFjOIkIHs3zKRxGaohrLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cz+M0077; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xUXF4rny; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cz+M0077";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xUXF4rny"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096uq3C2117045;
	Fri, 9 Jan 2026 07:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=B7V+FzySTsQ06jlYK0
	iuIOtKOeg759l1vUL5WNSeo5s=; b=cz+M0077Pa8YLTl7vEMWzG0tDCsd61P2fN
	6QwbZjcLFiZXiU1EyRVSBRWreGQm3QiRDT0vQsOS2y6eVTlitxEsUSMt5CfRO7O1
	b8wObxz9B66dNVZk/DK+rsXVRdboI8NEzkk3e45KxqthdfMq22UeYfGOP1UR7yWm
	j4VfDUCS+cr78MSt/AqbdY4uSjb1bYIdF1LFx0kTi/eyOuNbtfXhA+hU67XSNRrm
	IM7lgFPJ8tFexIhwnWv5VGkeigY6QEbIYQrjWtY/zGRXpfM/Ctb9VQM2qLOKCRmA
	d+3YRDXCtHctNBE8x10Xxkp6n9P/HbBI+82v//mmfZl5KtshNtlA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjvuqg13t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 07:28:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6096QMLV020359;
	Fri, 9 Jan 2026 07:28:36 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013047.outbound.protection.outlook.com [40.93.201.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjp3bkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 07:28:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rg+mr8g0ppHHWfhVa7nc7OG+MM+/65vmw43IfljTZunE+uPC3qlVX6EDjs4VsGB8dCeuJ1ii+Wap5Bkh41tWa8BzqGMg72s18mTj5KgpDV3BuIsf1iAjwlKcbnTEEebup4XHmfsIZLEVpeY2IeW7f2FSMra+PY9MpVvz5fS56tXe147lvrakg+MsosyuljqYlPVtcFQp5zvvCPDumesuTggKzY3mvw0inQMxPciU+IgYg9ynQRLTmyNndJmJkFTtde1/n5Eq86dH9rlI30trAfYstI08epDRa88eoJ/G+XZgOmaf12S1JK3k8wR7aZ5IFOrJnrb/2AsYmep1r94HqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7V+FzySTsQ06jlYK0iuIOtKOeg759l1vUL5WNSeo5s=;
 b=YSS0ZRnJb31hzLFcPfALA17qQyDHxnxtRJvg3eVzYSMQ9qrgzaYxnZOu4wvwLJT2tIIiOUMLD+pfxyoNHZnPHoLeqMg8ZbYM0GLxGSLW6k3LHtOFTXTdpiAhaYgZQIeWfHnp/PyhiHwnGJSc7qw8rmM97mOJ2tBYSlG8vO3nv9tGOQP/+3VxFa39tf7r/ZNdPP/ww3AuY2yzSM+pr9csTzw6ylbtdYvJYuFzj5Ri79p98aiXHMh4NwlK872rS4xpjyD5KZcrL56XVHM1fFIDtuPfUAXFnau867hWxDD6mBamIA1I22yhMnf/ZiQc3eQ0LJdpMRJp+/8+Uj+2dK9FjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7V+FzySTsQ06jlYK0iuIOtKOeg759l1vUL5WNSeo5s=;
 b=xUXF4rnymbsO1MNTl8BstKyzYgUD8U1x/lXCfwnFaFLo+D2zn4+U6J2f7aGRNLSL8D6NDCG9z6HA8LG6V/rFk+7s2MrYRWLHIEwAXPZ0LWYBkDrFZBGs+RiTuyg9F0E7R9UE4C+NvZcTnXBy0DBNb88XOmIKSnNuLoZKugpmUss=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA4PR10MB8588.namprd10.prod.outlook.com (2603:10b6:208:569::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Fri, 9 Jan
 2026 07:28:01 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 07:28:01 +0000
Date: Fri, 9 Jan 2026 07:28:01 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Dave Hansen <dave@sr71.net>,
        Dave Hansen <dave.hansen@intel.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
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
Message-ID: <de260c56-d3dd-449c-b5af-4d85b268f90c@lucifer.local>
References: <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
 <20260108151437.3188cd53@gandalf.local.home>
 <aWCVYLuUFZrsbfd-@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWCVYLuUFZrsbfd-@stanley.mountain>
X-ClientProxiedBy: LO4P265CA0064.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA4PR10MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d580b33-fffb-4e36-a452-08de4f509edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m/CAQm6XeR0yDRGKYZKjP5fPYrcqw2R/G8Mb8HmnQh2uQLfngAj/3KzSaFZZ?=
 =?us-ascii?Q?2AhCQgBg9HVa2R6KnQsTHPC4aV2j6YZacnGB9yYHHWGwAEgIWCrE1SDIzn00?=
 =?us-ascii?Q?Xr5UBTcUGDK4EL4G1+rfYwSN2UTgA5FQgB+ip1/riJbGjpsXoX1VjIThSoD+?=
 =?us-ascii?Q?cFa43YK5HXAqH527cLLu0ame9HIMIfD0zEBnyGjR0G2Joi6ApmagFbPccHrd?=
 =?us-ascii?Q?p6kAmt2zhKgR+2t9a22t3gGG6WHkdC9YVGMFEr9FxiL3V4J3w52yZi4RwkR0?=
 =?us-ascii?Q?Rtc4fxEAaWwU5eO9gwgG9GdjFFIkJnqcY7aABFyy+Q+qL6ukUBEqaYfTC1cX?=
 =?us-ascii?Q?PlWJW3qE5EfbbVkyO6ERPQzTHCAps9T1AxILGuP9N1QXl2Xw1vDaNkKiLSfe?=
 =?us-ascii?Q?JBtqXc4HWLkO6pHZy6I5KW1xmOgnjVVQiI+QrnI6yrxJTHAgLj82Eg8keE3A?=
 =?us-ascii?Q?Wh9RiIJ/wSCfg49sfcLCVjFIOELXX5tnZ7KpHF86UL6Qvx7Ebs1TwOJEpjrs?=
 =?us-ascii?Q?OWuQwMTH1ibzHdJpPZfHFdkAGpqNDlpC+eVuwtQEZLM5MDEjLRJDAq0Pxdh/?=
 =?us-ascii?Q?1fVM/f63q0nG1ba+5b+CMsp9+pU/pzCI9PnN5g0/ui7ix9rklOQm0uCRj+9q?=
 =?us-ascii?Q?rlmYFO1Nw3ED8JOg0ixjB9jmgtlK4aq0TsuEF98jh9ppds5sXw/UnuHQ6T1q?=
 =?us-ascii?Q?55yUOF+S06vAoBmBbb2EtMHGJ1+nH4tSQ1ZTNAs8PzsCPba/iAPr7NRJnZgw?=
 =?us-ascii?Q?ZwxByZNxE901c1y1GjvRLLoZNH2EZTSuJsy3SjG3Vpnd/r13oiO88EpGXa8G?=
 =?us-ascii?Q?GclroPkyaJzdeHPgToKT2b3ZkGXbKkrKc5wHjc8VDIfIq1X0seX/kNLOEGE0?=
 =?us-ascii?Q?uRzGTwrTv3AYeofwRqUuZqO3D9+5he3htnAQqr+ae+OkvmFIV+Y5b85Aicef?=
 =?us-ascii?Q?ImjQQCHRld4qOW7rvZxuQeWeSU93fz55MJFfkM+52VxYyjUCEzwVSFDCXQgv?=
 =?us-ascii?Q?+peH3zhjPu0IRHQluKwtF6nx8o7u6XeNh3403xArJ2k7BY3np5o7wddoQ13D?=
 =?us-ascii?Q?3wQnPNKkWkIIjBXOZOcaO8hYlM+alWSh4JAVulg2XItuguFbZTwisIJ6Exdg?=
 =?us-ascii?Q?G3JhUWmx28GzotnPM4JbrcC1SQgMH88gcvGsACmbkupRYDZylrhAyOL3c4r3?=
 =?us-ascii?Q?rtKP7oj1UzBF5TJr7xg6h+KxY3ifylleSacg98217m8fTf5OjLjjfcsenBFq?=
 =?us-ascii?Q?9amjGDL+RfH+7Sv+sAp79V5uewmIuQsTzl0NPJjC8Z6Lq4vb+faDEs+RT64D?=
 =?us-ascii?Q?OOnoYDYbApnM1T5Dtnhi4bAWyxuVoFpekm5G3/aFURuPO1GQJ3MlTe7Mfc/s?=
 =?us-ascii?Q?E9GkqbNtkUUSC+hivpYwXm3hJLSnSEbPt63sWhPb1j8vrlgWR08jwgwr81tT?=
 =?us-ascii?Q?OFKL8+TjrfoChypm2lwXUYKqn1H0FY+A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k//paEYuQ8fY6xY88GM7fistFCSSxVY9vH2a1QT1oKqwZgwXfQ+IT04EYFyF?=
 =?us-ascii?Q?5m1DBZfA+Mu8NbRJMgg9B+LT8+mjVjjq+fpyUZBV5JrfiyM5nMUy7Cfzonls?=
 =?us-ascii?Q?iAUTRR2268QphTZmqLbw5+EH2ERaftHJryGUqbYQx7co1czRLjdWfAJPr5SC?=
 =?us-ascii?Q?rN+jv8pYwQOm5ZjKgKtiYePI917WtuwFXIszcv6psoz2nXLfpNWeARsojddq?=
 =?us-ascii?Q?mrxbur+S0C76DVBrVlr3cFBEv1jGfaEOdes6YaS7cUAqDIbPw+qfwbQRrQAQ?=
 =?us-ascii?Q?HiciB4tvuz/0lecRltWhWzO/ZIpssvwSCG4UoyrEjF4zcPF/pOoR6MGTzf2Z?=
 =?us-ascii?Q?e6qGgnEM+iybU/qIBkTlN08lQUUwaDT1xIo0Av5Kk9+yZ7slg//e/+ZHNjfg?=
 =?us-ascii?Q?6dZ3rKcUsSCriDjy+MzUP4NAtiqfGhzi05eV5lCPE/NJTDBoqSf85xIdU1Yj?=
 =?us-ascii?Q?+0MXWzFg34hMAuJdy7HoSjfk5AeTAfUFBQlZZGSrrx9kWMZ7Q7puZUw7Vxzh?=
 =?us-ascii?Q?yb+2D/qhcq6YwFR/UP9RQMGR6vA8mLS/VcI2z0uxWVZ77FLLALxPS4yisOb2?=
 =?us-ascii?Q?iVBbmG3k99ExrJCyfLzVs3J1KAycsf07FRxa86eCszS3RrRz8tFuRp76XiF6?=
 =?us-ascii?Q?gCHKHyh3tDENYZuKHnnJuD5MzGhJ0Zpxl3Gya7nTCiKNt1Ju97GNlTN/Yn0A?=
 =?us-ascii?Q?DSyfj+cMoN+rQrZpPXiXei10fWp5duT0OH2SJGdif55jh1TEdJ684wx+FXS3?=
 =?us-ascii?Q?BDNb6Z0DOsrNzK0sz6PV6jCYBHzJAaehDrlyuj5R9R2lxS6/+giziBzk4ffD?=
 =?us-ascii?Q?HpxvmmLlE6rL99KbHuNsyElt3GLmDuBCfX+FVSUTvhfXTPN2iIXDTWsyEF46?=
 =?us-ascii?Q?Fs077J9VQmFqVn3lND3SKJoc2G67DyUoF4ncK9WfgoHhtEUYiab+qBRpB3J2?=
 =?us-ascii?Q?OJXuJlGcRjG44Kt3R5YoD2LONv6joZaaeDnqNitghDG6ITJJbK0p36ixD6Q2?=
 =?us-ascii?Q?kvMjG5Wd29ZFCbp458dkZe0plfVbajo3ipnUNNmuDUmlrFaQmWLQsKbrn2mx?=
 =?us-ascii?Q?nBhqz7hpDe8ImpCVTw8pIrDZwOjEy+DSeof0An8WxSnx7jR9wdkbZb3czhaq?=
 =?us-ascii?Q?srZWEgPCD6Hxlt93qbxm1Dy8SW5hD8A8RKq7cQghFQRN7TTo2Xi1P5OhEDeR?=
 =?us-ascii?Q?z/F8izn8l7nPZNKVM0HwDoU5srYtSJEtR8UsNjzxqmvG//P5I1eBvu72o8es?=
 =?us-ascii?Q?cEiiV+MaO8+5ujnOzsI3d4EzuQFPTj60T+3WVLh30v+jexmZf33oL+Hq0FIu?=
 =?us-ascii?Q?oLyQ2MOHlN91wd4mNdaHZ5oMpSuXBWZhN5xhMV7wVMU17mQjhN4kVaIGXvlm?=
 =?us-ascii?Q?+rxTyd66Gu2VckqOOUns3c36Qjsy6zO/kuJYkrasIQR6LwXOkhnWipoJwZWV?=
 =?us-ascii?Q?9apngfBsTFcZWBXmtqDhN53ELDof7sCKovN+8TxQrT2GAKrqnSHfhYegJxrP?=
 =?us-ascii?Q?gFWeiUOnbjbS/XimoKN8xuOJvmLAnZpBl3MWwITEFaqbahZIURBLz5EdL4p4?=
 =?us-ascii?Q?DRuXgUCFdAwh6Ux0xI8TH98oq5UAUMi0TfkwYqoRJc+3NNeHwcO13B7FZgGJ?=
 =?us-ascii?Q?bB98xSPbxbh7GoOEQOGGlk1OIVw5BLFWRerpRA1F71JpBnKCSfMxqNCm4lzm?=
 =?us-ascii?Q?thbKETqz/iockrGxUgc7NUl90boJH3hmNinuiAVi+st7d0ArdL6Xy9fY8kuu?=
 =?us-ascii?Q?EO58nYGsmI257+gzLruAau3wnZLfx4g=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8rNtVnWPsr5nPYv5P1JH57r0DzADIRageAlZO5xzn+wAR3s/UgPRVX/v06Cl2kpuYO0ubp3qrus7qi5pjvvrzc+qNLzqIrhj22nUkjlYgUA6+Tm6fqHJ/5n1Ev7NO/oJ81V0sXvUOrP1mSS4K7oRmWz0Z1HjHcXlzSJERjJ6D8psJT+oGxYXCeJutZ9/UYMCnBQ1Rakrw52f8k9zdInmCvl6PAIalvNo2FmjaKcXPMIXjhfq0p7CyhdVpdfNxobjwLmyMxIADzlj38zB5kpP2AHsIXvVxJJTPkYF0PfWRRT+AkN/xNbUOmd6EVehOMUhQLEdy5Wq+ge/aMx8YzAMB9SGAmPQvISTgbWTF9/33EJWIyiej4+noXWHaYdl3QDkuMs10p8xjFesh1y1pK7tyrCTF3Bm2oeplxmN4dattVFQJx9rAiI8TlF4R+rk+YzK110ru5lnNHLGzlAbEASdgm3HjKG62iAMqwWONilUkznYSxReP4Mp8UYaImwop1r0kgmXw9FHtmXLpR7ugJytH39/JJEho/f/5AhaYZiXBFhWnYlC6uYta6uk6OnvS55U2/rBha8qg5AJdJoRrYF0cy2Bl5PbXh/cvOZIw+eU9aE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d580b33-fffb-4e36-a452-08de4f509edd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 07:28:01.6239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZzNRyMVUoPu+bgYq1epeWXSQ+IBw0bexfavNaqBfFS05tBCfoSZb6GrMn6miCGXxdbh8pVmrDILd+fD+plZwsPTFYkcbu0gLwl4W94pd9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8588
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601090051
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1MSBTYWx0ZWRfXy3OCnE6dDG7X
 dMHhBSUJU4YY23dMqTy0uGae+/JwG2PBTPoWl9S5NzaYHVkDcZmXMXPVvacFPTyQuxsU8LSt2J6
 WcZSazHOHJ9wn5WX0OLH5Rb3UPmU6GeiGUd4hwx5KneH/yYJS0cOuO99d5tao87/LAOBZis4MmQ
 7iFyDzU8YyZi841fusUgozkw1E4qtpvcltl9cy7ByMlwvBUFNDdtlv6AuKdvQQoTKE5DXQsen0E
 IwArPNPZ9riD1JLjz9kk03cbPrC27Ym/3RpostAJ1ptt5l2WFtTt56D2LAvlWGRuC/YNpAjkBBF
 i/8n0HiEFU2YccGKICgopAFp3IjQVZEQ0hAba5fkJU94eD2gPb9vc7TbEX/MrwpNOC6t5VlkD5X
 kg+TUbwIn5Koo1q19WWtIJp70X0ftuTAXtQX9jfUG1ZnLxqNi6iGjxPiZ5m+66WesdA/aq2hF+o
 RYI91GK+xOlhYKDF+m3m91yH/4JWF1WX/AnvZaSY=
X-Proofpoint-GUID: t4ZtvE1vUgTdUrp8LHPVPkBaNSvgn3SI
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=6960ae25 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NtpouL_lAAAA:8 a=Sf9JE_-E61BKfId6eEIA:9 a=CjuIK1q_8ugA:10
 a=DuzYyTm7k8zw0eghYlGn:22 cc=ntf awl=host:12109
X-Proofpoint-ORIG-GUID: t4ZtvE1vUgTdUrp8LHPVPkBaNSvgn3SI

On Fri, Jan 09, 2026 at 08:42:56AM +0300, Dan Carpenter wrote:
> On Thu, Jan 08, 2026 at 03:14:37PM -0500, Steven Rostedt wrote:
> > On Thu, 8 Jan 2026 11:50:29 -0800
> > Dave Hansen <dave@sr71.net> wrote:
> >
> > > On 1/8/26 11:23, Lorenzo Stoakes wrote:
> > > > I'm also not sure why we're losing the scrutiny part?
> > > >
> > > > Something like:
> > > >
> > > > +If tools permit you to generate series entirely automatically, expect
> > > > +additional scrutiny.
> > >
> > > The reason I resisted integrating this is it tries to draw too specific
> > > a line in the sand. Someone could rightfully read that and say they
> > > don't expect additional scrutiny because the entire series was not
> > > automatically generated.
> > >
> > > What I want to say is: the more automation your tool provides, the more
> > > scrutiny you get. Maybe:
> > >
> > > 	Expect increasing amounts of maintainer scrutiny on
> > > 	contributions that were increasingly generated by tooling.
> >
> > Honestly that just sounds "grumpy" to me ;-)
> >
> > How about something like:
> >
> > 	All tooling is prone to make mistakes that differ from mistakes
> > 	generated by humans. A maintainer may push back harder on
> > 	submissions that were entirely or partially generated by tooling
> > 	and expect the submitter to demonstrate that even the generated
> > 	code was verified to be accurate.
> >
> > -- Steve
>
> It's better to have a grumpy document, instead of grumpy emails.  We
> need it to sound grumpy and it needs to be the first paragraph.
>
> AI Slop:  AI can generate a ton of patches automatically which creates a
> burden on the upstream maintainers.  The maintainers need to review
> every line of every patch and they expect the submitters to demonstrate
> that even the generated code was verified to be accurate.  If you are
> unsure of whether a patch is appropriate then do not send it.  NO AI
> SLOP!
>
> Of course, sensible people don't need to be told this stuff, but there
> are well intentioned people who need it explained.
>
> regards,
> dan carpenter
>

Exactly.

Every version of watering it down just makes it meaningless noise. The point is
to emphasise this.
