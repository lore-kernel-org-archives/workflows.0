Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EE3266B67;
	Fri,  9 Jan 2026 07:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767944942; cv=fail; b=YPVDcH3GBhfdOUmefOF8I4Gq1q7PfIeXcPlKP9f5J6bV/hoEU13EzuOJGNa1vPBFFWhk0ISkqOeOwO2eXX9lQ07yqJFVpEkt31GOlhOA44SvOWKDuvRHUhp54F+DdcDeMG5a/LdKg2kNJ3vpnjESq8XxgJzCWs8HrkAifBAVPQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767944942; c=relaxed/simple;
	bh=psckD0KZ/4MzbjBnxpPpdB2pL+TlfbnAqrpFNYLe2A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sT/ZWS4N08APTX6zs4+VJMhI/iEre8jIsAJH/anAUjP/TYrADCOLTPeDp19TPUG9uI7Bb1VV9jN8mXqFqcYu1qw6bsUrBqEfXQo1TcXErFb1THmqRNKJj+DnoR+BjZy7zpUxqPwQP6sy85+0h0R/IOqNDjtNDAg2FXw1G+CRqvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ciS5yLbQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lL0aPv7n; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ciS5yLbQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lL0aPv7n"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6097fSDH2517927;
	Fri, 9 Jan 2026 07:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=9WthJwASIq5aVFKuO1
	dPjcfv1Z5qObV9anW6SuNR6g0=; b=ciS5yLbQhRpL/oys1rgRO2NJ9zAMtoZ8RI
	lIZwRza64H+Tk25YmNqMWFRUsGm8Al44Mr7EcQlP8H13gtCc5thxJZNjSrHoj6rp
	RnrpDO2MsAx8FDkdWSWqRIuJYaTZhzQlJwSfLCkWrjCRZ9tYZ31vUkKJZCy0CPEQ
	hzx1+Jd084CpMXdiIF1DDV8ArO+EtYbcc0Fp1hPAn/a5PKXraJ821RLLbQXcuVwj
	Pziy27nKospYSlZGzrtc1ymjCinCyzpQPs8Ev50N8zTFGaiezF8M71wkbLdpkL89
	a+MZTiR5TL9k2EFS1kaN6G499z/VzDYr8si0f8pvUfMK1KaWLcaQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjwgrg05t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 07:48:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60960LXe030712;
	Fri, 9 Jan 2026 07:48:41 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013061.outbound.protection.outlook.com [40.93.196.61])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjg4epm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 07:48:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDgZg9RLwv7F7HWT+YBpaht+OeLGOa6q3dCNW+MDZs3ajLCEomznAazA7e9WoXGCt7sFr1HQNteGSAnt/N/qvAwDfDtB+d1W4VkofDTxwCg+9AY38uXEeikM+z2UTAoIAFa87AlA1RCaRoKs4zkSsJ739ElQOBhgOuK38pCERNKaF3G/CgwO00peAvkKQLjHGH5uNsQ4+oQdzSMppfwvfXr54nnVLeXxDk8OB6TTTXqJhFNEdHKvQn2Ztj41UXwQfIWufycRYOw7hfSmZds+9AX05LVZ1MMP/UBhxSeVhaIYA7A7FzrNQxl5D2wiLfkz37EtTD73IY+MJqLWjHUnwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WthJwASIq5aVFKuO1dPjcfv1Z5qObV9anW6SuNR6g0=;
 b=C9cHZ2uS31rc4IFsFvBpCavBn3bY3VENK0jytyDf6wABBghAVoNyu55XIM7LgdWn4ICNZ93tETyEkxeITQTQWVo8O4qFgibBXSGXT7zy4kQA/7V24Fw/ZHHgayBdCuhaxIyFwbedxDL/ssgSvbCLIbzs8vcJr/lZPX4KajKpS5GMMZ5qXkfL199hafxO7vPjmeJbTFeSvrf/Ncw9UkKIWg6JfBioREfG+e+wXJpMmTpOO8lrB+I8PXY5bLe79VD1iH4L2D7Ed3lokcu0AH8WpqyqN91vM2YY4BVBr8vFBP3dHeKqoh5M27gjaAZsPnDiuVekiIejLZ3joczenek/Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WthJwASIq5aVFKuO1dPjcfv1Z5qObV9anW6SuNR6g0=;
 b=lL0aPv7naB9rTcLr+esqVSn+uNyHiX+MxNjpERJ7Uw3Du1/NQWJX8neRuEkOU8uaFrk2ZJM9u0CfhthNJ3WyguZwXhSamq6cFxFna1TW4cLBi3DB/i+GNIYdYjUBYDbp9To6aUJ/eFTv7zq1yIW6fhkowCNj38rVxTzuSiuAjdA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 07:48:32 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 07:48:32 +0000
Date: Fri, 9 Jan 2026 07:48:35 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@intel.com>,
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
        ksummit@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <cfb8bb96-e798-474d-bc6f-9cf610fe720f@lucifer.local>
References: <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
 <20260108151437.3188cd53@gandalf.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108151437.3188cd53@gandalf.local.home>
X-ClientProxiedBy: LO2P265CA0330.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::30) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH8PR10MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8d8b2d-dfad-4305-bd34-08de4f537c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bkoZIlp5/yVrhyPaLajf12/Ub+eduXHimwIPS3H6d0qGd0qdz52ukLpX0LGm?=
 =?us-ascii?Q?HyU2g6zFVAWvaRCnyA+g0/+60KrxiX50raVXgyabH90ygKtRgtEOoNzQxoq8?=
 =?us-ascii?Q?hIuVorj9fHdwXf69SnCB6wOJNBGZvbRZ3edKjq+GoJCfJ8wCUKpmMNouYiei?=
 =?us-ascii?Q?SjWPw28UdDxRET/Gq7K48asmgOVMG7u7RRUXRWiGl3nJBkQK7cu13NqNGqPf?=
 =?us-ascii?Q?4VzwlifOTU+oAiRc9db5PFAECEl8Ml/ldCJkKd/bXltXOLjMuPlORby1szFn?=
 =?us-ascii?Q?R5Jo3i2hANi+PmSBVFYLcsrEbjVhVb4zXzdJ0iGxrECinFlxJGhW/m1JbmGE?=
 =?us-ascii?Q?3SAX1YMoGMTY5qoQj9HzHOA7Cb9jZJBHJZ7ZnTu10Fi1ZYjo5RKMYddJ5/Rk?=
 =?us-ascii?Q?7vUCY6rnTxEXUgXEIYe7atuqm7mkq5GkZyEL0YsOTbtpKqa+Tx/VuGUvFsZw?=
 =?us-ascii?Q?xL1lhTavNh26l2Gdc8lXS9UlSNNebtkgUF4HFqiYAF3aT6AT+/GJp/q5VU54?=
 =?us-ascii?Q?KhOWYhfPhAth7HJtkoSiXSb7g52og9+ubWWTGs57ocqYStieD+9I7ZT0sdhm?=
 =?us-ascii?Q?EIYcOM7s4lO9Kp2TIDP8KK6Cn54CZvxYqvQx98LYWmERPeiEceK37GpLZov0?=
 =?us-ascii?Q?YVM38Q4FchYTI2ujoIwXWg641yDAt/TUe4gry9MxTsxFj574rOjWv8i7L7/H?=
 =?us-ascii?Q?f9Q+sxswf3BELiX5ORrPRq2Gh2pGODDQ0+MwO1Mgsddn0+sjZl8J4TFsKv9f?=
 =?us-ascii?Q?n09/Jj3SumtBZQ0iokG2BrGlbejoZ5zjYMN/VNOr2vcJlkm6Ob+tNfHL/iv+?=
 =?us-ascii?Q?1BciAgO9FUt0UJG7O83wDW5NgQswIsu+GA+d6vGtOkEU2CA1P84XXfCfFjMQ?=
 =?us-ascii?Q?TsRp0xjRBBeJXzjZLCIcu6/cYN2zQZ8pqTHT7spfvXrmvJrXhqzsvZLfUwNQ?=
 =?us-ascii?Q?oCpGYS/T/gmEZ71ryZ3aRU4LvAZ8WxVOe3wHoGebCnnzMvgYPZqRcMalfhrL?=
 =?us-ascii?Q?Jjy38BsXKKShwgm7OrLjmMUUo0MIw5MoyS8Kge9jhxNeq0rZzldJLSVtz2Ta?=
 =?us-ascii?Q?Ezqbxl8W5rAkrsPhUfzxlQFt5nhQ0NKRluJ/4NTbE1b+2LP3fI6/3cLMNlm5?=
 =?us-ascii?Q?8ElYB2EEafhWeASWKs++3OOgUNS3skiYZjVQSGaVz6xR53KRf4727376Noya?=
 =?us-ascii?Q?uD0K/AH+7ZrjSmG35cHQ3SVej53cICHSBdgm2B53GLD3zr2HkGBNVzJWTZr+?=
 =?us-ascii?Q?DY+7IK8ffoF5mQRcQOyRhSoZRguQzV6Rmo74oU8YwfANWeiBy3T9oD+pxCxh?=
 =?us-ascii?Q?BuTVhOOP4QYAUZEH4DLDCeJvyC4roOqZEVNz63WpBp+igTKvCshUBeOYt0HE?=
 =?us-ascii?Q?Z1P+JQAEtyH0wTO2RskaEwNSa2PyQOgLXZqm+wSbnhglM/VNrT/eNzPT/IXs?=
 =?us-ascii?Q?+mit7rlzsERQm9AlpAmaizsbztXKQsvD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?291d/VCreLMOHhlwJA+MS0SYjbPVkY6AumTZxVydVb9H/5Jjv2QOBW256QDK?=
 =?us-ascii?Q?DSxeGyA8oH6ByORyah4/ucJIKlJ80ZGvMfwbxJ+6TbFV3gsIcsGb7CIaZQLK?=
 =?us-ascii?Q?jGP5fVwxvcx2gDXSFOB12hu0wPfSHKEbijCr3IsSxAknuldhetp6Lu0Z3RRw?=
 =?us-ascii?Q?ooq/JIDbn9T14Uc6DSbQqhsHn0gm0GMB/sNe6n/JZ8j0Jf8X0K5tPwN7GV9c?=
 =?us-ascii?Q?L+zymFQm1YJBhAghfdHzO9mH+jX/eGJy1e/qsYuRsgb5gP5CNRrXRDGNUbOY?=
 =?us-ascii?Q?iXLyWrnMdanRvRMSDmQtgny4XHla7Pii6dX64/M5qmMYuP7ob3PvubpP7a9/?=
 =?us-ascii?Q?4hxtJnb39lrV6GZBHiDugpN1QU3femaGcFzlOdYnh/mnDlrif2Dwnq5atCkX?=
 =?us-ascii?Q?wrax5q2RSunloqW/EH9otgTWaafSYWknaMWO8n1q6u2bD067zIodg3vmjNLn?=
 =?us-ascii?Q?5yu/qK8+6c4P8ZmqaXhDTg/ucmmJrbrKR/DHu5IKqprOwXCfzRnOpq3KqHNw?=
 =?us-ascii?Q?K8QM4YpK4OQgHYeHfL/pLwrv487lEMf6Sn+Z55zTPd32hWB7JLaAWBile1Mp?=
 =?us-ascii?Q?2L8A2elxtIuG0ChdkmOEuCtcRtqKSlPWjSo+z0RLJLq0MrNxJndv5b0TFWjK?=
 =?us-ascii?Q?jC4rkmcA/YkVdjiJD37fZzNx1IX9VilsNelEvQGrPRuUHj26s9pJgXEIBGEe?=
 =?us-ascii?Q?l3R14v0LxoWq2F9TKrCtrnI4P4Qv0IrysohZ/Swl0YF/GGLxx1iBGxkXCyro?=
 =?us-ascii?Q?aOR02ZKOULckMTc+K8kelG3Zwx7xcJD4/HX6nNYMgLfH6XIS+W6mkYWJhula?=
 =?us-ascii?Q?sjbgS+NsZZdG5YvJrc5otOuxYnxHdHH4CReP1eyT4dH1jlhxS1mTg8grbZp7?=
 =?us-ascii?Q?cJDEip27eDLg5OiTqZBTi6pOPxEu8WEQLdf0VMrZQez4nqx2WLhIk/Nanrkx?=
 =?us-ascii?Q?l4J+Dg9gD0oWKVcIIzMJGa64kuf24RBzvPX22qEXchcnR+nv39lzcAmcATlt?=
 =?us-ascii?Q?7KOg6mtp9xSFeCmAE6S+ekaohGrVBFeEZOeVM9EkfbDIk7vPZ2dotVzJfS0W?=
 =?us-ascii?Q?oLMmJWBgHEl4b6KVWg79i0Whe9naQaJgb03k8NlW5M8UqrFMTWboeB224mm6?=
 =?us-ascii?Q?O+lZMNK5p4vsYXdc1j/eDVVkLbjepJ5JtqTcXI0MZE55CHn9knZHO1Fv1ndg?=
 =?us-ascii?Q?bJu58TXRphgC0KxLfVqNfpoSHXOXRf7FccgbRhYqIQzw3IC5pQtQ6F47CPai?=
 =?us-ascii?Q?uJPW3GZgq3YpJiIx14X7LKs7qC0jergsG2fPNSocn+7F41Ugp5acpXcaE2P+?=
 =?us-ascii?Q?LUcIkcZy7quWjb7cXRJDqEYHB0LrQRnqEFd1PQTZjp9vsnOqfvJGkx4yZqVn?=
 =?us-ascii?Q?I/rObd6MemfelXgOOKSS0+z37rFEOiK91auN53qtH3NVbzraQC7RE65aGn5y?=
 =?us-ascii?Q?t35KXakQpk/Q2N3HNWiHouw7P5zoLnCpnfP/K2Uqr067ZFFQfPlJiyVxcLwj?=
 =?us-ascii?Q?u9oarz+7xhnbnPRZrnpxA95psytUYKLsdHmF/yBvrEUCI4GRYeiejFzOVds3?=
 =?us-ascii?Q?vhfOIQ9adFJWQO3w1bOkafeExcnVf0SmVMzyGL9TjIQzul2ONVK33BHk9T+W?=
 =?us-ascii?Q?QlJpCDXjmBTacV/4vuxuhlzIPstI97Yahs/qj+aIcoH6JFQXCDfxYfbg2TP7?=
 =?us-ascii?Q?EmZt5qOKURQtrlaz8wZQjPtNp4uwYvVU72IVNi5bIzegIFZVZk0CDCpM0Ue2?=
 =?us-ascii?Q?erWUap33lRJ51lYQ8Eqbz4ROafSPV/U=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EyOueGOgbiSG0QyNnbJ8lMUwlnUDRjxMKVz7+XwJbpuVLeOwYewWvLtxILk5Lt2E4YPjjxhTJf92P+jlPOq8w5ttACPcbZffsS4hUf0yiUkz6PzPlVullBBm8e2iH9OYWN+TBYP7Dhz3MwA5y5UDuNtWa/9D4pLQW74H+AmeGTDIiqvqlp08ThBAzPdTGdbA8cdneBd9aSzz+yY8e/mCPrJiPPU6uZFaEoxtifOkSJc5kZ2tWMmrfDPSwC29LOoPdiNmRGKp1tN/zPf7xzmuxDz9sTu5T3+jA9A1xRvGNNZKRvZR/O08WAI86CZyfGPK0lhSYhOXAZHohkJh7343h3hUy1WYpvTdf7hAzKlVuE/S94KCgXxKXjXrh+duCTxcnoqh3rRF3o0ECFromPAZKUupNBtXnfs0oxTZ23XkT4pdnNUk/ykxhfFFGi7YVKbC7bTWXFuQedypS2oMEHAnjh2WsvaqziDJA6sNnVXVi4o/lFGH0CW0pvwWLqqRVDWD+1N2xlshpKQZitHw+ACMPaj7Z3WUeqFuaGLYnEN7u4RsrdIOpQWRQ/v37G1Q0bxnlboLgAAAguuhM2PbzzNGcXNKJdtDK5XzsqGaiNjp6uQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8d8b2d-dfad-4305-bd34-08de4f537c95
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 07:48:32.5393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3lW47Q5YGVK/MR/4BViCmppKG8J3ObEwDJR5+oSW89rjIW1sYCG1rnfJAtZxV4jKXqHcGTesms0M/XxItBEdK0a5I6qDGszWnBviPv/9DQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6292
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601090054
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1MyBTYWx0ZWRfXy0vpgN7J7EP7
 n8gpka2ngCx2a0WpdQW0rV+9zpbYNKGZdLDsU2PIPw1/9JxVhWESV+W0ur4uwfgNOzDNzg/cJLF
 sM7bdPUcwxqfUGAppX4TiATL1XIDnw+TP83U4YzksPbHNtul/GtsjdaSmmv/KtsQRDFQF3xNjJo
 5pJrFnaaQwbxKQr9pyMrxzGh44PDXAANYeLetnlh2N8ElDN9gu+i1rx+h0MDGrILPq6FtPui2mU
 rms8wUeudabs4R3tU2ghF87PpH9M97/LDYVLjX27KlXD7yGm8NAX2dmnR2nfxQamS882oBhy0lv
 RriO66mFVnUPVTaFRqvGHYdwedtPzQsr8elvnQW4//cTOhtbm9jgx1I4BTHLfCIRm5BKJsDGn0H
 8qqKR2h5ikThtfUYpvqy1Q/3vrkazjdHs7gWZN5haKw6XsHaCIQMvLA3vWQ6dLhIO4mFybI+DBw
 Z5FkwK/5CJL33ZxWGm1MjKzWX3qHzig2Ry2BsFGc=
X-Proofpoint-ORIG-GUID: ubSEuj6fzKfYkBDd3mwysGNpjZmFSolB
X-Authority-Analysis: v=2.4 cv=ab5sXBot c=1 sm=1 tr=0 ts=6960b2da b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NtpouL_lAAAA:8 a=Vctz8KUWY2IOz68vNOIA:9 a=CjuIK1q_8ugA:10
 a=DuzYyTm7k8zw0eghYlGn:22 cc=ntf awl=host:13654
X-Proofpoint-GUID: ubSEuj6fzKfYkBDd3mwysGNpjZmFSolB

+cc Jens as reference him

On Thu, Jan 08, 2026 at 03:14:37PM -0500, Steven Rostedt wrote:
> On Thu, 8 Jan 2026 11:50:29 -0800
> Dave Hansen <dave@sr71.net> wrote:
>
> > On 1/8/26 11:23, Lorenzo Stoakes wrote:
> > > I'm also not sure why we're losing the scrutiny part?
> > >
> > > Something like:
> > >
> > > +If tools permit you to generate series entirely automatically, expect
> > > +additional scrutiny.
> >
> > The reason I resisted integrating this is it tries to draw too specific
> > a line in the sand. Someone could rightfully read that and say they
> > don't expect additional scrutiny because the entire series was not
> > automatically generated.

I mean you are making an absolutely valid point, I'd say that'd be a rather
silly conclusion to take, but we have to be wary of 'lawyering' the doc
here.

> >
> > What I want to say is: the more automation your tool provides, the more
> > scrutiny you get. Maybe:
> >
> > 	Expect increasing amounts of maintainer scrutiny on
> > 	contributions that were increasingly generated by tooling.
>
> Honestly that just sounds "grumpy" to me ;-)
>
> How about something like:
>
> 	All tooling is prone to make mistakes that differ from mistakes
> 	generated by humans. A maintainer may push back harder on
> 	submissions that were entirely or partially generated by tooling
> 	and expect the submitter to demonstrate that even the generated
> 	code was verified to be accurate.
>
> -- Steve

I don't really read that as grumpy, I understand wanting to be agreeable
but sometimes it's appropriate to be emphatic, which is the entire purpose
of this amendment.

Taking into account Jens's input too:

+If tools permit you to generate series automatically, expect
+additional scrutiny in proportion to how much of it was generated.
+
+As with the output of any tooling, the result maybe incorrect or
+inappropriate, so you are expected to understand and to be able to defend
+everything you submit. If you are unable to do so, then don't submit the
+resulting changes.
+
+If you do so anyway, maintainers are entitled to reject your series without
+detailed review.

Does this work?

As per Dan later in this thread I do truly wish we could have (yes in all
caps) 'NO SLOP PLEASE'. But I am compromising on that ;)

Cheers, Lorenzo
