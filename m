Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D832D7392;
	Thu,  8 Jan 2026 16:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767890152; cv=fail; b=Kvlrk8JlSaOnZC5hMmq206ldl3CeMtjuQteF823WUk7fHB31BGQ4fcrFNHsD8BmdP/fs1jJEizNvuNWlxmY+PeeD40YJ/4lK/sQvEgEKitnO/V/dKPB6yWLt9VFEHrK0qmAgXV9Y27hMRm0IS4AGoBbLMuPAremOIQyhzPaWP3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767890152; c=relaxed/simple;
	bh=o6rW+0KTeHXZXYKQH18Ra8KQsOEcxJU1y+LiCRiWgCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=B6ySowd60oWfKdKJSgXWEwZ6tJmvZi70nrgOl+93vtR5RdpAP14AWnb9tnKlRvP5SjnHJpQl7d2cYmf0rx8jRreDi0lGCLe8snTqPd12LF2LM7QibiNo5HybyTNRIanpdrHvQZ6eHi+yZRjM4emflCq9NUvAfEL5cI58nNqyWJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Njsn3E+o; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Fe0FldDm reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Njsn3E+o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fe0FldDm"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608FswAY1009086;
	Thu, 8 Jan 2026 16:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=mnwSAzpXqtOCLC67K3bantT/NSGhFpbHNOYOVvUOpPE=; b=
	Njsn3E+or1X8ZOflPBtqxEqGPNdicSyzjQvGS+ZkFKypKUQ3VMgpR71GL1/gS/nS
	8AnH8FWtxi69GVa/AR8qvMg7fLtU7GYK+sGnT7AMYgkqyaIQ/I2AI2KkDSyKcxTH
	J5SzLbI5ot1F9Kg4TVtTlC/ve3esfnrHwT6gqgG1z6fQgY50hYjKXLalXZkXvFQY
	KjOAJbMIrzQdV+qY9cZsUj3nV2VWycU71pQGRRyHDlHzTX+W3wCvxAmOcmxCmgMf
	m7IZzMuf+2P7kS2FBEQQY7+zIykKeMbfGPnPEXnFVw4qmfIhwou99ZeXo+0ph7QD
	KCtqfkaxJ7ldIGqVrCvemg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjfn382cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 16:35:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608F3DQc015458;
	Thu, 8 Jan 2026 16:35:32 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012021.outbound.protection.outlook.com [40.107.200.21])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besjb1mj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 16:35:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqP7rr+5pRZYtmojzD+5F8ntPm0n5Jd6xV7/VG3coCqkGE8FIsWODdDKRB1zlCb+o6ROyNVio4CtTZP7GqGr3a02O5fmj6/Qx6+rtZ82nkauut50Xj+gyzcvmkYtfVFkqnKucDO0QiRn87P82ICs9VCzt/NB/so/K/jymc18gxO5TK/KSpkJ2+qs7S4UnBVWUBbkSmjgzrAiXFVro2Ea2zadRTBLcRKG8+5leR7Yfm4NcrPwT0Jlsg2X+9UksDf1JQ4h/+3pvlx9BfppAXP40I0U/h0KvIH+uoXtMNFr8HFOhKNPhF13XhkvO0rIdFYWy8SHEAINcyo3FvOGF0nQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqcvbaLp+BNSDpwiA/weWMZmfchLZ9Ko8L/1UmEL3rk=;
 b=H9jckYdKI3a0N9tnADQKkFUzS4L3e5BxRhwoSpYDnvNIfZfb9BZJUhCV/KJJv1OeUpJCCKuhmh3+cTMA8CUx80f+5cwnScqdIQeW+otKk96HcdgfwEPjkjSmG/+9TJrJWpOgak+Obd9EX3RVzCqdbuP5fpAbeO2n5cA6OoKOCGQIjCPJmvepaO/vvy4o+n9mk4AUuP7MlmrO3BiI/lFI0+mhmIpzV077qaErE/s1Q/TgNtBsW6Oh13sguGF2ts28TqNfeYbHATdFpPxzvOR5XOb6I+4dV8R2nPvu4xvwrwISVV0HihdyO5C6ZNe+4md+TVVp/UvwuY19tkeBxFndzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqcvbaLp+BNSDpwiA/weWMZmfchLZ9Ko8L/1UmEL3rk=;
 b=Fe0FldDmHg4cuzGRP8MILUHkq4ES9szHOoq5xGMJkDJgpTwOBodimznTR2AkdntuYCQ+Vqrg7u0t8ZepzlSVUrz7sAPAchFv+vRREMnjVsVZ8Pn+HEAn+dzdJcc1cOCB3saxfD/ZEi2CTbcVJxY8+5UsMC9yiLVcFHI4SFtAlCw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW4PR10MB5838.namprd10.prod.outlook.com (2603:10b6:303:18e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 16:35:27 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 16:35:27 +0000
Date: Thu, 8 Jan 2026 16:35:30 +0000
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
Message-ID: <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
X-ClientProxiedBy: LO4P123CA0641.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW4PR10MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f5c0f13-27e5-4a57-35ff-08de4ed3ede5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?4DgGbfnteC39DClly/UkH7n121ievZag0MWe+u2yCokKZzpAYadEvApp4Q?=
 =?iso-8859-1?Q?56w77cAXZ9rxS1U7W/d7rQ9gkEN6eDK0t5Y/7u24HnT1IgfFDZoUSG1R0O?=
 =?iso-8859-1?Q?AoFjuX4IO3ie2YAsx3BjluWtv8iyJ3Nb5pWLABqLaOEb3FarOZMZSwInAH?=
 =?iso-8859-1?Q?chBn1KFq8toHf1yFxWcV4xtHpCOkh42aS1VDK4HdeXd2cckdqomEbKGTTP?=
 =?iso-8859-1?Q?zwCOuE2aBfSvTK6ByBunBOOj3PQS5rl4tlnFkVB5/oLsaf6PloCZAWUoRN?=
 =?iso-8859-1?Q?Fg6KcI0w6sW6m2oqS/F2TNlehmZWNLPfRmVOfvasO6zqFRbkadoKC85PdC?=
 =?iso-8859-1?Q?QPvJKYoikYgdyxOCj/LSwJNTOyNNS/GgWdX6mPR1WNp5PSIIKz5y+plY/Q?=
 =?iso-8859-1?Q?9waSN3MLko+S2Bl4dpvCIwY+cgjQJob9DrRmJkhgUQDFSqXUOzDe24mhri?=
 =?iso-8859-1?Q?S+dZhYt9KmoO4MSD3n7NIl/zuzHZvq0ICf2xBpCqUl92F9nAPGb5A6FZqX?=
 =?iso-8859-1?Q?Tn7cmQmCqnnsUzw1AsDzTeP8KHDPOrhsPv2xyFafDN1t+uILccLYwLb3xg?=
 =?iso-8859-1?Q?hlvSb1kF/pGQ5cIgwGHnTL1E+dCAGo+rJw4Tgsb7dJ9Fw7vMcR1FCix7eN?=
 =?iso-8859-1?Q?N8aa6OlwxeIGDyY7uoksVpbVJ7uZ0jiYyK2BqTj0+JKDe6jWEucbNO/dTl?=
 =?iso-8859-1?Q?ex6r6Ua8XRRc0KxGuP0YzMkhZoD/yM7j2L1foFLSW8tDqV49OuypImb5NC?=
 =?iso-8859-1?Q?hwKqeazv45tXPtmBaHP20023c0corY9IGTULS8XGuVu9borgxz2wStio+/?=
 =?iso-8859-1?Q?pdmJ1/vysZFnVF1vM30fNgY2vowf70yGoDv2lUrt2oxlu0PSaxgLX0osv7?=
 =?iso-8859-1?Q?aVtUQUcKhPYykClJBYkfKqXeuzu3egGFlUja+QLiY5vVov67qQkLp3iq9x?=
 =?iso-8859-1?Q?qJ6M6/MWiAB7Etl4sPtB0x9krcCqXsDJGRlEyB0LcVPZhV9dxHIBDsY7nF?=
 =?iso-8859-1?Q?cx6P+P+IHhJdPiyhNTGwwT3F3ubZwH2ixnEOkvZToeuZdfPiyTMMKv36/l?=
 =?iso-8859-1?Q?FEjhQjForM660uHF6QY+k8m7YjdQpISYWU4z4Cd3GpXwAI9MmTwM740sKx?=
 =?iso-8859-1?Q?zUFL/NZBmERVBc7ksiW93RcFmn2KcP3L10q7WQV13b3koZT/vRaM/2KFcK?=
 =?iso-8859-1?Q?GiXGma7yT2K5m+ar/RdszB+9h4LSnu4mmwvSkuP6fVcEBSBRFf30czFosQ?=
 =?iso-8859-1?Q?j9cUNQBNitNs2rBB6suoV/fRbXgw9KfbPJjsw4DFZD2iP9rqIJwkN3Eq7c?=
 =?iso-8859-1?Q?GAXPqRhsVPzUW2pnpmyF4Ws1zgNbfvxRmF4DRYOb+11ZgfiRemArPxkGgP?=
 =?iso-8859-1?Q?c7nD17ySqu2DuWD1R81ydNd+wTlH4VJQTfMV+uPNItrKUP/8EuXSOoTkJ4?=
 =?iso-8859-1?Q?K7nBJnkHPMUch3cMVjJvaW5MDzmBnXxOMlKKb39ISbB/nT5n6UcWi2ljYZ?=
 =?iso-8859-1?Q?JskHLJ9U/uZa4kxwkuEOr9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?BVCT86WbrOfIFUCMTODE1TqOiLG5xz4VQ+kS1AoukRYanoZeP7o5zC7wP4?=
 =?iso-8859-1?Q?Yq891WGiVNnzrOYis2eN5/3D2yk2RN9TI/SzyDUDxxvv8t7/IaW+bp/mbb?=
 =?iso-8859-1?Q?hA05GGBum6KEVvBZ0o1qnbNFITVL2Ks4sQLRsBxNBuHvMJOePnIb1mzQFI?=
 =?iso-8859-1?Q?wDXZXmqil2CUxfozRWn5rng7NmFUqAgdqhdYSWdhcUOdrJxUVHLuav2brq?=
 =?iso-8859-1?Q?m110OWXWFH1JWNP22VY9NpVBLosBIhxbUpMaPYu2911GMAuQykUJsBxHDe?=
 =?iso-8859-1?Q?DMzMMuPL6SOqjQU4vjga9cPT+1d39fI5/tdYl9hVP1s/LN4QtJfJBG9u+m?=
 =?iso-8859-1?Q?3uOq+jQKiDRiv85JDRVhzn0ymAOXFym0Rb0PyQxTbxgWGApkp3LH1eLuRg?=
 =?iso-8859-1?Q?BxzLMmBYLwGxIH2+vyW9qs+fDZIiEjahvYXKwkKkdOiGCU7K03tWRjUP06?=
 =?iso-8859-1?Q?yhhs5gzai9rhOgyWnHWlcVTVw8g/L3JBGoRSVbpMgEQdjseHrjuRzMEXFK?=
 =?iso-8859-1?Q?oRhKwZEmCV2HJoGlHWCZyFQ3w9OIW/ryHidL0B5PLJCrNdL1NM549/rgEp?=
 =?iso-8859-1?Q?EOunSkVQPPT2crF4WrjgmNr2hW2bXSvlF0mb9684noR7uY/CoPNFYblz23?=
 =?iso-8859-1?Q?VXVnGEusZMVWTGMdvQ3CmSFeUmTJcMSU9qtbjFDteFqPc+Jh2SZS4/nrD1?=
 =?iso-8859-1?Q?xaewSDqS5kTcvcvhc58buLlXeMYSCaLvg0nM6aaLoE0UcQ81daCxUxZH3K?=
 =?iso-8859-1?Q?Y1eX16bv6yiJG7bWXAVU0q+KZgyKjjt/9C8acOjfVRpbI29aFPxsGk4QJh?=
 =?iso-8859-1?Q?PBH7QMV3CeGHjhSUcfVajRStvF3tvXaxC0vfk9ErBWepYzp8x6MoMA2S3O?=
 =?iso-8859-1?Q?OvjgNudPgzFHAtN+sNi3oV6rKB6tjWMFjUkTVQAOSKOVTndP+P2oZpqh/l?=
 =?iso-8859-1?Q?iBCr3kVL22GwBGgmn7M27SUU6lVxDOcjyKWUFL8192oObaSYUnQY0t7Pcr?=
 =?iso-8859-1?Q?e9ZuSR/gW5XtF21bZ4gRfpdrI8BS0ttdbuBtZA8M897fY65qn+cknRM32l?=
 =?iso-8859-1?Q?Afk8nXtdVdg3j1Flj/1XDawZZ4xmtGZfGX6YRBtp8sAUavnpez/63Cm7yS?=
 =?iso-8859-1?Q?d2PrKfhAI9swx9sXTwUwUC1wFiPEL1GWFuJtuQMRdw1LqjdoeZDdQo9nln?=
 =?iso-8859-1?Q?QebDHDoSVS6iQTBqcf9qlyexlnaZ2Q1wAPMW8c6+jK5lrD5S+TPkenyojX?=
 =?iso-8859-1?Q?ualc18gwh3fG5vPNnmFEqgIYxSXrZjEya3rnnDhsYc24CnMaN1vhzBotl8?=
 =?iso-8859-1?Q?R6F0H03MVa8HaE6VUiyozbtN7dq0RUwP95vrqt6TUBQOH/hugTDWuAyWsj?=
 =?iso-8859-1?Q?sU946+iLdkmqfqh7TMmzVQ20MaNEF8jIpBB4MWQpdXUJjlwZoy6AtBOHfy?=
 =?iso-8859-1?Q?OmXm+uVK9RObZ/6ugpZqKfVOuoSQWdqHdKOYz/M2p5bUMnge+baZARak8Q?=
 =?iso-8859-1?Q?fZnZctrR0s1LwQQBnTs2XLo6wK5kH5Scwpqt3yLxSTOOHozfDQsehWA9Sr?=
 =?iso-8859-1?Q?xxPpg3ZE341DeWENSWMYEm6xSjbUu7s8jb9Ulyn7K8olGKix8duHhl0wQt?=
 =?iso-8859-1?Q?RodCbJq69Ir99Xd8yE3/izzrN9ZimR2aDJ+uEjeSr18lobIBYJhXeTMhPn?=
 =?iso-8859-1?Q?XJgIKGyuqvy0Q/alHa13cULpo+Rqz3RaIS4DaQHk4rfRKGOFjQBh8O0Bbo?=
 =?iso-8859-1?Q?9Yh2sYNZhl23VYgexpreJaHjyPNT4AGFOSGRh98IGGxTN91K+K8KTt8/01?=
 =?iso-8859-1?Q?C8ICk9FQJItlTmaiNceLUgVvM+wT85Y=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Lhas8DpInsjzAmMlEQkY96syHo1uWmZlqM/b5voOcsKWyTIllPRaw3mXVlM9yDR+IZGvG9ckPLidTVAS8sSQkZl/aT9ht4opuEjFQnnXz6uQIaXPgw/WbChR8RQlQH0mubgOJY+Qg6tcDMkxbO+UF8L29c0ckGLdtDZSmpkOMA8gkfyEGyYxbHRWtmP5xg0z/Cw1fPs7+XUGtUe3M7n6zpj/UTOm27M/mUEUT2CrvH8abF7IDSsVNnOEDLpKWAgrsJLwj2TMNwDFTYf+ElHeRUZ/kKQOFpFOIaAmNR+eDltDa6YOYkzOaEOxwqtJOQIPEgNpagYARZuz44OykK+ZmCcPRIw+qGh/MEtPxiugkEovShmlQ3vmquT6/32FUXS0WtHRAPF3rCzBdSd1V2fA9kph68mlF50n8/01wjSg2cKHyouyejJZevsmiM9KV4kEawJaNixCTatALu3nIUJSYOAEPGPtiLiNPvuSAss9XyqBr4SGMv8ljIWWS1NzZOITCwEcQST8KFTo8p2RSGLfQAES+Z/hfPdgcmX49jiX3iNlADrlUeNwYwy0AevDAMjgvWHlJQqokhmRUxHDbZHEpe8cu8Avvja8Zutagmi8Ems=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5c0f13-27e5-4a57-35ff-08de4ed3ede5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 16:35:27.0564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0NG57BCNk2MhiHBktz+U3o7u2nRdZniSH8KSuKUO1Q2NF+dnrOA7F991m+cA224O4UbkrG0CGd8BMGDnD8uTjYCdprWLNgUDvcSZjqcMZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5838
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601080121
X-Proofpoint-GUID: odRj8VSVFfD4ju5ghHykQymk02dNh3xF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEyMiBTYWx0ZWRfX18upMLktoq69
 zJi1/qCAgbOgi25St5aHzkCDdi8j4x5aAPjbDe05h47iL41dfNB4iGYgxEmBKostu/MDmiICiO2
 H96gF9iR+fsVBh2lI/B/OGn9nVjpbwX3SQeZo0ENdNcP0Lt0iZDOhM49P4Q78LDOkbRtD6UPjRp
 pWDte3b1A88Ts+/HXS+47UKld1Gi/PVOJ5n0iQYo79udxOpXuV/+LcoPbXKWt5nmjHeE5f0odx2
 +mrMLnUHUdVU3EGjkHNLulFKboEPAJigI4sIoosFl03dgBrAymWKDU4xA00DUBlVu6BX748ng33
 7WGwn9x62zCDRQbJLkBDgkoDpRaBgIQliYIiqOe0LoBcPBZZVQf5S/eCJdtogG8EjbyTHvLrENf
 kjNCGY7/mo+mUt9/Jv+UqMKnLMT8DtuySnUE2X9IsENqISxBnmOhopTM0ztXXgLEyDBs1LMysqO
 G2Vka3lDumEEkqomwdg==
X-Authority-Analysis: v=2.4 cv=LsyfC3dc c=1 sm=1 tr=0 ts=695fdcd5 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EYWqLu3Reek0XFd_3cYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: odRj8VSVFfD4ju5ghHykQymk02dNh3xF

On Thu, Jan 08, 2026 at 10:58:08AM -0500, James Bottomley wrote:
> On Thu, 2026-01-08 at 13:56 +0000, Lorenzo Stoakes wrote:
> > On Thu, Jan 08, 2026 at 08:17:09AM -0500, James Bottomley wrote:
> > > On Thu, 2026-01-08 at 11:56 +0000, Lorenzo Stoakes wrote:
> [...]
> > > > +
> > > > +As with the output of any tooling,
> > >
> > >
> > > >  maintainers will not tolerate 'slop' -
> > >
> > > Just delete this phrase (partly because it's very tied to a non-
> > > standard and very recent use of the word slop, but mostly because
> > > it doesn't add anything actionable to the reader).
> >
> > I mean I'm not expecting this to land given Linus's position :)
> >
> > But if removing this sentence allowed the below in sure.
> >
> > However personally I think it's very important to say 'slop' here.
> > It's more so to make it abundantly clear that the kernel takes the
> > position that we don't accept it.
>
> Perhaps I can help clarify.  You're using the word "slop" to mean
> output of tools that is actually wrong ... which can happen to any
> tool, not just AI.  And you want any statement to include that
> explicitly.
>
> I'm saying anything you can't explain won't be accepted, which, I
> think, necessarily includes any output the tool gets wrong.  But I
> don't object to saying this in a more generic form, so how about this
> as the compromise
>
> ---
> +As with the output of any tooling,
>
> The result can be incorrect or inappropriate so

LGTM! :)

>
> +you are expected to understand and to be able to defend everything you
> +submit. If you are unable to do so, maintainers may choose to reject
> your
> +series outright.
> ---
>
> Regards,
>
> James
>

Cheers, Lorenzo
