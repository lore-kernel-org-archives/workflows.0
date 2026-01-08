Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B62A48BD39;
	Thu,  8 Jan 2026 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868874; cv=fail; b=sZ5mIi+KRBJlPCWj0U0oEsQ/GRtyVMAD6ywiqyUJpBF2NQdW8Mvn5gy9M5m+/JSUSCZkKQaXNRKsUC4Ma8Y2mDi2aTy071ZclyY2KcFDbsJ1cM5XPoz6wretuVUurLAKBGvOG6vB5NHjWF4jIG52xGyik3+/dVr6wLuZm/NwwCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868874; c=relaxed/simple;
	bh=vvGtBq1TH0p/xgWPyEv1ha/vIbvwf/Lwn7yrRV+GA8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A/AqQoESaKDtcAQ0NgOWUFp/3TT72h7KJcuBbrG0YAVWCUtyfdORTaEJNVJKI+DfJi8UCsKrYDccUVhmUuRNsAvSceAgC0xp2aGmouj0pyWDPcgSeYj3lCNbk66sfB85iN6aNTp+26AKGO6bshvDhsaion03rfuzDIy6sVJqrdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lBgREV2y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KbnPKxoz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lBgREV2y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KbnPKxoz"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6089FCbl3966285;
	Thu, 8 Jan 2026 10:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=/uRumVM4gco0PnBetT
	Bcrr3tDbEViRHyc1ls3jPFacw=; b=lBgREV2ywhiKMGs7JM4s8cjGpMmUyKkkrf
	3cNbwRP9aUUPYW817rwQtTpINUAoJD+/YKC6aDsjcCV5tVXfRVUhDFXlYvnJqPHP
	6OmeM2UjDY98qD3yWbedxm3cABlqoOf9MkzPdHUiNUYaQbDCqdFXXaRDDZXG4hKG
	tNXMFcuCgv1n4QgTCXu7d30PGCRkDZ8+YiSgW34w3DW1RoVKn9rDGqGzzkOhSyvU
	kgjMqxWn/CIZzb8NYV4kXCPxAZ81ef92j37W5r2qCpHdeItR9axdeDmnMvM9u2se
	leZhcseJ0EYikup0FBKsvWdLbkFKrPjAiFjbejMYUYW5YgIM/wnQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bj9sk02xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 10:40:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608AZCf7030787;
	Thu, 8 Jan 2026 10:40:34 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012070.outbound.protection.outlook.com [40.107.200.70])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjeyp0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 10:40:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PI3PoAUZyYcm0tkPZDEYRx46ZqVS+fS634rtTAwk1Sfho0v0fRiQ93r+gppR9FMputCWNMTa/atQzyrWB3/sZeKRIpPscadExSXVMu2+BdxfLsBlzENdxDpYGJSqKJVJQ8W4fmmJd5aY2M/l85KcI9nJUMoknZayE2p5UeqjDkgJACekO/tg2tti8LalYiBBDrL1ufjaSA78mvTxtbFzGOz/28ZhYV1DXGaO+x+Kr+AYjEGbxFRfr10m7FNl1r05ws+xlFRNP97T6z171QQsmkX3+L+QQ08p/va3XvwV+1jPdB9mQckx1qXYJXAQ82BqQaU+xUb+0JuVQDGJOddqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uRumVM4gco0PnBetTBcrr3tDbEViRHyc1ls3jPFacw=;
 b=sCqkl5cEWSJrMrMz+iL4faYUR220qAnIuXuQneyzvbK15Wlg37VBb/nQDj4nrh0ixa/AByEZwkZBjfNKpxEHKdEGAw212lQ/U6JgEVKfDL8NTdxhR2/bBkB8bzOG+cm74zoOiiyXuWp24CPcR/C+Uz2YNKcvo8autG1PPmrz+CsZh0WAoREKeV3E8CCNp3taQkjedq1e08S4rY1yeLgtDdruRv27soIyNGsksEHfxKd9IIuoiyeVfEc6K+uHr24m6OwubM5A0O+ueskw2z1rfoI8iOjtANbL/hawSKcLgi1RcusRHvBR72EZgSgukcwW+Hz7+Xq1NP0TR2AB5Mr99g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uRumVM4gco0PnBetTBcrr3tDbEViRHyc1ls3jPFacw=;
 b=KbnPKxozY/k0pSYduB+YW9AAmdPmn4dALyZAA3jiZukw1Zcx8QTt2l6hJmp7r/abcgRbjrTikbMpayVsNvqqYRzoLDi/st5LzArzNjpvB0RW5wfZEK11lyDryFvO89ID3NNvpulHvakyd4lXpHyEnSaJWcRR6EsYg0Qt8n56/HM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN2PR10MB4256.namprd10.prod.outlook.com (2603:10b6:208:1db::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 8 Jan
 2026 10:40:32 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 10:40:32 +0000
Date: Thu, 8 Jan 2026 10:40:31 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dirk Hohndel <dirk@hohndel.org>
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
Message-ID: <9de93bf7-80ee-4a50-b8e5-cc8d6e25bd78@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <42192F04-2C46-4734-8CF6-DEA8739989C3@hohndel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42192F04-2C46-4734-8CF6-DEA8739989C3@hohndel.org>
X-ClientProxiedBy: LO4P123CA0640.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN2PR10MB4256:EE_
X-MS-Office365-Filtering-Correlation-Id: acd367ef-eab9-4bb2-f67c-08de4ea2591b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nttlxcWkWU2IDIrnUqp/xfnlj3u+51Xe6xJnvp55yQ1/Auj2JkhZn9KDoX+C?=
 =?us-ascii?Q?QR8iblM/x422ItZfqZtVaNK3sMBDDVMVgH5+8YbfqT4DEBLFYyAvShrB2kPn?=
 =?us-ascii?Q?oBWHtdmBZap6szqVbumQMdYhw8oLbewiak0GCSvG341HDTj60y3pLbwvI22t?=
 =?us-ascii?Q?r72HFGfXE512Xi8dWdTCBQJSHbf3tsz2eKeFnlpXmjJOp5TitCYS77zJ/vdL?=
 =?us-ascii?Q?voMux1di9P69WoiDbJHcF0BaIAaaqHoY4bKrm+oh7a/Big5elMKstX7HDUNR?=
 =?us-ascii?Q?LcAOPem/1TPTLW2qVr8aqIMxvqM7I9fCOXsOGx3y8+mlrf5XaaJznl6Y0YNa?=
 =?us-ascii?Q?ZqYmnf4P/f/+SaNNNaWKg39FHfdA+8cy6f7YEPExxBDMO5FjsbvinKN1qw3O?=
 =?us-ascii?Q?ub7r4dVboVJPgZvG5gsX4pj21H7J+d5AWKv3D+KHGNxtunSipHQRjA2SxI/m?=
 =?us-ascii?Q?ySaJ22c2Q6brYsNlxTlFTNbepCKY+/4WswzFb2faTJvU1M2rtkPbVFjYhrZ5?=
 =?us-ascii?Q?wly3NPW8oNqUGh9uDbsGCZASXJ0s+ipU+8Zav1md/AxLlS32O74zCD+aFQhy?=
 =?us-ascii?Q?9L2N5nrpr+SgYH0bB/gqRmfE0ctUHTbYaUFeyccBnfv4V/FAJ+rUEbkHwWWX?=
 =?us-ascii?Q?PENjrpYi/97L+X5zOmHX4WVkBjWKPLoUh416GvpueL3R5xg1OWxf4sWuiJ4N?=
 =?us-ascii?Q?NsqgM784tmqdOx/68+HNpl7pyDpGbxXYTgyfJgXgjbu5edxCfYYPEC9SiMNn?=
 =?us-ascii?Q?75G3lsKWwrEQh/BAf6I2+jKSwhjLlZplyK3uVV7RS6Cu+p7W5CRKOI6ABKDs?=
 =?us-ascii?Q?fgKGTpbnyimzDMFsXQevWeh4RwfvDCi5nma8JDpgseX7sT/WSOLtyMGU1Hr0?=
 =?us-ascii?Q?0RjySK0AimmQ41CK0pkC54g14chht/cJCziWrqtBKl+XGsoZgh91gFuRuo3t?=
 =?us-ascii?Q?52S/stvL+HCYmctjVVBAMWAnpJyClZdJi7sFq7p1nxgsZM2H+Q6rSJT5xRsg?=
 =?us-ascii?Q?1AYsmLoy4SikNcBKZX6ZSmKYsZRuL6Cy8fYOhNfRXAEZulnKP/yDhT6KH8tP?=
 =?us-ascii?Q?HoILNEVuiylVig0l5VLdIDwBgQqyJya3aZ0zDHnac3+hNuMfuq8VDhdNvrdG?=
 =?us-ascii?Q?/lpoEdf4nLnlSpVSqXlpKikib7hOgP9F2XZLSgMQZcFbN2ndqjTQ9biL2Ftl?=
 =?us-ascii?Q?hr5M5pBph5hJhyKImK+wppQSo4FRQgo+UIedUxTklzR5bHRj8BODzdgSWjRn?=
 =?us-ascii?Q?+P5S+JiqqBU95MlPR/Dx8265NA6BkSO04cFMaB7u46f2BI6oUI3WgHVNMjjH?=
 =?us-ascii?Q?DJVxQoa1lH5txwsC+keeS5KVic2deZgs03di8p2nkNios9CEANo6KrCcd7DT?=
 =?us-ascii?Q?i74R0eqe7HbCJIOqqu+UhgvEupoRuN+9xdAU+c+gFIDoBJ5NO7ogpoULxKM7?=
 =?us-ascii?Q?t/ZlcpCXD7D8UbQxIa8t7KRhoHo9z63o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W/eIWLN2UnLETcHT3G8BNec55Wq508xPfjwB3+nZiZgqzzIkdJxSMZJWKe0k?=
 =?us-ascii?Q?1gsbzwOu6AqFIfD2AXL22cLmF+o8NODjebHOnJLELpaXKVsOC8MkWjSCcHU9?=
 =?us-ascii?Q?f5mpKnBrTh+FNc+zF3fkkeIXmAb6clwWVUgWPjZvZvGFXHfqe5YZ6yrVydLy?=
 =?us-ascii?Q?WSrPVHIPkS5hSmgPK4TveStZnzofa5jy3EZJ0Qfkz9t9qfwqrDyy7Ab4PXEY?=
 =?us-ascii?Q?avTzyNEgoSJvktz1k1QuwTJOQ68IaJasQtZzGg4KB9OX9za+YAXp6t2rlI6e?=
 =?us-ascii?Q?2paTfhrhj3UY5MF/5MSMD5V9PN13LXBls0cb2D/D+SAtboTqYCTLytnhAZH/?=
 =?us-ascii?Q?pJWbTgBwzj/fiF5I6nzARClFHB5u61S7EaXsLBKi2MVB3T1QSP55Bks+bFNv?=
 =?us-ascii?Q?zJ+g5JyFREEztGogQScm5x+UZnUES3dY91sxZTsVKkHST6rFFSTrxnLB+nl/?=
 =?us-ascii?Q?oqgla//UTX5qDejhGNNTRVBzESZB2Sl8zocW5mJ3BMqSxYbFA/mky/EqIVqq?=
 =?us-ascii?Q?LExHsqgyEfwW3El4CWhrYXgUcdl0iB3QEpALfKW75ypPK0sakhdWBxx46Sof?=
 =?us-ascii?Q?N7EFQfV9ejNqhTGTn4rhRYPKkbwTCQxk36xDABF4tO7iLhyBDjM8xxqStb+Q?=
 =?us-ascii?Q?pMPHQytlMuR1cRVqVvWd/H8aQSDoL6J/+tzCDi8bRsUZANr1E6FVUiLQmjcM?=
 =?us-ascii?Q?l6lc0JSYFdwCgx+rdzOlUvzQK5ISWL20r7+1zf0PG7srf7Ps3SJgIXXz+UVg?=
 =?us-ascii?Q?OEIU/KI/5pHZryWVx/ZTFWiipPsSI2ojfRpE4Ntrw/MbkoUCKD6ZzJTWMmNl?=
 =?us-ascii?Q?kO54TLGfkiGG6oIYsO2v6ge3NhmB9nbEfEWr6leozz5Kb183WQbUa6vkp0il?=
 =?us-ascii?Q?smhe5hqqD2SVdfCjNEoC8Fka1Lu5NkS0KlCTR0JGmaE38SEPZ+tbrif8Ayx6?=
 =?us-ascii?Q?ArW9jkg5jNwV6I0TJDomak3IbADkLktpOO6zypLEQE+x38KOpE6kUVHKQ6tb?=
 =?us-ascii?Q?zaxfJ4JpFmbZiBkP8TsrZdZ4UD0i4mxZes6BhTlClNeu1vBfy0y/aGlTZpyt?=
 =?us-ascii?Q?8vU6Coh012mTPyA2QHta6M8VoViPclLmZKGmtekZXP5mD0+rV2oJxLEzSyzp?=
 =?us-ascii?Q?5p55CklUr1ao40FK15UZ9G1AmQ96kAdmbE3bbqQqTrmW5kIA0lPv0z+dhR1r?=
 =?us-ascii?Q?DRSvJYEhI+TPowrwRXepTMGO5ulKZBVQyP08hlZFcturg5dEErpM6v+eesEx?=
 =?us-ascii?Q?73vOKd4sZ8eDVDCeCyRYJMrzgvIL4ejTQG3Ql6kEePeo4FXmevRBYVy2vbtq?=
 =?us-ascii?Q?6/1DE/7uEdXu2k2E3ivFeXIiapliG18QSpu0h2i2wgxn/M7oo21GR2cruJbY?=
 =?us-ascii?Q?6Pg+6GatX1MFXv7OFedT4J8kPepCJPty5kAatDqu5kehjjcrpMI0YyBRsPzs?=
 =?us-ascii?Q?se6vciSBZMarmXtErou7VWhNwnWyTlQJJmjcfzQDoGhrWnxzMVaZ4WcB0R88?=
 =?us-ascii?Q?jN4fWfJOi2UL+oJ6wi/bO84zM5d4ZSGK5kRzi+PQ4GOS7WX9gptjgY7xd8tU?=
 =?us-ascii?Q?5vCYIgZzFDhTN1DVSVyoIs6ZscUG3QFhmh2v/+1TD+0JDcS/Nh3tZMCYIfLN?=
 =?us-ascii?Q?IIcCfBA7Gn3H2rcyVEQZg5Kg9yg0XoTCC6qS2AF06GdOLLu3MFIlbDOD3m63?=
 =?us-ascii?Q?3iEb0eCKi86L5huNlrn7nYRleHzPf+WTS/JNHqPR+Wt4lkLJj4WFQqT5QVSL?=
 =?us-ascii?Q?SEbjhfIxkpJ/EM19kjEYcnW4gCBGqbE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3hX/GOrGAhY5UqAdoWSd7TFyWcUcFH3/o+dF6K6RUH+FqUoQzBBZMcE5vdfHe4oWEOD/3Dj1wKHRgR7SFQe+7YXgBwpiWu6sEi2M9+Ws9YkBJTVjw+I0G0bBpyH8GCOykQWPkoeb8mQCB+RPv4LLd2sdvQnapciqInmzwMOx35W5ejz6BUsCvQqb397HauJ1Dy5DxdWG4mtce7cpTDiCwQeYHAYomL+Rqyj9Mw9KQmMqSg6qWS+0OfAK65DffO1Mt3ldMrtZYQ3PVNjBIt4HFHBfNbynSZEfbdy805YLCkwVSM9KPP7MmWZaO6jWTld5r8fnfckqbgWffPmbg1coWzUOBCGjNUr/NHa76u8d86zDMj7QDNRUwp1BcDFVFlWFTLDBADUAAlvbqHuRgJwXB/PkgPCkuqcb9dP6yu55tVasO33CKw8nkwPGeNC70GF5+XKG+3UScdpNaQ6bvHUDKgcBESiPOEt/T7iyvjBHBMYUbwjt05kH5w/l3UfEoQogw3YnxV/OEpWps5tgNVZuxDPD2HasUa3GGtqYz66eFuL1ToVXvT9Q469PAZbCio1xorT7wOPEvaeRhNiY8sli5aXR0z9953bN8BQu/ciJADY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd367ef-eab9-4bb2-f67c-08de4ea2591b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 10:40:32.0668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSehhVX75xRujNERJkyRd04oonKokXlK0zzJK3Du4Z/xHVH4y0SD3RBn+cFmmt41GmEXn8UoKswCdC4g8bnDBhDTTGnk6LtDk6UDaUlO4nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4256
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601080072
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA3MiBTYWx0ZWRfX/ad7kF7s86Yg
 Sds65pYZCg/kFqbg9Uv3gTiOq78DDRLWk6hnttqZMym30ZWBTugbeUtgdO+trgt360WoNL0LMx8
 kUyEjeVwABJtwRv/kUzDFlCWujAEwqDwFn+2TgEhMeDUbwJTD2aIPE+hE5BGKOmKHHk+wGQ9izt
 +NfvEASEzXKlr+BkOZFzFch+yGup2nv7/GXMoat8crk2dog7xOgYmWAfw6pX9KIyTYarihbPC0e
 BeU1vg5bC5jzLU22vcUvhSdh3dnD9qfAOm6n56IIEfZ3AzVtgbI31Taj5km0Gp8OpRy3TECbPiv
 mOdSiWgIYFB3O9bzURzWpNTr9VsCLLF796hhSYPZnXGiJQ1R9LSiTSJxdEYxufhiwm1bSGIBBg7
 F6rsHOlXyNqct3jPJd0fhcUOzad+A0rm/eCYBSrecleHTKfpRyz9D6zwMUl7QCsOUYrLKCOPwrV
 50nGgnrOG8JcRQJgunm/Nz5BLGsWpxmxgKiav7hQ=
X-Authority-Analysis: v=2.4 cv=K4Yv3iWI c=1 sm=1 tr=0 ts=695f89a3 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=k8J3bc47QPw4KJEVEdEA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13654
X-Proofpoint-GUID: 7Ag7h7JvjKWD9fzYGLJ0EJwA0mRT2Gxy
X-Proofpoint-ORIG-GUID: 7Ag7h7JvjKWD9fzYGLJ0EJwA0mRT2Gxy

On Wed, Jan 07, 2026 at 01:37:04PM -0800, Dirk Hohndel wrote:
>
>
> > On Jan 7, 2026, at 13:15, Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> >
> > On Wed, Jan 07, 2026 at 11:18:52AM -0800, Dave Hansen wrote:
> >> ...
> >>> I know Linus had the cute interpretation of it 'just being another tool'
> >>> but never before have people been able to do this.
> >>
> >> I respect your position here. But I'm not sure how to reconcile:
> >>
> >> 	LLMs are just another tool
> >> and
> >> 	LLMs are not just another tool
> >>
> >> :)
> >
> > Well I'm not asking you to reconcile that, I'm providing my point of view
> > which disagrees with the first position and makes a case for the
> > second. Isn't review about feedback both positive and negative?
> >
> > Obviously if this was intended to simply inform the community of the
> > committee's decision then apologies for misinterpreting it.
> >
> > I would simply argue that LLMs are not another tool on the basis of the
> > drastic negative impact its had in very many areas, for which you need only
> > take a cursory glance at the world to observe.
> >
> > Thinking LLMs are 'just another tool' is to say effectively that the kernel
> > is immune from this. Which seems to me a silly position.
>
> I think Linus' position is based on what the LLM does when it comes to writing
> code. Your position is based on the impact that LLMs have when it comes to
> 'regular' maintainers (since he ignores GitHub PRs and only takes merge requests
> sent directly to him, I don't think he ever sees just how much garbage gets sent
> to maintainers...)

Yes, absolutely.

>
> >> For now, I think the existing rules are holding. We have the luxury of
> >
> > We're noticing a lot more LLM slop than we used to. It is becoming more and
> > more of an issue.
>
> The kernel isn't alone in getting garbage PRs, but I think for the kernel the initial
> hurdle to creating a PR was bigger than for most other projects, so the sudden
> increase in slop is likely felt even more.

Absolutely. This is exactly the problem. And LLMs uniquely enable people to send
these end-to-end. This is why they are different from previous tools.

>
> > And it's not like I'm asking for much, I'm not asking you to rewrite the
> > document, or take an entirely different approach, I'm just saying that we
> > should highlight that :
> >
> > 1. LLMs _allow you to send patches end-to-end without expertise_.
> >
> > 2. As a result, even though the community (rightly) strongly disapproves of
> >   blanket dismissals of series, if we suspect AI slop [I think it's useful
> >   to actually use that term], maintains can reject it out of hand.
> >
> > Point 2 is absolutely a new thing in my view.
>
> And as much as I respect the desire to be open to new tools and to encourage
> new developers, I think this statement is very much on point and useful to
> include.
> (of course, my opinion isn't all that relevant, given how long it has been that
> I have sent kernel merge requests)

Thanks :)

Well I don't send any merge requests to Linus direct myself as a sub-maintainer
in mm ;) so if that were the criteria I'd fail on that also! :)

>
> /D
>

Cheers, Lorenzo
