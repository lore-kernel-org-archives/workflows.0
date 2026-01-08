Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313F440F8DA;
	Thu,  8 Jan 2026 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882929; cv=fail; b=TCmqRUa8wxcvIjOCTXLeOZPis/4hLj6mCSIZ5+UryUZVL8EcVU20rsJFXiAPJRnoIV8vy4yoW72n1ke7TGCqkzehxcG1O5z8jO6iJU65ZicGXng4l18YUjxfrQGCvAcHxBkovdn4dX79TfGAJkOd/HVvzRW5YQWx0I2PfnGZFzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882929; c=relaxed/simple;
	bh=5r2/WlBuI6zEJNEe+h2BhYulLoAV90ha6x8CW0qCZzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RfAautb8SxT5JDOG9MpFS8qZkVXx7LMc3DhWkeE5nDhZVOWUx5L1YzLtugCjzSc6gXVm1wcdM4QdHVKQhbgHyA2JujbDaSBCh3ahF8umqe4D9oaK0B47gURGM4rlmm1FvVnvJUS+s13WdEp0cRcrPQhSRJxAfEGozH7juiP+Tas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h7FvgnCs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Cc4v1VQY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h7FvgnCs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Cc4v1VQY"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608E56iX822508;
	Thu, 8 Jan 2026 14:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=5r2/WlBuI6zEJNEe+h
	2BhYulLoAV90ha6x8CW0qCZzc=; b=h7FvgnCsuKe0sedpFG2G7LiDybGURyLLZ0
	17bX3sxDGO+ZptGFIUgEXU1xmYs/hbhLe2ibD1aXdODyh7ZtxhcaYlDBH3FU3wID
	5ADFoT0TDeh1aLQ2x+/OXC19HUXKDVPmou/18BScyE4Mf8fq/mA4NUw2ld+7Du8b
	XRqrtKEwPxXPLcNFH1pxV7cWKxvxaXVTgjLbpotUsyvPuRzNPtSIxvZO58+4M9lG
	gkT26t5smjTfz2nsefXtiTJQUbrNE5uhuHwTtwOZ7t44RzQSPq+064JBpaxJVzab
	/3+bmHWapauZpvln9GWeaAfsu9MXVi+kxtB7cISia+GOwUNnm2IQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bje1h01nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 14:35:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 608DRbFu032020;
	Thu, 8 Jan 2026 14:35:08 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010001.outbound.protection.outlook.com [52.101.46.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besjb568s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 14:35:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Um34Rw0vDHJ26hGOYrv3ZDj6oDQyd8moXhqr24MP0f6GPIY1d0zdcWz7Jt/BlIVM525Wl31CzsFLrWcJReRHKa//TiQwYoXhB8+P6qbLuxUt5vFM1tfy/eI7cnNkTJ0JkIqDfRDnJMdSvN+u5EBlP+iFtDS00HTj52jg6IQlAtyxgluTEWPk4g+u2UW5YZRjz3MVA3vCdgBAuZpe208IiAdJDpPsM5TieQzr0+46Yt1BFDi9nIV1AILKhQ29gtBiTnfv5hBgpZWGZoHYcLUSa3mO/mszb/f6kWWA4fExvZbWqBbWvcn/FKkyIIx7hJ4fq0rF6/0AdUxVWP2b70iqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5r2/WlBuI6zEJNEe+h2BhYulLoAV90ha6x8CW0qCZzc=;
 b=cdkFzzf6FdEFc0P66LomHDx0msg0iFBACO9L9lG9ZSpylKJyF36Mxu05oHgMtfFQaSl7Fe1v1Raq5S2y8oZv38P5aHkt3tlOtEroiseHdBP90rCD37R9M2G9XKubeT+0e3QXC6WTt3wHmCHekfzaWfJPnoZ+O7OXzcY0kgZVQmPTd9l3MwFQbBJopw4MW07RzKxUDQFNRxP2BJyvyAfctPD5ihJ8CcCpspSp2Hq3I+Z5Hk85933aHRsdjNFBoMefYdzGG3kyB6CEguO5oxdl7xPOm5WrAs1Nn4GUf1Xx9EVEySt58maVcoDBuSTbBiVEi7BTlFV3H8FKHuKOBhlH9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r2/WlBuI6zEJNEe+h2BhYulLoAV90ha6x8CW0qCZzc=;
 b=Cc4v1VQYgyxPTJ5+zLRTT3jEGaBvTKRZ/4i6bq436yjKAqAnHzwKJKsst+YEN6SLKobOiG2ce/LcIKuS5Y5Y95dZo6epQ7JA9UAbUzHAnylHfXPUnT/TwPLut/vXB7H98d+cTrSM7rBee6fkQcztnqlzaBcye9+7fmx/ZJdLH/4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by LV3PR10MB8058.namprd10.prod.outlook.com (2603:10b6:408:286::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 14:35:03 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 14:35:03 +0000
Date: Thu, 8 Jan 2026 14:35:05 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        Dave Hansen <dave.hansen@intel.com>, Dave Hansen <dave@sr71.net>,
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
Message-ID: <e3c2bfcc-b4cc-4330-8ee0-8e501345c89d@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <20260108085215-mutt-send-email-mst@kernel.org>
 <b8dc3dae-2d48-427a-be91-bcca53424d53@lucifer.local>
 <20260108092635-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108092635-mutt-send-email-mst@kernel.org>
X-ClientProxiedBy: LO4P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|LV3PR10MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b916b1-aa9d-4030-c0c3-08de4ec31c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cIQry2kc5Z6k9wtgclbCSKre07neAEDMMTIDfN+ZL/hZeVNrP2E7/YLBG0sk?=
 =?us-ascii?Q?Rz3vfJkuXz8JU3vf3XzoUsJrQphNeMbGvxR1eo8X4UbHlI+bjuULSPiAPdz2?=
 =?us-ascii?Q?1Sttg6db9w5IBjDz6iWwfcgyH3spChj6Q9BqXz9Yfc9dIqNrX/IWJ+lHANmU?=
 =?us-ascii?Q?+UmqHLkOqBkKEYTGuOAwlwg7r5oG+Ed7/qTDY8M89p4eeM5YDeuQxJ8Be7nn?=
 =?us-ascii?Q?peuw2qqzQdMKKzsv5LDlronJR3s1KfOCW8LPGfG64wA8nfq35RWQLQBsYlx2?=
 =?us-ascii?Q?uHYm/x6NUUdI+as9woBWHN3X+u0Ngk0wt7nBCk0+HITh0Ut5Nu/8geXIzge0?=
 =?us-ascii?Q?bM62hWGxuCNeudelLWFyuRGjdznPniCIgGMHg0lSuTX5KKR1LGhoOWkIYPMS?=
 =?us-ascii?Q?Bc1+BVzT7Fx7fQ2XcYIulDi9VDOzh1YRdXOqDiS5Bkw3MyZeC4xxlLSAQfQa?=
 =?us-ascii?Q?D3kMqBiwgwwI+E4YDcfHCBsd8brI2YxVSPuqSRlgbu49qhV0ger+TZp7ZApc?=
 =?us-ascii?Q?2TTUSHmup6eYlP5dOAUkq3fBmOvKfI5nH5yje5WIZGMJsp67Ij/YKxfTkFEK?=
 =?us-ascii?Q?/mQbbbsks773PStUyeG5loHh1cCaLdn+DPjUrSuDIO5+GCePGLp3/uimZxz7?=
 =?us-ascii?Q?s9UpQzeXF0DRDPMzMU1eRo//8bYe0TCKPoW2pxrKERqmNOGDsrPm+b/t7tW5?=
 =?us-ascii?Q?/jtNwEFj0J9WwKg5RXGm1iJu1lebCXV+8kgJWIZtJKKLZXFg2X0+MjbqDIK6?=
 =?us-ascii?Q?6B7ibTKaWNTV4v8mEolocOvNdl/Ium7Bg8AjroECha/ztXAa6pjepHCFPFWZ?=
 =?us-ascii?Q?9rBRZ1cIZXgdGD3UIljMUQNfgvV6FqEfPqrCL5gfQ1CvdGnGjgPS3dG+5C47?=
 =?us-ascii?Q?wrWucdgCpa6a6f6YakCOMGq3Ij0I+DQtb3aLVbI3Q9QJkQ11P/ZQq0/OdJSo?=
 =?us-ascii?Q?t3ij4nCdstRlrJKIFjLuNL6zIEG/ZV/8HpwvPWaizR/GroshM3WnCiWT+y0r?=
 =?us-ascii?Q?e/mnRqBZvgorynRCGcO8zqV9Ex643qPoNmEAxJ05YS4+x/uqtUZCC6Yv16F0?=
 =?us-ascii?Q?y6fTUWLCC3C0AcXuaz0gdmTvSp/Q6TgeCWZl2XzPj5KHYNXEQ9/noNXm+UWU?=
 =?us-ascii?Q?YJez7ldxN6yqe7vlRTzfwt8Tzvf1/8xFLSGZKwoMMk7wuoVy6c2l3dBgYcRa?=
 =?us-ascii?Q?t/SKrkgfZU2DU9qn1QI8QtqJeoDrzc6xilVaJXUx2IPHMPqRZl+orhvL9VRV?=
 =?us-ascii?Q?n8s97+mucEkqlRJIJyNo8x9ueFQ5ge31QZiEnT4+RB9yt7UAJ2+qwSDo0PtL?=
 =?us-ascii?Q?LZf31OObTLA2Jvs6EqDi9Wc25DRB76g0iCZnPh+TV3tjy2CTqknPcTeZD6a0?=
 =?us-ascii?Q?KiJ+3senF8FCWuLK5S+k8ESP6Wig8cvgBlap0mKBCijW+6rNJYwLfamQaU1+?=
 =?us-ascii?Q?Voylel1bIK85zI4RgbPpIzoUdEGkZQbY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IC9700o6nW9jDx9zKyoNRViv4Pq6dg2Deh/DRcoLb9hxn8/87hDA3R2Fru0a?=
 =?us-ascii?Q?VrkQ0FrHa+Of35lppTcUgS1z4LFfc5aSiU93OAG6S4nBi5FFCKHke0vOfiGV?=
 =?us-ascii?Q?l8EaLtM4sMk5+2DaYd2oH8ZjO6UuO515UxCJ7/q6TvnE2pB/tD+Pxo53cnvq?=
 =?us-ascii?Q?67XvHjFYATI4Br1Yc2Wl2Jh+ib5M3YzvV1FB2+2PX+hChbhNRN/OkJYoBIDt?=
 =?us-ascii?Q?L5vjfi0R9eT94tikYUJ/MhBant06u6gmr4qmrlcPlFlfk/Ib0i17mMk5g0SZ?=
 =?us-ascii?Q?e/E4eEad1kefQp9S4Cvc9/sVWj2rTEIWZztg+DEA4TehjIXp3BwS2VXXej4n?=
 =?us-ascii?Q?/ZF6aC2xwKduQr/kNJOh950sagCS+UNv0IijhRH2uI2FE1t+701BR09YcIv8?=
 =?us-ascii?Q?dYTOR6j4eKXU3mW1oGEmSHgBQkYJN5dIbvfKi5l9kC52wSjtA3esbE3HJuAo?=
 =?us-ascii?Q?3Fo68W62qEy7FktExGt36KpyqDvjdxapuMQytBEPhGbOXNhPzX9XThsZjIrU?=
 =?us-ascii?Q?uWBFd967nI3drYu6sNpXt6CLEdS/Y9mjPnnYJ+DkSXpLolW1ybf9RAB/D7/z?=
 =?us-ascii?Q?URwE6DNOfRUrHhORIVWFXcGwwJRsG25IaPSc93zfYQzeecXhvtFZ3tyF2sT+?=
 =?us-ascii?Q?RuaGsCvtf3IbdZnTMAPgHf5IEm3Vu/Ytqo5B4Jk52edAjZtwuLAW6dvaiFur?=
 =?us-ascii?Q?oFTH2nbBkcsheNT2dcX+92CFcLApcsn41lE8t7M7OUxitTpW/UCporkZCI24?=
 =?us-ascii?Q?cG44im/JuvRsnRqCq9YKE7byesWC9AVtXWBAMfjSQvuCQOpXqcIkufQyoI9i?=
 =?us-ascii?Q?gaKd4P3HuhiZdKDAj6hqgS2ijMNrAWHc7KjlDPOGFUVXBH4fhCyoThimKIJ+?=
 =?us-ascii?Q?UBu0qN+RoiODYpglD1t++wAESUI040gtdaHWg9anLdD8IRzZzSvjTKgdjEGn?=
 =?us-ascii?Q?eUoHmqLaLKmBt9gev6Cmj5IFIN06l03l3bG7EpSmuiRJf5kum+0hFzAFtBxi?=
 =?us-ascii?Q?vKnlYnuyNcbODSB3f+ar8jUNNHug6AP40/5/L77pJZCWAVR9oBUYesLAiF2h?=
 =?us-ascii?Q?lYZGk5mja6Ff4gGednXW3caQkwhdJO5bDYMeZiaY9laQJN5GvYiPXhU+36DH?=
 =?us-ascii?Q?EBlyKF+CxVEUl8zdercDaJlJBHr3A2t/tjppuQ+geLTgFKMg2iYAIl6cwAwa?=
 =?us-ascii?Q?y+ppadMJZbCpLk3gkPRUQHujPWdPZz9PdXYNE35nNAOjM0PStkvfXAnLOjyx?=
 =?us-ascii?Q?Peyb6V6qcEJhIPLIIx0WV6+hXRn1NUvZY0jga9NhZf+uUfi7hq5Cy7IXwWMD?=
 =?us-ascii?Q?JFJYyRYxWhUAgW5/eRfgQh6w5wOC+Dp6dO9Lpo09rGYsccCh20eZlIBspmO6?=
 =?us-ascii?Q?VfeRbQEIGJ4CHuNLeGNLnuSBJedTTyQy+rl1oYLkjhUhB5c4yPaoslkzcuxO?=
 =?us-ascii?Q?0QDrl8cvgOXDljReJgmgmbfyYdUFiWKyGf0CPQk3ONz4GBBme2+2c/fTrD86?=
 =?us-ascii?Q?ep4eTWvKJwJNflP4rUHtpFlHmaVIiT2LqEBipSIfwaEsbo5eo6++vDVBeDpc?=
 =?us-ascii?Q?MToEvEvIH6pVGPhszinZu4EJP9/2ncvT2Jf9NND1F6dPqeVU6e77f39Pydxo?=
 =?us-ascii?Q?mUXJI8tAa0+8myvhBKGQDNEyGJIpJN43QRJHV3PvX7Vjr8Gr7mppH+6sct88?=
 =?us-ascii?Q?fstTodDVGh08okBpG6tsaM7ubDS21Ae4Ehyx5s5JprEhmWov15IeDovFroVC?=
 =?us-ascii?Q?u1NsUQ5240LIsqsmI/dMg4jl1o41AgU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i/kkKzUzP0d1lRV5tiEOfExQ6U+HOB1i/TA2K9xWpTcZguSZ8rt0kMPiqBzqi9fvkWGB9BdnOqeRVQaaFJ13SXAcZh2atYpEh5DktzY8Lotw34MinzqTGzSAnH9dDrQ/WEQVasrfB15tIScPADEctUzUm81t/9QEMSw+uukLuovw/WbmljCnDfkuX7gvR2r97SE3rB3jDSG6/HFDl9bJuDFhPmMLZL8ydNu8u0q3hQaSJ8snbGHh+mkWeo50imVzGnYXS1pL2SB3AGdH7APuAIi4icZHQfOavVgT3cm4R09YOmR4Jsl7EtgJNMEp0Wm6IMuWbXNMuseRmgSGuQY+YEY/R8tNFWsJd/w3wVWiW/DbCpfaRWnV5DWh/jEuCsrxD+GEkTtT1to451q+32rp1ZmqHzdRs7JkkTgb0fJNRGqN1xLfUB2Ff5YIagAFgyImAxCT8zo8O8NrdONSEru92YPtG2Gxwr3BjKlgvD9aq/tg9lCUqAYMx5fhXJyJR1b7pgFxBymI5k9cuxLWICDOf9bUAqG5MBXe2qfb3efWm5a9cEzCTsymgyxF11vDTY5ZBtkeJM9zCMNXGesJCgjmYGhOCnDB62FVBEygd5lmKWE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b916b1-aa9d-4030-c0c3-08de4ec31c04
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 14:35:02.9972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlBCsqpY0vyAo3ZEMWY57agwoxkKzJO3pWhbimXqk9RjyoNLAAdMTZB+PeJUxJYUnp041Ch4A5mEksJ5dWvYo5EMXDCUi3Q3lCUBU07K9D0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8058
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=750 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601080105
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwNCBTYWx0ZWRfXyzjSORiLWyd2
 C+CpRuO60yxHWIdm3aVfh4kzNbYCPRyXea3tBj2/0vCXVyDH4AqG3lK6YS47leXypWLd2qSwCJM
 F7myvvXN6S0ZPrSZl9/howgbXPBQvxC+UEvCZ96E+W/1/cxGwzXk1+xILynB8ggifO0j+Aphbgm
 42x8ORWRxgS8a4/SrlKASScjHpmgqB0x6wdhzns1HajZtyu5Jf2HlpDDfQud/u9MdTSpR1i8Siv
 8CljwifnWQUtS52U/m0t7ZXyiPejQVWp0/FDjNNigR92Q2BM4gKwlbm6AmRQGWFCX43njF428Pn
 Z3oLps4FhcjC/gieXa3nFtVD9MBSrCX68C+6LVwECtncEvrrARh386iyW1pNUi9xihYFka9Ad83
 NKRe47aIxFlkjdVlIy3SCLS9W+vjUSo/Mhe1dc3sjqEZyLYpokHNc+lyvErPFgIDWJlS54DdLYe
 JXInLNnUWd0dCN0PA8w==
X-Proofpoint-ORIG-GUID: bSCS8qK5w0oEHDoHh7OOzr-bVMuboY1n
X-Authority-Analysis: v=2.4 cv=evjSD4pX c=1 sm=1 tr=0 ts=695fc09d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=5SNVHzLFfnqdEW5TOXUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: bSCS8qK5w0oEHDoHh7OOzr-bVMuboY1n

On Thu, Jan 08, 2026 at 09:28:09AM -0500, Michael S. Tsirkin wrote:
> On Thu, Jan 08, 2026 at 02:24:55PM +0000, Lorenzo Stoakes wrote:
> >
> > At any rate, even if you feel this is exactly the same, you surely therefore
> > cannot object to the suggested changes in [0] which would amount in your view
> > then to the same kind of dismissal you might give to a checkpatch --fix series?
>
> I have no problem with the suggested changes. I am especially happy that
> they say "As with the output of any tooling".

See? I can compromise... ;)
