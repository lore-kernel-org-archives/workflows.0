Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4049309DC5;
	Fri,  9 Jan 2026 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767957994; cv=fail; b=dCHatAlHJPei8flGX2S/nDWnUBY2KBzlD1kT9c3GqkUEAI4FEsLgYFRZTmRgZDe1wbFFBb9Wm0Xb3Jy+grLQbzjyJ3eE/VRtqXvK0+NTdP1rjCWsCSjn2b4WRhJVSjhAlmibWv7p0507UJ2fz5qVtci+Zf1YCY7v3n3aL3sjzqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767957994; c=relaxed/simple;
	bh=W77yzxTOMbip5WUnM58UNuEsIVSM2L3pS6zNzJmZMq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GvPaAvi5DzB5uAE2gPv8IZ7IFxqOQnWfYsg6+TO1RzlWtke7Fv0gvp+xhfLua49xX0oSfnMJyXSPZRwEQDWpUUW25gYHlT/boLqIe+x+J5VK3Vw1QjoRXnXh7MRuf9DwB0Wjvq9qnaCzM7l4hcWbcbMtnmgA/OEhLWPGyeUkE7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pLEKYBkN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iIp0N9dg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pLEKYBkN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iIp0N9dg"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099E3mh3226689;
	Fri, 9 Jan 2026 11:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=aiCp1f1WBrO7b/eHCZ
	TXUflWiAw92b9t2PttACupV9g=; b=pLEKYBkNHeIR1ykl194HWaFW5CMvips7jo
	S4qu75qqe6C9oIc/96Ddgrjoqb8gDvIn3e3X/DJRTR0QNFxNkp08wofa3SJWYdOW
	RdE7XfJa0WuvPt2c9vojYhLC1G+rxVaNu4Jq7U/Q2di//8abUSn0ITgzUddb5p35
	K12mohVhbZxPc6Nm8DhXLAUaH4HSXx9Gcg1mr6+sFQ4XeU66rawkHtm84+nmTEtY
	SQMeWPZ4mxtQo96LoG4y83BcOmJDHVDUgCDsfrwy6o6m6DoSn9WRhIr6nY46Ti+H
	xcgpevllenKCTxqxXZmNMARxwHNl4HhkgMIe8uAdCswQxhkWAivg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjxuv84hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 11:26:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6099ZfXs026435;
	Fri, 9 Jan 2026 11:26:03 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4besjphc30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 Jan 2026 11:26:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwCmcHYcQ4r6VfSApWUaO1JyiaE7WI3YNfPn5wLeuBPub6pL0FTHEHg1zO8hjmzvOTz3221Ubsj5gZBke3/FJOsXD0l03+ghXt99GSKqQvW76ifjRVY0tl4yqh08u1ASgTMa82J1VDrFTy9nVUIKG3q0Jpo5w+Jfu4Mg+UZWVif0RVxPkRgYALxtoYZQkMtzNQt2I5KPcnrymns5iDxsfwbBT7LvZhZdaqGcgg9MeG0PPrp4YEBqEg4xngMXJBFCkL80242KB8iZSmJhQBdeOz95b/yl8iYlQ7G4V4p1cspRUvlyEU3u8me9q52/SWjrVOxwvwkvOJOALCC/lxtGog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiCp1f1WBrO7b/eHCZTXUflWiAw92b9t2PttACupV9g=;
 b=OZPoLs3vsDKg8gAcCmwuUJ0yk4+sm3vTSi+8N5vxzq2idVaTlzvaqxtA/HuVcFslGZCyuKMIbpBn25sROyl5ZWodypjYeluQiqCqubg+SFy3pc5TnAyCsU2nB8Hmsl+nAP01n1cef9fTSWNu/pErL7W7E+/mEKjhPMgMP0+ZLEK1gDa1IIXDmcfANmKKYCB1/9ZwCpOufWXNr9GFDle6N8hsJ1INMR2VHeormQeUEpElXqdbhXEQv0cCR7GLlpNs/Lg9YcX3r1IL/qp0oZtLp1nh2+QQRi0KmMm1QdckCPdLAcYwTlukMnFtQjpYpMM+2S6oMfV5rf82xLdJe6eR8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiCp1f1WBrO7b/eHCZTXUflWiAw92b9t2PttACupV9g=;
 b=iIp0N9dg9I+6d5SKZ6WMyAwL2DJauJwxLrLYhyBTrTpp8kGShZFmLVFOH6s2V/aFvYDByT21gFw0RyEEKvTxFQh5mSnANze0zVo6Gt1SrM899ViQ1WXG62KsFzwymwi6hYGnChwG0QQc0dmrSS0P3w4wz2G4Kg3rHYSSZyP0Ovg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA3PR10MB6950.namprd10.prod.outlook.com (2603:10b6:806:31d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 11:25:58 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 11:25:58 +0000
Date: Fri, 9 Jan 2026 11:25:57 +0000
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
        ksummit@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <d6dc605e-2f33-4db2-99d9-4c3c83051ae3@lucifer.local>
References: <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
 <20260108151437.3188cd53@gandalf.local.home>
 <cfb8bb96-e798-474d-bc6f-9cf610fe720f@lucifer.local>
 <aWDf1zlLTKmw9xnq@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWDf1zlLTKmw9xnq@stanley.mountain>
X-ClientProxiedBy: LO4P123CA0537.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA3PR10MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b7f53a-21cd-404b-827d-08de4f71dcbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?noWI+7nbsehTPM7GqvSvs0SvQMEjYbWq7GNTGIEWDOCzSUWWRCXStri9UhtP?=
 =?us-ascii?Q?CcJAoxxPBpn6gRj7HTSPE/veRJmuHOHsL667i53TVkcNZlKxyVuvlxCOEyHQ?=
 =?us-ascii?Q?7+pW+BmSjMMBQSZE2/VWmFTFchfSxA5wGlD6+cfl2lrMa7cuhLZQ82suzZWK?=
 =?us-ascii?Q?nXVcvV/FF/6MxvMl70joPI+osSyqQQO+XTjmH35+Pp4n2NtmGhwxNdT5ZtoJ?=
 =?us-ascii?Q?QfVdEVh/gE6IZL6tAbFNghPoPItSlboJah7Fxsi+a5iZTHzQoDX7FLRFl2n8?=
 =?us-ascii?Q?d22+FakWIM/YfU92/4E7epucYWVb6hUxNRbiA9xxm/W6dwaBCOAT1gYy/rdt?=
 =?us-ascii?Q?CR07qqphLlSgoTn8OvM0X80i7wBqDlExNaqYbZwxT6XdZrYHdUfYlPqPUIwZ?=
 =?us-ascii?Q?PHNS3I6WrKZkdIDDA8K9LVDTTHn0Phwkepng3L3KuWI1gE6ospWyhtcQAkrO?=
 =?us-ascii?Q?6KqOA5lTX/bSjc7XmgRAYIsxzswyIQkFT5shZncH7HhwSQX0kj26jQ+U2d0G?=
 =?us-ascii?Q?QNKXhaCrPzsLrCq9KdQx62ZRJV4rMQ5LOk5Zb3u0pX/GqZsWn4ECpdNuO+Fm?=
 =?us-ascii?Q?BXQgVFh9B8JazvMFVKtuvOSVOlnkFqgvSs3Ruvg8aGQmqBSGHEPAu9FNYmc2?=
 =?us-ascii?Q?dlo0cB/oU7ichQ9/qbyG9Rp7dVOPTvuaFDdOBwSqTqW62O6YG5HCyH1wag+p?=
 =?us-ascii?Q?dJhEhjVPk9VjVvuF8UWnCzZE3ZR/WVqIfoboVu02YPou/fbdDX4rOv5GkL7Q?=
 =?us-ascii?Q?35htan71H/S1uG+hGvbEarIE6jF25ez2ij7Jyza+PjI6b6eN66n2ONVKP9uY?=
 =?us-ascii?Q?zTb1U+7NeKl1e+0t6tcxE1xOd43tiACbo+8aqLwwpXXfvSl4WaVPMBFKi/sw?=
 =?us-ascii?Q?cQE9LfD4t2yohCXGZQFoQgBA7zmfq4kT78Jzy8odCZ0fbkwFm35jKXfiUhVQ?=
 =?us-ascii?Q?Ujfug+H7z9KEz1NA2TMK1E0PWH1iY9uqeNqLqxQWaUIGP+gCZ0Gj86aBmD8t?=
 =?us-ascii?Q?TJiVm7A+ZrhFMKLcaxxBf2Ia0sMRetu73JDnmj8JsqfnRohIwtpAer2YEhWr?=
 =?us-ascii?Q?QCG3DSI7GVtXDh3rGv++4JDdSw5mr0N7uGepIzVv761ib7BN/WanSR69dFNX?=
 =?us-ascii?Q?sYfjFBGNl+FnALmt7AhnKzZyBCLLypmMWq/XZjkTc2NVyTxzllUamMWfT1Dr?=
 =?us-ascii?Q?ljIK8rqblEf13cRtX5GBNvby2XTayt9lh2SJQHkJEMVxlTp4NPozfXl+5A1w?=
 =?us-ascii?Q?uiH8EOaDQ1a+VLGPpUMX0FphJT8OiElLdoum6QK/xW857LCjihnk+iLTwKYZ?=
 =?us-ascii?Q?9cmEBEOdFZRa7w4QpCwaUrm2F5fyhaGT5wLi1VgtoFUDBI71Ug27Xjxt5s7F?=
 =?us-ascii?Q?FoV/VHR3sYDbxtoWDNiFM0MJdXtKfJhbz+I+RU4LAJQFGq3q9UUp54yawc4f?=
 =?us-ascii?Q?OaOSCK9/DKapxwbiCad0C+BIVaj55pui?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tn4Fqhhv6WEDSn93Z64k60CuPk6NbkBR98dVetSer5m57ormuCyR8FtZ7pDm?=
 =?us-ascii?Q?dsMPGmHcHnoRAHpUs2Y36mdbEnBKbORRDfJifi+NHYrcmAghx6v+suL2lNrh?=
 =?us-ascii?Q?TqXccdYx+MVHwOt0MnJCGqeTqteaDea+Hr0ope+goft+gruq1SCdE2OCgr+4?=
 =?us-ascii?Q?WCwyC8bP/CZT6I9RA9eun8EQLJZ9IlviLRZZLH7HwYuFZ6daKx0oBCvTLs1U?=
 =?us-ascii?Q?P7FBBM3mLM7fY0QXXn4FrjCZb0UYlaNkAlayKBFFsEx1q8FwaqDJtmTQhCz+?=
 =?us-ascii?Q?yXasiVLfJDvhRcGDJN0idUlZmO+HT+4DZnxEqZtWbl2luKX0OX7VD66DBBIK?=
 =?us-ascii?Q?ZOoUBWrBFHhLaJfgWffxNwV6uizJJegDI2Gk5NJGUW/FDUPsIrwZELD5nK47?=
 =?us-ascii?Q?Thec1lqMl6XuB/1JrI+8VZi6fk2+p0AScrdGGc/zZwltGlL92NvQMJwDDtMA?=
 =?us-ascii?Q?B3RvuNgd0vHyZ796BWM48hPeg5/b9iZcXYmajyvEy+gstLiJlqb21HBqUdYx?=
 =?us-ascii?Q?DCv1ONNWpDtptpkGkerIoYlGCS0dbp+g+VuM1p9SnP0EmZDcWAnxz0FN0LfY?=
 =?us-ascii?Q?0wD9u2Ttm2S1g5Ls5xtgQ/aej3BphtBCZutJDEFZr+k1hYRSWmPkB7sXcOcc?=
 =?us-ascii?Q?GJWHuK3qWTLPEPkAve2agPltXkc487bUkBJh+EsDXFn7trJzBAMPaRghAtX5?=
 =?us-ascii?Q?3liNRVwf84BkLNihX7pljgVbCZRd8qxre8ju5oWVJd6cci9h6u+mcs6HmTst?=
 =?us-ascii?Q?6oJSfSt+1ZMqPfzX55eiMvRcak1X7za7e2M1MABF2Zu8bXTw7UAH7sEkKemN?=
 =?us-ascii?Q?hXJOs5T2vIbL9ICQLi8Bfa4X1m7YYQyzcv1DEcHNi/+Z8sD3P6ZqPuyXOcqx?=
 =?us-ascii?Q?ougsOVokkxnHbj1HgIzLMTqiQd0EVeRNmIzGurjLuOCWZ8QiVxGxYIWmSTxe?=
 =?us-ascii?Q?B8ykVTmsfIF3dwAOwVG1Ykaysz5wxeStp7YbACwfsEuqTVU6bdIb9WuhdTMH?=
 =?us-ascii?Q?UBDyDbkKUgtahvq13XOgfOVxxFsHKEsJMu8Sts0xdOq/Py56YD8M2vwAnSZ4?=
 =?us-ascii?Q?m4LJ4j2ofly8DsdYHYFmvCLbQ6xOfRyam1QgSPwSCqn7jzpWXl9novBAYgaJ?=
 =?us-ascii?Q?Rm8Bzj5wABCHXA+0QIkMJIrYANIMjQtfXnJzMBIpatSTltPaQnlo9zMqHbcT?=
 =?us-ascii?Q?Qy9g4PvNLydg2UUlDTezir2d56Okk7t2YgcZn/TSXn6HiE0Fw5PE6mD9QHSk?=
 =?us-ascii?Q?2Ei1Cr+/+j+0ivTYwQ1TIu1FwdNNU+Mi5+L+1i3PohfhayNquOgJg/JSMdK6?=
 =?us-ascii?Q?axoU8gfiF7QbQtIWQEWR3euhybwqHeclh8k9hewnsJ1IR5r7Qwt4WszT8ylD?=
 =?us-ascii?Q?SuoaIzMggM0s6wy89J1uMrPk4SiaP5FdbwFdG/sDZjYFhf0v6zvPqU6NsVAb?=
 =?us-ascii?Q?49xIjgmUSe8ShZ57ZI2PbzLDMhUJya8EMMBbnVkwOC6M6+LUn5voovQNveJy?=
 =?us-ascii?Q?zgcRJwQgE6Q5sOLbE69m+StWqayytzp7G8UUly8D4bSyHC9pu4koUQ8ek/sd?=
 =?us-ascii?Q?Tfd8m3rKLIKDDwjXBQDf7UZRT2bildmVzuVtg7fFPNUEP99owkqoXuN4G2sh?=
 =?us-ascii?Q?lLrf30lbaaALqvlxzs2whTri9tiGkDVgHwFki55C3I8kCkPEAaq86c5cLKxc?=
 =?us-ascii?Q?T+wd0+86uS7GEQe+w8X+huCbz1qOmLZsZBOlczPaEJ635meLAgC0d+O6i1Lz?=
 =?us-ascii?Q?ObHZwh9OqN8nL1LAy4jI4BCkx6xfrA0=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yWx6DVmGM6e4UP+mZvPkB13MuTg4ZYeACXLc1uwP97d/Urjobc3msIvMyBZrRFYGoY859UB6MYsT51JqnSAXApZ6Owd9Pd4Dt5GnmMIDFYVhFwPivRhhvWS/V5WF5gORZOU8AhOMfZe8izSJVIoXe7d/Zi9FwULMmm3QmURCvl3AriGoVl1UdseyAx9MGCkg7LjSG6U+tJJzQ7xy2L4ClACCnGG3O8n9wFuMGSKKNKaG8+9M/7Kg8YmHdeO+k6taQ0tBWz6OxbwSNZ+fV5G7uy6jRIeO6IYqkMBEXsjbqFO5C3CgjpESYYYdZh7RGyk5wd/NPBBP+Wv9ptsV7IHtUFBF3Mfbiv67f+f9dKewu7Yk6R5CTVP9cluJT21btTP89XDKtoDkLk4p+ob01zbF/NKMkHj6ys4+HF4y9jzYwn9yITnR7VkWG3aXrHUyEor1lanAF1hMqhkxeSwogLVM/ikGOD77oLhYziQ+y9qHEzh9dbi/jQufA79CMS7xNYlcAPBp4NDPiRC2exqzJz14czyCAzX80tisAE1WZ8/aFZ4HJ+aYTrJHxEWsWrDfT8+d7+1p3/+FtqHChoCjyhf5AY0b0FoiLmFsNO5ZuSAR7h0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b7f53a-21cd-404b-827d-08de4f71dcbc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 11:25:58.7453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6kRwgaCqS19UgssmnJ4XZctZsxz+Ux0Nwbi0cB85ONajEmSWtQiwV+qoXqbfuKXSw9rCJ8xQyBInAX+zuJYng/tYzXLpLUeKi1++xb93+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6950
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601090083
X-Proofpoint-ORIG-GUID: HiKR79kUeMlzrTbvyGjgjM3MxBiotcjz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4NCBTYWx0ZWRfX4khxnT1kJPa5
 9OiaWyUXLJDjEXsfUuBaX2hX4sJNh9bvaNR5TZejHEDUOQwznPKji3El2vgMYhuW/+UcEtH6TkB
 C3S+7z+sK+pyWyzUtOJeoCZxbMQjTjx4vEv0NXWCqElv9h2g6qajjOmQydFHRLqMMd+tnPe48kR
 xjGfyCMQzDuIMsoqterlQZ/CuxLqRyWsU0rvsK5eZ17ihbtvMU/nadKN4hHcRIszxNwKx3SWEJQ
 D/Xt7tAnqQtLbEtJXMJDnYRoWMQZ+so5KlmT6LecgMSfyP1JfH+xz99XZKwv7aJODQkj2kwnZ29
 lOxf5trF98750EiZ8uEvA4IZbbfcXEf7Y3tPyvGwVt7Shzy6NBjV/adHuPgxMQTZ0rREcD8bAQI
 /HnnIZFLYSiF944BcPrlqVUzCM7laznXySoIiTemRGYdzU3AFFJrzb/WXf49hzius9ZHjn7+yx4
 CNkdKpm9JkM9I+SqDWRDFP+YIEIh7aRj22QTaIwY=
X-Authority-Analysis: v=2.4 cv=ara/yCZV c=1 sm=1 tr=0 ts=6960e5cc b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8VpDeP3kAAAA:8 a=iJyNl1xbAAAA:8 a=NtpouL_lAAAA:8 a=IatCsQmqvRKPFuDhAcEA:9
 a=CjuIK1q_8ugA:10 a=x58pXJj3Pl9T3GLWE5Uy:22 a=DuzYyTm7k8zw0eghYlGn:22 cc=ntf
 awl=host:12110
X-Proofpoint-GUID: HiKR79kUeMlzrTbvyGjgjM3MxBiotcjz

On Fri, Jan 09, 2026 at 02:00:39PM +0300, Dan Carpenter wrote:
> On Fri, Jan 09, 2026 at 07:48:35AM +0000, Lorenzo Stoakes wrote:
> > +cc Jens as reference him
> >
> > On Thu, Jan 08, 2026 at 03:14:37PM -0500, Steven Rostedt wrote:
> > > On Thu, 8 Jan 2026 11:50:29 -0800
> > > Dave Hansen <dave@sr71.net> wrote:
> > >
> > > > On 1/8/26 11:23, Lorenzo Stoakes wrote:
> > > > > I'm also not sure why we're losing the scrutiny part?
> > > > >
> > > > > Something like:
> > > > >
> > > > > +If tools permit you to generate series entirely automatically, expect
> > > > > +additional scrutiny.
> > > >
> > > > The reason I resisted integrating this is it tries to draw too specific
> > > > a line in the sand. Someone could rightfully read that and say they
> > > > don't expect additional scrutiny because the entire series was not
> > > > automatically generated.
> >
> > I mean you are making an absolutely valid point, I'd say that'd be a rather
> > silly conclusion to take, but we have to be wary of 'lawyering' the doc
> > here.
> >
> > > >
> > > > What I want to say is: the more automation your tool provides, the more
> > > > scrutiny you get. Maybe:
> > > >
> > > > 	Expect increasing amounts of maintainer scrutiny on
> > > > 	contributions that were increasingly generated by tooling.
> > >
> > > Honestly that just sounds "grumpy" to me ;-)
> > >
> > > How about something like:
> > >
> > > 	All tooling is prone to make mistakes that differ from mistakes
> > > 	generated by humans. A maintainer may push back harder on
> > > 	submissions that were entirely or partially generated by tooling
> > > 	and expect the submitter to demonstrate that even the generated
> > > 	code was verified to be accurate.
> > >
> > > -- Steve
> >
> > I don't really read that as grumpy, I understand wanting to be agreeable
> > but sometimes it's appropriate to be emphatic, which is the entire purpose
> > of this amendment.
> >
> > Taking into account Jens's input too:
> >
> > +If tools permit you to generate series automatically, expect
> > +additional scrutiny in proportion to how much of it was generated.
> > +
> > +As with the output of any tooling, the result maybe incorrect or
> > +inappropriate, so you are expected to understand and to be able to defend
> > +everything you submit. If you are unable to do so, then don't submit the
> > +resulting changes.
> > +
> > +If you do so anyway, maintainers are entitled to reject your series without
> > +detailed review.
>
> This is too subtle.  In real life if we suspect a patchset is AI Slop,
> then we're going to reject the whole thing immediately.  No one is
> going to review all fifteen patches one by one as if we're searching
> through monkey poo for edible grains of corn.

I'm trying to compromise as the general direction on this document is to be
very soft (see the suggested edits so far).

I get why, but the entire purpose of this amendment is to put emphasis and
really to stand up as a community and to say clearly this isn't something
we want.

>
> The AI slop patches I've seen were not bad actors.  Someone saw a
> TODO in the file and thought that AI could solve it.  The patch
> compiled, it was formatted correctly and the commit message sounded
> confident so they sent it.

Yes exactly this. Exactly.

I've said it elsewhere, but:

a. People who have good intentions who will take this as a green light to
   just send out fully LLM generated stuff.
b. Press coverage (it's already happening) will essentially signal it's a
   green light on this.

For e.g.:
https://www.phoronix.com/news/Torvalds-Linux-Kernel-AI-Slop
https://www.theregister.com/2026/01/08/linus_versus_llms_ai_slop_docs/?td=rt-3a


>
> To me the audience for this is maybe a team working on AI and they
> don't have any kernel developers on staff so they assume they're being
> helpful sending unreviewed patches.  The message should be that every
> patch needs to be reviewed carefully before it is sent upstream.  I've
> been asked to review patches like this in the past.  Get outside help
> if you need to, but every patch needs to be reviewed.

Yes exactly.

But also it's useful when dealing even with bad actors to point at the
community _actually taking a postiion_.

And frankly on waiting for it to 'get worse' (i.e. to get like basically
the rest of open source) - I have little faith the document really will be
updated to say anything forthright at least at any speed, and by then it'll
be too little too late.

The idea the kernel community taking a position doesn't have any impact is
simply false.

I think far too much thinking in terms of how computers are going on here,
and too little about how people are.

>
> regards,
> dan carpenter

Cheers, Lorenzo
