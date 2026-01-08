Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9152F0661;
	Thu,  8 Jan 2026 17:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767894064; cv=fail; b=LBCmQEc//6Afc0bQfmR0q1BmM8hpFkPdvJlJqR0jUVbZzeytNF0RSZMNS/gIAN16WkMtDBTtDLud74qWi0M2mfIINqvJtI+857E/Wo9c3z3OZLAi+WY0IegiZK+fQltGSHgKxl3CRJY885gyybEYxQPFU28IbklG4HevIeC3DQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767894064; c=relaxed/simple;
	bh=Akwag4qNoQs878ZmSsb4IPjJ6s9GZsnCPKlIg2wSQfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hu0whGwx7GH10I2Csyt09Lq5L/lWKEySYDsp7uL3GAFmhJ14PqpAeXX31NVKES7c086HcihUvmMzlR2w8i5VRzxHKqp4bSavhjasCaMs5z9xL+ZeD22NJ2iVXtfpfx5pNAGhAonwIxfym/6B7lIGqZrRI//3CsauU979M+JqsnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d8cmQWGt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oEUzPlW8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d8cmQWGt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oEUzPlW8"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608Ft3Ti1009616;
	Thu, 8 Jan 2026 17:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=iTbOCro55A0PoFFwbr
	9YoK2PnhcIkr0IXvy1bHjdJsE=; b=d8cmQWGtw9hl3t38/ae+IP/5TkOrhvr7ST
	HQisFAOJ8t0IV0bB6L0TwsvvSLD4qfReEOsc6bsLDhANMueYH6zl6ust3NzeNYp2
	uCZx8lJydzO7G+cOPjYh1UPcGL9VfeG8DlGNZ3t0ZXxHeJqhrfQUKqdpob5prYlr
	Pg1dLzlkPBPF36AkbtsRN0nzT3Dh9wCvIHJ3pWV+OxRBhH77ZLg1MwwN/0ALHDAC
	66P8WaoF/IARvihsLBroZx84strTCQoBnLix+KB+78tzgvx3sYHPSGuCwTNYGvOa
	DIdJkacTPx7KBdpfsK8GWtraI50+L+TXoWGqw8QILWHbFbFHNRUQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjfn386f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 17:40:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608HTKku027432;
	Thu, 8 Jan 2026 17:40:43 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012023.outbound.protection.outlook.com [40.107.209.23])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besjb3knk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 17:40:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSnJzToXanJ9Ub181ECfapP5Qtz0WxvQOfYslBuko30ARE1ou2fbNPll6Zizlxu47P0d57i+ux7kQZ5dYtwLKynaBBYbU3DvC9b4qbljSxCR8xd/1hM6NepUqGIK0cckzkzXY1wlMiXHSLSFVZs48WK4pHuRYcWqct2xI/vog5l/TSBVXAmZpGF4LwXg+fSz38PaULNkCCDhm4fmavba5V1TaUES5mo8iNLV3m/WMRfQ67sZeeEl2UfMWxWLuyYWSuD1xxUFyDL4DIvMMy18w4WK/KxYWgUqurml3arRSEf7rDLaYiAcCWfohSCkOwEviuXfHcN6AWhKaZhWZ0/+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTbOCro55A0PoFFwbr9YoK2PnhcIkr0IXvy1bHjdJsE=;
 b=Q3DRVmQKkNGpqMVcJjGna5Oms0HVanaJta/yOQujT/Z6jY7dmuPk7LDfz1L85xQ0wyiONtsb8vI3oMzQOmcy0mLJVJKIeoV+FDnbEQAFCXRama4QCvDKqqS9j9ORcs+fncLzpoe7R88zI/Spk90GEKHRytEP+H0XCIamw/DOd667UiF19M/nQJDK5sKa7MtaJosu9ak9xCIphMJWDeye0Ao2KW322//q8m3AFzPELeSybPRPnUxmPxR+AMfY5hZuzcv3j1XZ25hW84URWDnJgNMMiXbrUPlmcBOQSDlH/etYUbX7DtKDp4A1RgRzkQYnnq+6GY/FuKHEUnyUirip/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTbOCro55A0PoFFwbr9YoK2PnhcIkr0IXvy1bHjdJsE=;
 b=oEUzPlW8CxdpXDn0S0yxuqfjj46h3RnsPsff9L2NmNw3r4BhC88eTnNMYzhCMGNn+H/0MoaTocNDwUMZVyw80lxxQgi8X33TzI6BQBJGpX+5QuJMVKodWmclB/JMz3NaJPg+V6+Jqxdh3SMTuxqQRrIIcsPmBdnlOAy3Epa9Eig=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB6532.namprd10.prod.outlook.com (2603:10b6:510:203::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 17:40:41 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 17:40:40 +0000
Date: Thu, 8 Jan 2026 17:40:40 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Dave Hansen <dave@sr71.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
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
Message-ID: <9a5ba780-7a93-4080-9dbd-7d83ca29c62e@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <aV_eiRqUsK2KWkww@laps>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV_eiRqUsK2KWkww@laps>
X-ClientProxiedBy: LO4P123CA0669.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: abe5cc15-00bf-44b7-5ed9-08de4edd0ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ShUbQRds61BYRnP42ak4fnt/Nnxz7cg9pOK7uV7EA0n/fRHWWbUs+sRcZeQO?=
 =?us-ascii?Q?zHJrgcsZ364KYzwxbMtNYKm5R/gkSvLCdv7yO4OED4xM3RqmoP3t3QafuCYG?=
 =?us-ascii?Q?VJZyOmxYyovPJ77PlG0VweUFmVUQlkIL/h7EPGXrC87k2UBwPG3T7rYlMySV?=
 =?us-ascii?Q?yN7VkfuRzd/4WVAYBc/lCngG17Bg1jtFbisjwBap2Bvlvt6pRktUE5i1FcQC?=
 =?us-ascii?Q?CeV6WgRsoTRlS/Sqrvj962pbD4CSl8xB9/JXAfftQNnOv/45nKgTqK9Da0Po?=
 =?us-ascii?Q?xo9id2ISgpU2KWvqjFu7X8KPLGRy0XMOXmdDYuNZvZzwP8tX9UD8f9ie9Vf5?=
 =?us-ascii?Q?0Jt/EpYjvgu/COQJctsWv2Xa+e8HwFj9QmSy10uOGCW3VIGMNMkEVKf5GJJa?=
 =?us-ascii?Q?TCyDH9XEZcRHYzJ6DOTyoVUwnxORtGUQ9RqIBn/rf6l/kNEo97o5IO9FWuCl?=
 =?us-ascii?Q?a7M4l2/5QXH/vdvP7lBK5dElgE129KQblrLVF7Rr+aIz/6N9/JmmdKfgyXwy?=
 =?us-ascii?Q?u3rwLH250FMWTLzKIzMj3pQ7zCUpIWBoCxVD1hgYFyvmzuyg0sSTfqr9XggI?=
 =?us-ascii?Q?xhcmBGb9KHG2Uk4V81fgi0j6BHZB1/io0SjAP0TCKpgXcG3fjTfW+fSTuMHD?=
 =?us-ascii?Q?dNX3PRRf1km1+09KmbmK6uLrPL13UuTEwh7EOS0qLtsq4f+J3h9ikjMyivM2?=
 =?us-ascii?Q?nvxoIPt7fls0HpcDeoOo39vmYjqH6nJb0bBX4V/cslHXEYw94B8LxmKSjNeZ?=
 =?us-ascii?Q?yZfLXGXZ5Sgo1nlPpjgXjeNh9pOYxYzqrVfsOdy8GXG4QEG4XQSW02qTkpYY?=
 =?us-ascii?Q?aTcKyWPgZc3S/i79RReHDIrUYf6d5qslmy0/f+xQy1x4X2+Q/7dhfQwG51PG?=
 =?us-ascii?Q?oOq648f6FoOqsuEcyqKgrNXvTldH3YJxeuDxW80b1od6gABlznzxB6szMkRp?=
 =?us-ascii?Q?YZ9dT4KJ03X1EdPgGvrX7U7CRDh1WuNzklsBSN7BO0qVv+xCUsCSrLnyUmWu?=
 =?us-ascii?Q?AGsn6RbXwf39r1reVU4cAoBqUYCbXCOleV23L0GwacIZTkrcdZkpQOnEGmyh?=
 =?us-ascii?Q?7cOxcBAi4wv7chwlfc96nn5Ot8PhPHINO1A9sDgNK1cits1LorI/6isyMEpb?=
 =?us-ascii?Q?wfU3rpgv94txMa2sN8i7k4zAYWV7iU1HRa82rscRG8ds+KiFDoFn1UPB/+Bh?=
 =?us-ascii?Q?QLhQoE2lfn4k4Dls52z+6bUkfKh/kUfHN+RHvDRRXHXVwpNPxIpcGeZsr87Y?=
 =?us-ascii?Q?Vvufz9psJfAfKtkGcCuiYfZCOzwDEFA2sgITDO6glz8kc8B1gYJjorGFHQAz?=
 =?us-ascii?Q?AhIqZHFKKnDVcKDuntoRMBQdQF6+ZXUwPHnSnMoJ0brcytuajrnqW++oLvLw?=
 =?us-ascii?Q?qJsPtmRYUBuPqQucGaLduGYm8hMvTI++nOlJIbWdGf+6P+goHPxFeE6Q6XXv?=
 =?us-ascii?Q?zipI9k2dv4kM6+8AFh9kkB32CXcPCPUh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ov9f6kyIkcNTF7dTwwWHIE7ErtL7E5SdwuuSrbIm1T1L8LmD+IQUGPNdFIJq?=
 =?us-ascii?Q?fZ21bd/k3t9WBpAa0kgn2fW5ENo62aw9c6S+dyOoB62dV6jHSXjdIpN8U7xy?=
 =?us-ascii?Q?cMDBa6X49CzcBVttHsj3nsh3+3GvaGiyi9fDXTD9Mgeazvl4BGZHKx9yw1iF?=
 =?us-ascii?Q?fKlb0kaew8CmX5rOsQ/P1+DtgEAFM/6trbvYVHjewK3MyLtkkWS1GJjibF+R?=
 =?us-ascii?Q?SCWwJOlbygjdL2rBN4XjL/BquKaHpXCVm4xmRyPPtu2SwM6H2IVRYkNmkDQh?=
 =?us-ascii?Q?shy2lXLAPtK2t3PZRthv8Qzk7TLAMJWoT2bNcrm2CYnxGNcEu4RFPjnm6T6Q?=
 =?us-ascii?Q?mK8jfk+g2Bcm6Wj+BzzyNIUdq1TVvv625QCLSacQL8XlAUa2dBGDgWHsiWm0?=
 =?us-ascii?Q?aocls4iKQfnuvQW3PNeXdPW9hQkICMBZwONtl5FJUR/Bwofl4u63Uu9GTwFI?=
 =?us-ascii?Q?CQrYgvDlCepntXe7t+nHHshbr5EfS5BKlxm8FPEKHHGPMmujJZySGHsPY3Iy?=
 =?us-ascii?Q?OzxhvS2S3Ov2QmBx0tOlBrYO/uQbsR3iwfGanPktPXd3dqpNlYrvDjnOnD5L?=
 =?us-ascii?Q?ZW2yFYgZdfDWog6MZsPUx1Pj0hyoxwB2Wacq/0RjKttl7HuPFIgnuY0JxHe4?=
 =?us-ascii?Q?rrrO9uEcJPHEKhxn+fW4zE2iRB9kanYv6MFw8VecwxcAIhxGuvYLJiB7kyYI?=
 =?us-ascii?Q?j7DvdJ5oAfE/Xr5uN/E5R4rfW37ZkUuYMHa/5O3xfi3T54g5p7qMDrm459vX?=
 =?us-ascii?Q?g8Wh8w8iQ0wM0RpwK6WcQOHR1oO9MIPZvc/NSXpxB+fedWw4QLEl8JSqmlaH?=
 =?us-ascii?Q?FUcxyRdpZExB71IlawQo4Ie//KpkzypD8UCTQIM1oknMNgcnDZuMiKs9AZSv?=
 =?us-ascii?Q?c1dpZPJrlZKKNne8WESuvdTBy7yVfn7Q5rymeHJHTs/sUxirZY1MHyF+UvhX?=
 =?us-ascii?Q?RXLDlUBGC5vUMa1dFxT0CZSqzpsFRInn73ZWpRqV+PhokZNOjJUQow5uN4xb?=
 =?us-ascii?Q?EnQ9Flv4fD4zWukpEfTztzgffgE9yShtn3WKI2D7EgROS+2Q1MyF0yja515s?=
 =?us-ascii?Q?xMVZ8v0PEQEWZZnpuJLjPl46cTkU1ylceKu+thVvMLkkeuAu3aXIo1ebk95a?=
 =?us-ascii?Q?B4ErglR18icuvNJ1Er6x1VXdanj6npmETQRjRG0cBJd7dzUEsflEiCUAYHCx?=
 =?us-ascii?Q?PzAhoO9ZL/UsOUvs1NLHIxRxGjP9w98KEw0nhG/BJyGvMPYjrXzG5zEGR3UO?=
 =?us-ascii?Q?ktXBBGcnDV8pWtwR9GdWGmkfq9yZkSLQlEMF3/O7fd7dHe+uKXaAXnkbeQK8?=
 =?us-ascii?Q?32ECxYI7xBwXgYJa+y1Xd2IM/sjV3ujfDDKVj1sfb0OywD0AXyimCEklzWs+?=
 =?us-ascii?Q?vJKtUcJeDlCOHx15mV+IU8aQRapyVgU2Qr0EbSt2A/yyYCzEFxRSBbv+dur6?=
 =?us-ascii?Q?jtLGsDZCauLg+5qhA7XBGCijVn4sH5lE7+EZpXddjbaK2pFpvjR2cUFnLYRS?=
 =?us-ascii?Q?M1svaL4xqEVV69D/zsyWwqo+0uOv39hqZ6wOlevQVLGH+FWhSPele2m1g+hQ?=
 =?us-ascii?Q?P5gEhuIxVSkXTmeyQLUkS8kfLrmWgYZQVvhWMQa2rB0P5D/gPO4xvDF2pChr?=
 =?us-ascii?Q?EXZi+4yj/E5kWdi+TZ1HjBoRkI9QhMhayltbmo0KE7SUOsky4r+yW3dpRbYB?=
 =?us-ascii?Q?iz4hpqQ5vO7PaP7x4mAq24F7h60NEHOrXzdMr0Ap8tAVRIKIRy0Arzw+aR04?=
 =?us-ascii?Q?T278VU72Nqh2GnmPu6Fz0E5x3J13r0g=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W9s0Aqdl/rjWRGIR96O1kK5aNI24fS9rlzUmzMhG7vpCYPRjkZYRcp3eECOIoD+MdXI0AruWS4Ehe9xv0lkFgyGCklqv2pJ/PsIv+EG7Fjl8zzP1RSkBBIJTHrEN/b9eTM9dqKCoH9uvl5GnB5pUdIWeS/OQnPOrzBn+89KxCwLKyzMLN/WMiegqemohbcRdh9rDjhyWesiCz6D5gOqPsg4uzRW3QStnqrW6nE8N0j18ysY9NN8u+CltGTgpH3Z5k7HWn1DiGDWEc2oCfqFUtQ1/eaxW3Iq/ooMD8ta4aGSUbtFGpxIYMndDLnEWijAxecZihCMtOSzrHRfd1+06DSgA8OOUJiiG0atYrQcONX/u226g5vz8g9jrzjSFlk6tShqGKf6vstiYNt6uiAJZSAZyBmf6filY0eA4pcnKXSi606RU0iEd1xk/qIE+S0qQnQIkHxcTMTeoGXo0xwIIh5Nnw1T2l31QAwaNMzsd30OWP7TuTIQV43ow/1kk7OI9HsS/wlFPAa7u8yjwqQXlJSC0e/Qt439qzgO97AvjE60hPACaMEYbcoPOg02Q329CUZYPh4SXlpclJyqkzZs6bcylh9OldCEaD4WEaqf737E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe5cc15-00bf-44b7-5ed9-08de4edd0ab7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:40:40.8980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5Xe+CMmgYt0CayxY5Q4wEqb8s4XwRr4jyw9tRlEXdhbxtJt9TF+f3O/q12bcTXLYmDJlPi05bOaPd7Vn34gBOmxudCELFTVg+zG/ciBISI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6532
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 spamscore=0 mlxlogscore=962 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601080130
X-Proofpoint-GUID: WUZYURbcJ9500sLD3nWaKmZKzyBOmlH5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEzMSBTYWx0ZWRfXxcobymt2/v5B
 P5m4rRfmZRs1Xk5lG3Cpar59/LI6r0n9aiQ36tli6hO9c/ObzYIg+OkP0jRq1neSnOwrKxloD2g
 cwWjJmbEvFp3yUKrUWDFgBWQ+YkwcMYxqomxw0GuvuVUQbnItEDPszMKSdkbHe9idsfPdnGO2GD
 2Uqi6jsH5vHQgyhh7gnRwTHS3VQKZUmDYr5lNPR2ergfqqcQNtXKZY5xO8edHXf5t74J6ZkQRKh
 iuosnrBOxxKqz/Nhuz5Ctl9AXDROypBYLk3Aaa8w6ryd5cbEYhy9iEIEsz70U+tpJA/P5j/uFn3
 3Y84LpSRXo9ROJlq7lEAW7rTOOjBdzBCNe5Z0yJjjuNgzqioQSRrt3m6t9tcehHwX9kNnN/BVlH
 8kliHYGgTDfHTXFf4UrDMSNhdjrtcRntvzj/uFCF4bTQYQ6JXObVVywOQ5OXALp1lwQpVR9TJNK
 97VKTK5BVAVoczrHxqQ==
X-Authority-Analysis: v=2.4 cv=LsyfC3dc c=1 sm=1 tr=0 ts=695fec1c cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=U6jdkRcCr6xhbE64lpwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: WUZYURbcJ9500sLD3nWaKmZKzyBOmlH5

On Thu, Jan 08, 2026 at 11:42:49AM -0500, Sasha Levin wrote:
> On Thu, Jan 08, 2026 at 11:56:19AM +0000, Lorenzo Stoakes wrote:
> > diff --git a/Documentation/process/generated-content.rst b/Documentation/process/generated-content.rst
> > index 917d6e93c66d..1423ed9d971d 100644
> > --- a/Documentation/process/generated-content.rst
> > +++ b/Documentation/process/generated-content.rst
> > @@ -95,3 +95,11 @@ choose how they handle the contribution. For example, they might:
> >  - Ask the submitter to explain in more detail about the contribution
> >    so that the maintainer can feel comfortable that the submitter fully
> >    understands how the code works.
> > +
> > +If tools permit you to generate series entirely automatically, expect
> > +additional scrutiny.
> > +
> > +As with the output of any tooling, maintainers will not tolerate 'slop' -
>
> Could you define what "slop" in the context of a kernel patch means? Clearly
> it's not just innocent error, but it's not clear to me what line needs to be
> crossed for a mistake to turn into "slop".

I accepted James's suggested alternative in this thread.

>
> > +you are expected to understand and to be able to defend everything you
> > +submit. If you are unable to do so, maintainers may choose to reject your
> > +series outright.
>
> We already have something like this in Documentation/process/howto.rst:
>
>   "Before making any actual modifications to the Linux kernel code, it is
>    imperative to understand how the code in question works."
>
> I suppose that we can restate the same here, but whats the purpose? to put it
> in front of whatever media outlets might be looking?

I feel I've already addressed this in the thread.

>
> --
> Thanks,
> Sasha

Thanks, Lorenzo
