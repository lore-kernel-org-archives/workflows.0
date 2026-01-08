Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A98B39A81E;
	Thu,  8 Jan 2026 14:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881271; cv=fail; b=bQjc98m45ksvKoODBzHX0beswcYJLnVqeS6fZyMlwmEcY3jKQtMsROfjV+V1PygCrVZjm99dG43QDdcapAGz2a4xfTtDIN+lFIcNRtmaM3qt2k1FuPM+DjhQv/LI8Qx/OLzTaBLEm8sBT4Dk1qsYt4cANdQuD/KEnjx2ANkC2VI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881271; c=relaxed/simple;
	bh=O1UkaqMw8U/cfH7YBF8bk4xUPhD3lP8Tice6qE7VyjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A/lEW7g+lTzzebJX6sX+YZFMFCKMudgpS2a8+vyiQmFbEV2LS5WWl9GqqQYUwfokGbKsKuk8at4zegoybORSr3unAABziOKCofVdDv7u+T96tLHOYVojw8GTxlmn222iepjnC3Ip71nAWle6qPMnHPMYSC9PcDdiOMZJpmAlBSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SMSzEf+s; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pYY4qhrJ reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SMSzEf+s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pYY4qhrJ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608DNHeX625731;
	Thu, 8 Jan 2026 14:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=SlsBs+RrUxEaUWh3WOGNB4bquLvGgXnoSjh3URIqo/4=; b=
	SMSzEf+saGJV/jSiXzsjO5wTBzghK6PNwexz1oVaY6qRrmToe1d4gHIwtsqExT9U
	PMfrXh8cXH4VZcJjSo9h93Jh0m4wdZToxiqJd2ghwVlnNTnddQrG2jjwKUMcM5BX
	Typns4rfDZzEfB83bJv8bDMifrGFL/+TVnzwyfK+G/mA4+F84Ybwc/vBZfQCSj6e
	+bHrjO38X42Mh+YYvPXusfj6qjPL27Abz+jYW2ARZ5loyUNvxT0yDyd/xa9t7ULo
	4pYnTQ56Ndqqe/QM4yERoq/4O27JsQje/7Ys6tPntJ4RXVCv1klg+HQWDY+00L2Z
	FVH8VlJw9RpHo66nA3D/kg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjddu01s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 14:07:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608DrNWd020393;
	Thu, 8 Jan 2026 13:56:20 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjn4sm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 13:56:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKpBDcaxlIlDHAs+mRC2P7PCvSg4PFRXOrd8EqOMMWBX/Hy00fUW/nC8aXxDw8PTUvCOkwseWr87IrTw7marH1q95B0clkOVHMfnt6jiQIB30xrs2ZEGN4qzpK0c4RRpdJcVxZQuIjxdkIh7S+67bh3fdkUx9gFLkWymtTY5MLMisCX0oFnJCxRsyRr5gjsrTT6e7IPQ6KE8ci6QnapCAFnKxTOv6lNA5HXt0VBd8Kf5tlNsnZWHv/xVEJNbAn0wIPgxlVUzxGqnFiP3EHg1+7WJjgoZRFkYj9jkWtrm54qhhDSUBSQgWBwsZ28Z/i0KkilsjZyCP3WVGDMhyaqicg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncfwtywyyWdRGHdrhaCo+ucr0zWzr4z02udsMc8VSqY=;
 b=SHMKPLU8pSgNFIVxA1Ypv83crUFycWkylTYgfYSLA2rUhk6+C2FUJABEz04Pfvz5M75vrKUrEcRiJXbsSqMfNQwIQBlM+o8DGeDEhiP5LWqPaZJ4c2T+vFpIU1kHaOwLISFUiB5CkRCMWEery6J4LBOvo2uuPcjrGqN7kFC09kjsKTliUbJ50UEVV1nMI9vkR7O0+74UYUXY33+3X2oMyMEe28Yp5bG+G8XSCAjZWFghEWPS/zkxERNmVgEBX52S2dwLyObmCNl0WnjMNjlFQOM+WT7hGzBuAWYq4MG1GO3Qj5NAgMcSTOym3Rlntqh+4/3c2CfU+XT0BCtJUYzSPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncfwtywyyWdRGHdrhaCo+ucr0zWzr4z02udsMc8VSqY=;
 b=pYY4qhrJ0cok1A3KtpWQmTJyowCDYXP7flN9c5qxVNqT4QaNbldDML8rqa/UMrAbUlvouFRLL5Uwn7dOYiEU6zdRutoTvNe1x6n1hoL6MrPXtUym52UTrSM62sqXxtHjpZ5Btpyhxa65pd0MHBNmYDKGF/BxP8aTJ/veteKPhCI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB7984.namprd10.prod.outlook.com (2603:10b6:408:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 13:56:17 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 13:56:17 +0000
Date: Thu, 8 Jan 2026 13:56:19 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Dave Hansen <dave@sr71.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
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
Message-ID: <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
X-ClientProxiedBy: LO4P123CA0127.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: b62ec260-8e77-463c-61a9-08de4ebdb19e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?aG5BYupf8QIfQbUz8ftA8gf4lriJ8cvqINtkdbn0Flwx1zERUf5PONBOlx?=
 =?iso-8859-1?Q?L2qNvzqcEnVN39nK76HdErV4aOpJjP435eiGLgVKlCBcB94PBDhjxgx/sY?=
 =?iso-8859-1?Q?ewONQQyf3cWZl5wKUhfTkRAf++beN8Pr/ji953rifQ1TS/Eq6mzLqAf3O7?=
 =?iso-8859-1?Q?RhYHas3yVtbZ5iU2mssWcalGedlqPVd4Bv4MLd+3rgWHTmJZp/7M9CYFvs?=
 =?iso-8859-1?Q?6kz2CJzHnqx7xDTgIrreLFnNYA2XiY5ebCPLN6gU2SCxgRn+A0HgQHYxiD?=
 =?iso-8859-1?Q?BZGN3lozSUHFNj4Gp1gZS7L2ANlU+IU/ledGYwyAxK3rF2yflex17MyAsv?=
 =?iso-8859-1?Q?TYlzT5aWY9s1MCg0M2ERf/DsHWCIYVaY7CDrf/QiqWFggVj8YDG2Lsw1Be?=
 =?iso-8859-1?Q?Mui1EK89c9MJFpXTBOg43rw8uZsZWPzZ7+nyQ7lf7lTT+KAcpoMlQa58zh?=
 =?iso-8859-1?Q?g3mJ/7KJcl7GUYCstLZyzEDdKsb1ibdHRJqDBP+EiU0ZTkLTS2yhs7IT8D?=
 =?iso-8859-1?Q?QQrvPXu8B3i/3F1mqKrswrt6e02Z9GKQiTqN5Wmt3P4PW/moSlBP7My7a/?=
 =?iso-8859-1?Q?G49M0atSzqlm8y56Z2wp7/H2N0oJhgJtlIFc7tpwhQYDn0K4rC+MHH7Ye1?=
 =?iso-8859-1?Q?8rAsesp8jKmvp8wY9z4qDvtoR9cw3TJ6FeqMvtp3c9JeOBaGd/K1Xa2c1y?=
 =?iso-8859-1?Q?0r/XMdvB2/F4LIrP4qbp4Um+FwoK6upSCEah+wYFHVF1Cb4fdALLd91gfj?=
 =?iso-8859-1?Q?MPUTUNZcb1zFsRin6kn+Pqu7lFN72RE/rcquYlKTa8wzjjJVL9kBL1omtS?=
 =?iso-8859-1?Q?8gbtfOUCU3Lei0Nsa0KaLEgJF3/rJByQJ95mScTs/4fSI2yxZi/a88bLSL?=
 =?iso-8859-1?Q?SgayNZJnP3L5hf5fzAPelY4E1jRLtqKadOpVI7Z4m9niWO8KVxo7Wgu+Hj?=
 =?iso-8859-1?Q?XSZYWpgQaq7+lnojMkB7tfuyYtIECJiR5Q9IFTQelOB5gR6kIj6xT6OelN?=
 =?iso-8859-1?Q?NV/OvzOi2am8skVR05aJumkgTaOjR7VUIZMvhGvjfJWmiw5036gNX7+xnV?=
 =?iso-8859-1?Q?/aJNP0PXuZ9fy9G0Ovgw6E9JKE13kt0ttOekX6E8wjrK2ndRw8POF08nHD?=
 =?iso-8859-1?Q?CV+wScrfurISYzfKK/ay77p8TKK7UMA1gklvCduTg/CCvHDQNhaCF66cOE?=
 =?iso-8859-1?Q?T4OCTevTYzUubR9vtWI3YbkoLkc1hxEXvki/lV5fobO9gkbTfEZhiBmkQ2?=
 =?iso-8859-1?Q?15wBMMGgvWnD7kpkbMoMvzr70Vp84CkH+mUfYxVPWdCMpZpYbNTnEydd9x?=
 =?iso-8859-1?Q?50jwzPa//2sUPeQLIqHTFMNfUL6ZVrlVxAPHkaLrVOwUjIMQMdq+Cw0dnK?=
 =?iso-8859-1?Q?ZVGJKtxLWItUax0MNDnx6YrPOT+2R6f8napYXP+7t59DeJhT5P5qqT8rRr?=
 =?iso-8859-1?Q?b8NJukbgMS0Dg0RJ580F54dxLIRk35LiaTRM7EkyVwGl2F47mBpIhRiJpr?=
 =?iso-8859-1?Q?PkRPlE8yG0k65fZN/03DiY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?HHHKxTBD42qr+GC0VUojoJUxPuXloyp1dqfmfWvjlSgWk99nPgPQj/SZK8?=
 =?iso-8859-1?Q?Ajbyk030e+PSRpoZguAS8sCuGxZ8K3UgBt0EEcD/w9yZtFzMfrWDPSCZsA?=
 =?iso-8859-1?Q?tK6BxK+KzFjZ0sx2CPnEwU+zJK9gUfNCArSA4Yyyi0qkuLQ+y1Z5wAeCho?=
 =?iso-8859-1?Q?JEeQuNW/OwPbf3cvWPDcGY34K9oQhN8nDXIcIGXL+cUy3MTzpMoPBJbcQ3?=
 =?iso-8859-1?Q?oagfLCiz320gcLEUgLQuTLDNyCUYNc+nzVZ2W/veG7PSwKzVT4NKBDa/xC?=
 =?iso-8859-1?Q?glHoXPtoT8Q8GVRwpk5drTFBVIgKwiRXWgZcbTMDcViR1DPodIWwEkMfAG?=
 =?iso-8859-1?Q?YHBvzR8Wo6Z8/QLcFXGG34M6DcVHNhvzSfvPcA9MkhVIF4+e74WS2jaOsP?=
 =?iso-8859-1?Q?47kyhTaKcdsQhxt3jRkTWVN2YqobFRs3Mb6YdVCkzUDVeEqKTVmKqDjoao?=
 =?iso-8859-1?Q?pqrDs1bzd4NBS5anE067VZo1hn9eJaGzUMrGrrc5Pf+sj8+Y5es5iHHecD?=
 =?iso-8859-1?Q?IllyMNbwCQoWWIe6Ih7nAXENJFu4geLPYzElo183wYR4vCLpwy4ezx/0Pa?=
 =?iso-8859-1?Q?TjtB/rYw0e4My34LlY7xElZZHLb7Ef+V2e0oi11t/BpLfETwFcHjMOAiM6?=
 =?iso-8859-1?Q?Du5g1uFT+i4Ulc7Cp5pSi+vhGj6vq0RvHTV4mHXKl1478vlFcZajg0lBJs?=
 =?iso-8859-1?Q?tbviMwvzxWyQdBsWdgNOZI6DbqfkSVt2yTSdrIRHlh7nxKLqe7fXz6kSAc?=
 =?iso-8859-1?Q?pbPkQ9USo+edN4Yk79wV8SQBABUGpN9dd9BvHDx9D+DH7rXJyB8jlRhSYX?=
 =?iso-8859-1?Q?/yPzWBZ0h+kN6HbHzlpT7W1nOl2XqSgwjB9kbdOVbt1pZVC2KBUclDD77Z?=
 =?iso-8859-1?Q?ilCsN4CualQj7VzA4e/PWy6evoLGJXXfXpfaghFkf7eLlDw+HYrT+/nlXu?=
 =?iso-8859-1?Q?hvMBykSvsCZy/GjrlVJfR957R3JYZaYug38dgWJvE/Pj3F0eGlF2HPc/qx?=
 =?iso-8859-1?Q?HXsILLlc54dG+vqKT2W6o+Gw0NWsUa4KVSdKhCL8b5wKlp4Sq/JvWf0KuB?=
 =?iso-8859-1?Q?cKQrNdFP51kVwp84eGazcjmhnPNBwci/U5/csvwKqVzwHai2JwDHSMcx/K?=
 =?iso-8859-1?Q?/vOlMTwt1Ub1Fjy3z+mOUTnUhLi3KXjES5SH8x7j2SMGWYaRvVjwUZyRvp?=
 =?iso-8859-1?Q?diB0YZGwp0OcZQJ8EKV+OPGy4XaNQjsTQ3Al9N/FL60NfX9XiQHmjZDVOR?=
 =?iso-8859-1?Q?1R+Jrqj1qqq8WdPea7riwQC2POqG3bBOzDKykG5MgeyDEd/68RSksdG7uf?=
 =?iso-8859-1?Q?g+EtLMeJMj+5o9I+ndRrS7+r/X6JtEEF/DmOP5gyRUdNzfYiMSbThGNb7L?=
 =?iso-8859-1?Q?Biy0G7XJAsJLP5R9pDH9DhnF1qWnN7A70un7xkVumHx6f5GCYCXdCDZ2RB?=
 =?iso-8859-1?Q?fBLRYilIYqlt79dFuItY9R4pChJHl9G+bUx0gwBs2eTMpnzkbGRWC8L4sR?=
 =?iso-8859-1?Q?RVn0uEfaFF9wmcI+IT7uEPZ0NmiZqJk3PihnYSihDvq4377SqotNlIZmNp?=
 =?iso-8859-1?Q?4g3kXI64sNmYF0JXJ/4UBQL+f5+DQNh/RhEMx5KIvMlcjQHN9FK0DxmgRi?=
 =?iso-8859-1?Q?dp+7ldxRi6zx0KTpi3YwptIWgM0YOcEuiYukaaw7nHec05ZW8aVXcHFtfA?=
 =?iso-8859-1?Q?aYfUJfpXvaIT+lSo30sWgH/gMnDqKMVNDQSuyAFSpCA30KTWuIbElXeQFs?=
 =?iso-8859-1?Q?sfDOONWMfkQOZ5Ah4XI8JVxhPwYM4fT1AfUa/Y+v4m6qV5Q4V9BeAhOu8O?=
 =?iso-8859-1?Q?5iUQ8Uos0iPwQKcjY1FyJECAhsbW7F4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YPPTr+w0WptxTVkvOwpzCIhIBFjw4tKPkPDArqQ2IanSg4+J+ozABy19D4v/AqIoAjx90+uCkpldIRGv4m24mm8p9z9rK5Dpn9FwjfYFjvGUtapzRprOl9NveVapz1L7mDO7d7EmNJ1kbNQ7GEQplP/IAX1u4T33pb+cGEBPsuGzTPBhrHCULkCd3VRzpbYUZxLcaU+j2naxDwgHS5B2Zwj4DHGQmzkEZ/N7lZrxRRLS6TtaLGVzKH70MMm7lBKG3m9oynywyqkJp7B9SyAVAX34sbSmOMWC5kwfh6oH9ECFVjLrc7bdo4TBRcH+mWWxzuKKMPTAToQf3iWU604ibuoaHLerfRSxECh4UOfW5yBGuzNKSNMbPucUAJN7ftvR5yx/DL99eYpfe0UcgoXS2Yn5n6YHhBxAdaVeODFYpnWXazDrBEg7jnVMb2zQTkMhIivUmQwu2efYE5T0aK+8Dc+9NGDrebwAGhLcl45jai7uqYbo8cL0z18zV6y+cUXoiHIDAcmdgmAA4o9N4MYU326mQvzYY35z6AitaBGMjkDwRwvZyQ4XwcAWYvO1V7abWYxG24VDzJ4kXzRESN4HibXztty0eocEARe6mFJCvBk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62ec260-8e77-463c-61a9-08de4ebdb19e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 13:56:17.0896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGMThtFGteHpVU+spxBlayDc9bWhcRF317oVtvEcIaLOvpi7fPvr/15q4QA8rEwN99eUeRbmPx8vgS+rO5TYsk6/9r2A0Tr2sov8t4MNas8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7984
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601080099
X-Proofpoint-GUID: jINXd-e9pMTADmogrnw8aOcL4jo6SBfj
X-Authority-Analysis: v=2.4 cv=e7MLiKp/ c=1 sm=1 tr=0 ts=695fba1e b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=1tNSQpWdiwPHWDWhKRAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 cc=ntf awl=host:12109
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwMSBTYWx0ZWRfX2faRXCS3zKtV
 K60AkrCjGqmrS4PmJLeCFTtCrNUYi97uadTxfrnDvxafS30s9LkYA0uMPukFRxCeT3ETeB9zzsJ
 MMfqUzR7G2iRSG/g2pGgouOzZ73g6TdUzWlKie/+XVN6DxYdnECo66TIe8HD7lCNN+WjK9mNE1E
 N83mlM1zD3hB6AOX+ur1m1ueQw6oMsygXaWgRNGLYJvR17pB7aqLf4o4g45679HrgrnT/x1F0lD
 vv8jRIbCM5pridORNfzeWp2li/muD18eY1NNhmf5EHu9CLao/bIiwe4IpvgUW1sI/9oQ5piDIh8
 /xN0tKQmPwlUVjdIRFbjNBUoAUpgWksWr5TPqYvfOcyOIhTBFwVNGBFmtra0oAEn63SOPCmcIum
 4L76O9uQTctAc5yKb2i80dLv6f5Ow67049lkoA/e9TmZzOs7W6q2VO5yCRDIu1MEz9Oa2p6l9HR
 I2DI+hPjPa2By76IHb/ABOKP2lkLaINMpnLWkkys=
X-Proofpoint-ORIG-GUID: jINXd-e9pMTADmogrnw8aOcL4jo6SBfj

On Thu, Jan 08, 2026 at 08:17:09AM -0500, James Bottomley wrote:
> On Thu, 2026-01-08 at 11:56 +0000, Lorenzo Stoakes wrote:
> > On Wed, Jan 07, 2026 at 04:20:04PM -0800, Dave Hansen wrote:
> > > On 1/7/26 13:15, Lorenzo Stoakes wrote:
> > > > Thinking LLMs are 'just another tool' is to say effectively that
> > > > the kernel
> > > > is immune from this. Which seems to me a silly position.
> > >
> > > I had a good chat with Lorenzo on IRC. I had it in my head that he
> > > wanted a really different document than the one I posted. After
> > > talking,
> > > it sounds like he had some much more modest changes in mind. I
> > > caught
> > > him at the end of his day, but I think he's planning to send out a
> > > small
> > > diff on top of what I posted so I can get a better idea of what he
> > > wants
> > > to see tweaked.
> >
> > I enclose the suggested incremental change below.
> >
> > Cheers, Lorenzo
> >
> > ----8<----
> > From ccefc4da6b929914c754c2f898b0eb17d7fb3ebd Mon Sep 17 00:00:00
> > 2001
> > From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Date: Thu, 8 Jan 2026 11:55:10 +0000
> > Subject: [PATCH] suggestion
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  Documentation/process/generated-content.rst | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/process/generated-content.rst
> > b/Documentation/process/generated-content.rst
> > index 917d6e93c66d..1423ed9d971d 100644
> > --- a/Documentation/process/generated-content.rst
> > +++ b/Documentation/process/generated-content.rst
> > @@ -95,3 +95,11 @@ choose how they handle the contribution. For
> > example, they might:
> >   - Ask the submitter to explain in more detail about the
> > contribution
> >     so that the maintainer can feel comfortable that the submitter
> > fully
> >     understands how the code works.
> > +
> > +If tools permit you to generate series entirely automatically,
> > expect
> > +additional scrutiny.
> > +
> > +As with the output of any tooling,
>
>
> >  maintainers will not tolerate 'slop' -
>
> Just delete this phrase (partly because it's very tied to a non-
> standard and very recent use of the word slop, but mostly because it
> doesn't add anything actionable to the reader).

I mean I'm not expecting this to land given Linus's position :)

But if removing this sentence allowed the below in sure.

However personally I think it's very important to say 'slop' here. It's
more so to make it abundantly clear that the kernel takes the position that
we don't accept it.

Nothing else here really does make that clear in my opinion it's all far
too gently worded.

This is with an eye to press reporting also (they've already reported,
again, on the Linus's position that AI tools are just tools which I think
only helps propagate the idea that the kernel is open-for-business for AI
in general slop or otherwise).

>
> > +you are expected to understand and to be able to defend everything
> > you
> > +submit. If you are unable to do so, maintainers may choose to reject
> > your
> > +series outright.
>
> And I thing the addition would apply to any tool used to generate a
> patch set whether AI or not.

Right, yes agreed.

>
> Regards,
>
> James
>

Cheers, Lorenzo
