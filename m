Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431013502A2;
	Wed,  7 Jan 2026 18:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809557; cv=fail; b=HLam27HijobRHjM0ApfDZGvdReTndAdNFbgDSg2tkpAcKJ17qM9W8/fG6En41xSPoTJo2TnuXr+WkQNmKWeoOEgWEMM+WkUsXOF4E6Xd2nPLR0dNFY54K6svOdTfoW6ceIizBUH5ZrrBcvTRE2QeqI/L9mKBaWyjCqqc3A7P5dY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809557; c=relaxed/simple;
	bh=0jBFr9dffx248spx35t4xZf2OCB2YfcRRO+SBtSODPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iyUNx9NaDoHR3ZE22G1Ikh5sQOSBim49yMeC54ArQWqkoggaiUA5Vhw0DlVW0t68/9da9J/BeC9/7RyxX/s6HgDkNB/GqbfCJu0t5VTngp1HyhOc7LDrlb3W1M4aE+lFd/dV9msXI2ZpGjHk1WoR0d0TClCmcenp0nxelzOZYOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MskXRYt7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hu19+nwR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MskXRYt7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hu19+nwR"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607Hpn7j2557852;
	Wed, 7 Jan 2026 18:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=G8Efy8eDsGL5tLwXeR
	teE+C6WTU3s9p9tcyIMJNsJ78=; b=MskXRYt7oJsK2HgNDX5lOKR2Ma5VEzPuqy
	NcopwkUpc/eKknPpIUYyyjSA5QarkKNT7rWe6KJz7lvqWdgGplpw/7NpsTf0vAiN
	qDbZwJztjBlSIYkQ5MM2YwqINYdVU55M6gqQ0xbftxSPX34ZikqMIyM9NL+3MI1A
	JOMgjsczTFGHSowBg+D8B2wQHx2m091L/gHHLyPVC9fOET910GIw+HX9qFUZ10v2
	wcP7LjcJGF4/XSpGYZiAN+PJ2YD+mVeMbJMPcSOhbjRsiCFNJslDMvPqxShHNC16
	3219KIWOLXY2ySQ9lt1SBzWdGVo41TYddGniTsAQzy/4sZjx4bZw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bhv8mg14t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 Jan 2026 18:12:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 607Gistw027433;
	Wed, 7 Jan 2026 18:12:16 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012004.outbound.protection.outlook.com [40.107.200.4])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besj9w28m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 Jan 2026 18:12:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0CuBTmDMUGY64qJ4AEKCVLg6hFfOF3CKEzwEpd7+nJsyOrvnLcp6xwGZ/jBpqPUXbZbNuUQ//aY2fiY14Uu/hVBpj9HqAZzrrtNXMiBg+AsWBMeY6JBAXngbpe0tyz0ajPxT55gewxj5BwgTWgr+cDof0EJclEDmWGhVJKfhFWkdX3EVYweLknKolhIQUlfu3tj9AhN5buYDChgVkmrj0zEjbQQ0qZauGYcQEtg0bQnq9jkYqI+hyxhKotsERZ8ZGj9MkUYuTMFTuB3JZtubwls0PLeDUN5fo6ix49Zli8w6eBaIZt5mdEvv744TNcEaXz+nZVYPW/NFBDt0aQODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8Efy8eDsGL5tLwXeRteE+C6WTU3s9p9tcyIMJNsJ78=;
 b=ox0IAsp0R1oGUX775HKd7wvTrr3Yn6B/zAvo5lR2y2UipfFpg0OOtwEacsdRr7b/hqwpZWBGKKv5h8hEHLAvGaq9hI1R5jEkQrCa7mc0mnUOp7ThyqJIx4A3UqIku8/bSsGGWX4elBqXp6DYKXTKMrMuVBri8hLqa2HsAw34PCebPKpQrgg+4ejSTzsX42dAH7ckditAsAn3Gmdmtr2a6iIpvoE+tOXozo7iBprVZyBvJKwieS+P0ICziyFlPnunBXt9gUJ7ztKWhBNZCzGDYYSNgWQrySpWtl3TxLFlgHLHIcRSGMPsXE5oebJYdNr8wFn4rk0ymWoy+EhkZR1D3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8Efy8eDsGL5tLwXeRteE+C6WTU3s9p9tcyIMJNsJ78=;
 b=hu19+nwRUE/3n7vODnbxP5KiKTl0hqP0YjIGFXGbaq9NG8Nbk93qB4OeN1Q3o7KrAw5BjHK7CO62lLhCPE3j1AB23nVO9SBna6gvZnquXOunN/IP4eJ5VG80FSOzEukO+h54gzVX3mwz5an8hlJ2gS/o0n/BeWH8Ih+FmFIqi+w=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4458.namprd10.prod.outlook.com (2603:10b6:806:f8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 18:12:06 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 18:12:06 +0000
Date: Wed, 7 Jan 2026 18:12:09 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
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
Message-ID: <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
X-ClientProxiedBy: LNXP265CA0078.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4458:EE_
X-MS-Office365-Filtering-Correlation-Id: ff29001a-26ae-4522-3727-08de4e18441f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J8stdgkJGi9GCtHPTQwNn8IaBBG3BymDdSKLZjX9fXq1Yhxgdo3/haz+SZiA?=
 =?us-ascii?Q?5sDD8D2nJyB6193whtZVEQBoFIOAwPIRl1vhad6fRwETeih7815ap6OtXL9y?=
 =?us-ascii?Q?4DxNZoDDyWX5ozeiLjHP4k/PNaWztxKKB+brBn2tJDZiembZxu5c1d1NtQF0?=
 =?us-ascii?Q?dbBDZwzsZmSj2T9lZDYrADg8IbbAatUSQOLFHzvDgCMvFBrXV2bj6+vRONEa?=
 =?us-ascii?Q?JX7FyfMHi4WN6OWETTUg/gPh7pGK9tPU4BRCclziKoRpeBsmxst7HhwtAfeB?=
 =?us-ascii?Q?lqhLeo3aOsO5R01yIXYLtgITvCkzM3emoeoj1vwAy+Gsp5rgUiGIkskkQNg3?=
 =?us-ascii?Q?VhRVKqyvsJWPmrF/eq/6KwCSbv/vZX39sjh53PUZDHGiiIaczpgBRyIUhaoE?=
 =?us-ascii?Q?yE5vWQaUEk90LERvtzdkyCnJtrG7PKHw+61b30TymavYgcjq45bnBuFdOqmC?=
 =?us-ascii?Q?lGPWteTGnMR5odyi7IzZ4WFotzby/+1riFTi/xOP04ry4VPaIaEEjPyrnYsm?=
 =?us-ascii?Q?iuLSqxYhKZTLGhNHnnCdJ5zbbGdhv4t4bGeUALkU96kvdNJ8KizeT9VoxiW1?=
 =?us-ascii?Q?7ZVWK1J4bxtWmcC3Om0P8JOKYBXqFqqOQ5SfTrgmNBU8jozgudPE6KFzlwVf?=
 =?us-ascii?Q?d8cTPCutbPHMvtzgQCRG8regbvJBFe1ldf098rQG0VsTEY5MjYF1c1MRc/bv?=
 =?us-ascii?Q?O/qdzjMxLl0Rv9+DIf5ynXjw3h7ifTBZdGaoVCtJDcgqA4go5hzgi9K47UZu?=
 =?us-ascii?Q?8hfsjdRRjgADwt48oPGnz9YGXShVmdkyGUmT4eYDvdyLZYQfYTpjOHjl/eq9?=
 =?us-ascii?Q?6mYDkWrCi9X0LSrd+/odwEUFdZKoYf0JjvWz5bNsdMY2vhmNUEMbDE3sOodG?=
 =?us-ascii?Q?TbnlQy4Qn2sZ86q7UthHbs4jEUaFGS5Z4TcttJJsZNQll4u1W/WQxYHX2UIE?=
 =?us-ascii?Q?BSSF6nI1YK941WhhGhVssC7DShBMP4CMbcIheT/1lTi1kwUAmbEOECKzhBy7?=
 =?us-ascii?Q?1lA/cQzjD3QeSTEfuMq5OgcVY/hB11CVOfUg1fCd9AOGNFE/jJCEOhSSxPFZ?=
 =?us-ascii?Q?ng+5lXd2CnTGpQIAqwqEHuMTyvgz5ohuZO/pPFRJTzf5izoFYg/HrUJaCda0?=
 =?us-ascii?Q?s5ZMVET83LlcICULlKRvGpf75tvlEKZZbJCzLwtzZNEjOPx1dkDXL5aQRJah?=
 =?us-ascii?Q?fZog7389Plxo8uL6Qc/m4o8QqDNVigUhLQ0UqMQbQ2c2TT5mg3uLcXuoeCtf?=
 =?us-ascii?Q?8Vrc8r0nbCHO6YsMOQdqIyNoeOZ5ha3bvXZRWE8mqsi42Ej3RAKlVEm9K6vK?=
 =?us-ascii?Q?s9yb5AmG72Msx0J+teYaN+Pf6UEkIKbrn+FTFsGie5uu6Wikd20yQEUhj8MM?=
 =?us-ascii?Q?rEwklg39ss9tCX7ZJI/EVkL728y5tmYnIBeVLiKhpUcxXSz6pBCakQKPMHY7?=
 =?us-ascii?Q?47iOtp8LP+7VHAAMvfVAfb6/LO4TvbV/aeAxEnovio8QkAJyAWdL+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UN3I71ECNtPFyvUbka+sWHrItDFrnU8xA4BS2HMtP/5zaqQgpjGvPye9vYoA?=
 =?us-ascii?Q?faHHd20JEcb4PFlxqRFgmsql/ar34NP7ZZvxUM7Xsxtb69Eseq+gMB896hgZ?=
 =?us-ascii?Q?GzwBLVhu3q7smSkYcaSDhn8wNF8gZZg6NLas6XbwroJq8u4E0fF8h46SCNrA?=
 =?us-ascii?Q?1JGgiiWtU4pPJFwjfJf2l9UB8srKLRZFPzqfIVey9vNr8oiWUdXzgDLHPSxm?=
 =?us-ascii?Q?jTlc/IqCiKkZZwqGPqUWBZTMVlXJ/B7XqktlsprKmdaQ32gI2A5pvrq7ky1O?=
 =?us-ascii?Q?/cHpdkytTTUKYg2ZngI03igNBar3xnZKlM+YKAT+DBpJmWWWbYJ0iz2BAyYa?=
 =?us-ascii?Q?KAZWHiyderwX6O9X2GLL4skA9ZX2xrusjMsjblvSS2ywU38H1s0Ib1MVi5lW?=
 =?us-ascii?Q?68Y0zniA2z+wVGwovkkShUyJ8s9Hs97+ovS5xEU6rk0zMe5gyzdoZOWRDOy1?=
 =?us-ascii?Q?dqFypSf+LFpWLFiffuXh9tWC9uPMGtBEj7wJzPogsinqZyckl0s18VSGRFfW?=
 =?us-ascii?Q?Vm8DyBEAVT2TgKo98Q8zqOqd9iE4zxtjJmdsp4m7OKknxB4m2eQZsGRft4mI?=
 =?us-ascii?Q?iGO5qx5svqPGUL3/5T7HJsctjklQn8V1e5roPKrPQsd4880ANeUBGVijN82y?=
 =?us-ascii?Q?uxUDCYorSFhVM2QGwvs1DO7NKnqws9ossxJ+uy6/QhoxnPXYn+n/5BumhRni?=
 =?us-ascii?Q?2s9xDZQ3rgwDrC43Hn23aKZOumjHlGvk0CqFwv+jFgBpVII+0iNQx55QXj2I?=
 =?us-ascii?Q?FB2GZUIi7eygjxXzwJuhCZ8efMxrOEEeazE1Ss+XM1RlBhGJmYaEP07C7cUV?=
 =?us-ascii?Q?EBGJlFFNzGTD4mXenMNbsfMELtdHGyxJAyKfEd4g9/jJ8r6lkfDaFsxkdgEh?=
 =?us-ascii?Q?rM4Ok4+cYiq78YpKH+UdISeqF0ArUoXX/G9RNWayCKCM7+hGS+Nr6qYMU8jz?=
 =?us-ascii?Q?lloCG2BudTzbLqms14eqXXWMy0aT1fEfX08/QFheNIwmj0n0rjJc1DvlNCey?=
 =?us-ascii?Q?1Gxx2IfJiiXcU30iPlD3tSgUgzn99Ww9bdZGg15dqxD/m1vBSZXckdNasZ1k?=
 =?us-ascii?Q?oC1a8lZinWZMLvinbxpXvakJLXgw0v+uW80biNDSs75ENric80Wv4gAfc+CM?=
 =?us-ascii?Q?74lzknAnhH01ABfEyGTZ3LabdNS53qInmJig4NQauCxssKIQpVkI1gKf7lx/?=
 =?us-ascii?Q?c/RduBAMtPY/noF/4J8yAP43Ify7G7y2aIuTCfNg9OM1/ZGzcPbg9BrmSQWC?=
 =?us-ascii?Q?3NXvd8WcTkDpGjV0hTQtUYaGNhLfCHEN/BBZyyiuFym0quZ5fBSoc1nkDgM9?=
 =?us-ascii?Q?kS+OQ/i9O4NpvJoZn3o2zdI4LnL4w+c94Cw4dmyObvN5sKIwGwCX/hVkEpFC?=
 =?us-ascii?Q?6NBxUmV7xGeDsQYsbYTye1zQS/0o81T1Sl24jLYR2gRENsMwYZJXBGtb+c85?=
 =?us-ascii?Q?3x4cTZFGQJfq4XNaaAJHWJDwE2mcVKU11MJsVIj2lIfhWu20ZveZpc1uc9EU?=
 =?us-ascii?Q?Vh0oJ+8cxQHYE/Tk8TAy43cLH5mFooKzXHxmQo6gXD/nQgbFYI9tF/9ATWed?=
 =?us-ascii?Q?zn53ZwSIgUMcU2BQDoPXKqAyRhHvcMO9VzH+ym1W6fYkwB6QvYyxGNomNGX5?=
 =?us-ascii?Q?63Nqw43vWLdIUSafx22RlFNUd8GF9BGrsAwjsPJAd8h7qrXzY3u2PhCpo7KK?=
 =?us-ascii?Q?jLscz3OLGdQqxApaR2V6MwZR71QtujjIUuompYfOJk7O6/gplnx0+TXJxrxx?=
 =?us-ascii?Q?O3NLg3a3rFsD+IKAhbjvgvNhgmhzOTI=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DSb4VhjTREl/3PShAadM18B/UrZG8XmEMuB2vtS0f4WrQ6husDotSNIoWvLVv0Fy1JD0L3cLOBC0/k1m9XPRSzNl8t0Ath1x+z4u+ug6wubtzgn2miOdYOX5pqIt9xe3IX+aitp9NX7doHUnaR75M8Bou8NX8zbvW6GyF9QFdMQhRKxCfp4FrmU2sL2/KPgMvxrC3CZ8IZAJtivtvBVfi6Wk9Z5Cgvn0n/KVm65mdee06Rdo7QV30SB/7W6tkaV9RaWiMe19NXD28RrIpmRuMwWRdyOZCgV6EaRN/HqaEi0RPpEqvDDtlsQE8C1WJLETgqDRtrnPQ70i42gdI7l4QDBIWMLoEvJwuT5RZYopQmoGorTj7c/lMtpj60zMiJlj4Zta4MWS9HgpSLA+90MvTeqVGo1Erqd6kjSQP1WlMrJiGvr58fOInNQxI6cBEFkz3C8vhtZBVKAFUs1jfip5CDMoiABex/Kb/VKN70VtdI1Z/gi0QSQqCBzeDzWpAy6GNh7wzjcjmDkKq1cC9xow8sbfqtyyeccYwXGyVax48WPM8OOfQja8lXqWKfKS+rP+oyS/4KYmWzLx5ZzOT7J+uO+6ObF8RSmJXF5HERp01wM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff29001a-26ae-4522-3727-08de4e18441f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 18:12:06.4405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HO6U/40SZ9gCINUZ6J5Gy9bwdoj6GRPtmpdj4s2z7mNtiiYsxmawcBAmPEQDrw8mm+pIczfWoViPZ9TY38rS/9B94cphxG/EojDLltGfEmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4458
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601070143
X-Proofpoint-ORIG-GUID: sun4V30U_zi4_31R6m8CY4k8XzbcH3ae
X-Proofpoint-GUID: sun4V30U_zi4_31R6m8CY4k8XzbcH3ae
X-Authority-Analysis: v=2.4 cv=R+YO2NRX c=1 sm=1 tr=0 ts=695ea201 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=ag1SF4gXAAAA:8 a=meVymXHHAAAA:8
 a=I-1mG6jRAAAA:8 a=yPCof4ZbAAAA:8 a=07d9gI8wAAAA:8 a=0oLbbQ_HqXhJ2yckA1EA:9
 a=CjuIK1q_8ugA:10 a=Yupwre4RP9_Eg_Bd0iYG:22 a=2JgSa4NbpEOStq-L5dxp:22
 a=vAntc5lzOlbkVmf1VcWC:22 a=e2CUPOnPG4QKp8I52DXD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX87iSxfVMy5tS
 AblxfXl1dKQX27R93lHH9ZvdpL80uZOyLuAGzI9h15aOyFYgwyA/d7z9Q0yoscPakSjSIbWTUfL
 xpeEOcU8R8uwPg/wz8ARG5Ex0syJ20t2kqy21iRxj5xwMbGW6LAFefVrB1tvTRQkg7g6Ax+PDBe
 8StCzdJxQZE1GVT3dbYPfEqo8p9k36nIsenjhtPWc7qzL8Psc4uq1LTGHJdYslRHWQbXmiMR9ol
 OElDBVMP+IRWqE+DoYCcsZz+qsh2v87hMoql1qeSbzlpLRRbBHCq3Lth4LiwPmxyNUo+nN4xANc
 Dca18+SXwE3Qh3uhyZLja8esHbKmceh1PmYUgFUEhPJJj8YxX0hfWOpWL+QmAWKhxbmtTVDrZjQ
 K4265zUdIZHf4xKV3YOAwZLFTJZ+4SOebhV3oIsj36I399Nnu2rDeI65PcBV8tm8mJhsYvx3bBx
 tgmEr1AWsDTKi8Tvoeg==

On Tue, Jan 06, 2026 at 12:51:05PM -0800, Dave Hansen wrote:
> In the last few years, the capabilities of coding tools have exploded.
> As those capabilities have expanded, contributors and maintainers have
> more and more questions about how and when to apply those
> capabilities.
>
> Add new Documentation to guide contributors on how to best use kernel
> development tools, new and old.
>
> Note, though, there are fundamentally no new or unique rules in this
> new document. It clarifies expectations that the kernel community has
> had for many years. For example, researchers are already asked to
> disclose the tools they use to find issues by
> Documentation/process/researcher-guidelines.rst. This new document
> just reiterates existing best practices for development tooling.
>
> In short: Please show your work and make sure your contribution is
> easy to review.
>
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Reviewed-by: Shuah Khan <shuah@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> Reviewed-by: SeongJae Park <sj@kernel.org>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
> Cc: NeilBrown <neilb@ownmail.net>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Cc: Sasha Levin <sashal@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: workflows@vger.kernel.org
> Cc: ksummit@lists.linux.dev
>
> --
>
> There has been a ton of feedback since v2. Thanks everyone! I've
> tried to respect all of the feedback, but some of it has been
> contradictory and I haven't been able to incorporate everything.
>
> Please speak up if I missed something important here.

Well you ignored my two previous proposals AFAICT so :) [0, 1]

[0]:https://lore.kernel.org/all/c8d9f4fc-332f-4df8-9620-e0e2aa6dc0e9@lucifer.local/
[1]:https://lore.kernel.org/all/11eaf7fa-27d0-4a57-abf0-5f24c918966c@lucifer.local/

I guess I'll reiterate them below for what it's worth.

>
> Changes from v2:
>  * Mention testing (Shuah)
>  * Remove "very", rename LLM => coding assistant (Dan)
>  * More formatting sprucing up and minor typos (Miguel)
>  * Make changelog and text less flashy (Christian)
>  * Tone down critical=>helpful (Neil)
>  * Wording/formatting tweaks (Randy)
>
> Changes from v1:
>  * Rename to generated-content.rst and add to documentation index.
>    (Jon)
>  * Rework subject to align with the new filename
>  * Replace commercial names with generic ones. (Jon)
>  * Be consistent about punctuation at the end of bullets for whole
>    sentences. (Miguel)
>  * Formatting sprucing up and minor typos (Miguel)
>
> This document was a collaborative effort from all the members of
> the TAB. I just reformatted it into .rst and wrote the changelog.
> ---
>  Documentation/process/generated-content.rst | 97 +++++++++++++++++++++
>  Documentation/process/index.rst             |  1 +
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/process/generated-content.rst
>
> diff --git a/Documentation/process/generated-content.rst b/Documentation/process/generated-content.rst
> new file mode 100644
> index 000000000000..917d6e93c66d
> --- /dev/null
> +++ b/Documentation/process/generated-content.rst
> @@ -0,0 +1,97 @@
> +============================================
> +Kernel Guidelines for Tool-Generated Content
> +============================================
> +
> +Purpose
> +=======
> +
> +Kernel contributors have been using tooling to generate contributions
> +for a long time. These tools can increase the volume of contributions.
> +At the same time, reviewer and maintainer bandwidth is a scarce
> +resource. Understanding which portions of a contribution come from
> +humans versus tools is helpful to maintain those resources and keep
> +kernel development healthy.
> +
> +The goal here is to clarify community expectations around tools. This
> +lets everyone become more productive while also maintaining high
> +degrees of trust between submitters and reviewers.

I feel that LLMs are not like any other tools but in fact represent
something entirely new in that you can end-to-end send patches using this
tooling with little to no knowledge and the asymmetry between maintainer
resource and the possible slurry of submissions that might arise makes this
very significantly different.

I know Linus had the cute interpretation of it 'just being another tool'
but never before have people been able to do this.

So I think this continues to be something that should be underlined, and
for it to be put more forthrightly that if such 'slop' series are sent they
can be dismissed without further discussion.

This my the primary concern with these tools, and this document is far too
hand-wavey about it in my view + doesn't really address that at all.

> +
> +Out of Scope
> +============
> +
> +These guidelines do not apply to tools that make trivial tweaks to
> +preexisting content. Nor do they pertain to AI tooling that helps with
> +menial tasks. Some examples:
> +
> + - Spelling and grammar fix ups, like rephrasing to imperative voice
> + - Typing aids like identifier completion, common boilerplate or
> +   trivial pattern completion
> + - Purely mechanical transformations like variable renaming
> + - Reformatting, like running Lindent, ``clang-format`` or
> +   ``rust-fmt``
> +
> +Even if your tool use is out of scope, you should still always consider
> +if it would help reviewing your contribution if the reviewer knows
> +about the tool that you used.
> +
> +In Scope
> +========
> +
> +These guidelines apply when a meaningful amount of content in a kernel
> +contribution was not written by a person in the Signed-off-by chain,
> +but was instead created by a tool.
> +
> +Detection of a problem and testing the fix for it is also part of the
> +development process; if a tool was used to find a problem addressed by
> +a change, that should be noted in the changelog. This not only gives
> +credit where it is due, it also helps fellow developers find out about
> +these tools.
> +
> +Some examples:
> + - Any tool-suggested fix such as ``checkpatch.pl --fix``
> + - Coccinelle scripts
> + - A chatbot generated a new function in your patch to sort list entries.
> + - A .c file in the patch was originally generated by a coding
> +   assistant but cleaned up by hand.
> + - The changelog was generated by handing the patch to a generative AI
> +   tool and asking it to write the changelog.
> + - The changelog was translated from another language.
> +
> +If in doubt, choose transparency and assume these guidelines apply to
> +your contribution.
> +
> +Guidelines
> +==========
> +
> +First, read the Developer's Certificate of Origin:
> +Documentation/process/submitting-patches.rst. Its rules are simple
> +and have been in place for a long time. They have covered many
> +tool-generated contributions. Ensure that you understand your entire
> +submission and are prepared to respond to review comments.
> +
> +Second, when making a contribution, be transparent about the origin of
> +content in cover letters and changelogs. You can be more transparent
> +by adding information like this:
> +
> + - What tools were used?
> + - The input to the tools you used, like the Coccinelle source script.
> + - If code was largely generated from a single or short set of
> +   prompts, include those prompts. For longer sessions, include a
> +   summary of the prompts and the nature of resulting assistance.
> + - Which portions of the content were affected by that tool?
> + - How is the submission tested and what tools were used to test the
> +   fix?
> +
> +As with all contributions, individual maintainers have discretion to
> +choose how they handle the contribution. For example, they might:
> +
> + - Treat it just like any other contribution.
> + - Reject it outright.

This is really not correct, it's simply not acceptable in the community to
reject series outright without justification. Yes perhaps people do that,
but it's really not something that's accepted.

So again trying to squeezed this into the cute 'hey it's just like any
other tooling!' box doesn't work.

We should highlight that this is something _different_ from other such
series.

Again, I feel the document fails to highlight the biggest concern around
LLMs.

> + - Treat the contribution specially like reviewing with extra scrutiny,
> +   or at a lower priority than human-generated content.
> + - Suggest a better prompt instead of suggesting specific code changes.
> + - Ask for some other special steps, like asking the contributor to
> +   elaborate on how the tool or model was trained.
> + - Ask the submitter to explain in more detail about the contribution
> +   so that the maintainer can feel comfortable that the submitter fully
> +   understands how the code works.
> diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
> index aa12f2660194..e1a8a31389f5 100644
> --- a/Documentation/process/index.rst
> +++ b/Documentation/process/index.rst
> @@ -68,6 +68,7 @@ beyond).
>     stable-kernel-rules
>     management-style
>     researcher-guidelines
> +   generated-content
>
>  Dealing with bugs
>  -----------------
> --
> 2.34.1
>

Thanks, Lorenzo
