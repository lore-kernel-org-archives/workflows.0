Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4094946F3;
	Thu,  8 Jan 2026 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868179; cv=fail; b=KDw8qK7bSBDRoPBpj6oaP3QZqaSrxX47XDq1I0LWoqXL+Mwk9pwrLhqZqxwE6vIJ7aQhwBtKS2cEWgq4Szp5L53j09d3AcD8vBFri/yP5pwGIbRzQz7+EOLjgTeGkzZToVOCWDDoOOwLGpl828Yuy4YIziAgH3eLqV+UIIeNxwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868179; c=relaxed/simple;
	bh=p0eabHNH581zg4oYbN6I3IHApH/SxwlhNc1F1ifYpU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P832kPJRR+9p9/OtNNObAP4eix6ByRF6z96dYqtUbbOtLG5OuZBzgkJISynzBShknkeS5EXBsO/FfpX9cYXW4R766Nk2NEcv0MTZnphL46p7d8A91QtYOfBOGEGHb/tYk8/n6lLFMBbp0bIbiGFzDa6ZJ+EVnct8fhyo1K6J9AI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GJfo0jnz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wSpt/ZFQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GJfo0jnz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wSpt/ZFQ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608AT8LP089562;
	Thu, 8 Jan 2026 10:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=qwsPXmHnv0V9nn/juS
	iNhyUWDlZTaYXlr6KyjNXb3JU=; b=GJfo0jnzIxrRK08sKu8KTQRI0BVq/04hJM
	lobz0cxn8CTCNfnr/3nWsDBA6wyCSLQ6qghW+056xPvVXTaqOFA+vNcak27pvgJu
	YPqPG2iS4BTcFbnJWw4Q6KYmNDT614TvEKeC9vDLA0dT5HnK4WdArn9KgrVGBqC/
	O9WKsQFhQH40i84ObdMbSpZ4kmsOP99OiUCmo0HbQLcY8dWMif4EbwhdyfOemQEA
	omdos/kvgnk/DZvX5PZV+EYY6AseMQPcI6piCn6gTT6DIu+c6cq+j0llfI/iCCzx
	H+slS0xYIaPNeDSI6Q8Fc7q9jJnE6ry+VCcCSyvKZycMk3PzZLAw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bjav7000c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 10:29:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6087roRC034186;
	Thu, 8 Jan 2026 10:29:11 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010013.outbound.protection.outlook.com [52.101.61.13])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besjax12e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 Jan 2026 10:29:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qn0WHZDtIuIxpaMm3jRmFOuFdujS+eVdTWLAIPqzFBilNk8Bk13zLgOYBGYN3eTYVKJTyehGQ84xSafR1RMOSIeeR1C8ChnFVq/yDWW0UqKM6C4zKAiNkVCklKqW9uB+7g/qHr3TmpFldhxPndyt8m3YtXwScJrl6sqeb19Xf+4cvDPkEnJL+LCp4zbz889qf1Gkc+B2IAzM39jMTgmpmVnCyt25dz47P6Ems6vvZFwHvydtQ9tgVB6Qt9wpNO0sISEmrt+pJMzhNdOsarhgh2MwlZB77MpqSE6gQX8R0AjAKDai1Lzh5UUUQh/n/4qbDnaJtor884QHdthO9t3ecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwsPXmHnv0V9nn/juSiNhyUWDlZTaYXlr6KyjNXb3JU=;
 b=rk10msibG2oaBLHpup+yqx2tgAYrcKiWFEnXQsMyOr6NCLBFjrmJPblXeNLyxRsPSIzCV08KHjz9m618H47qyqhLDRO9oGTqksD6eV0RwLpPDiQg9ggb02O5thFScaLc2MYv75s8BD/R/GAed5N2FWgZsYlsHW/rt/H2tkAfQ6petQ6O5hDgaY8dZ7rPV9OYADvaMYwVXZ7/jzgETsmGebREt7YcEBL89hnKmVTIWYlovgN1lPx1adeIgBhHNRNduhjP8X1rjEFwPPWJYKrj8molPuXFhTV0Vqnr68ZBzGeD2tVGr5v+2TUweycO/RQbeLypedUd6qlOVAiKvwjiHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwsPXmHnv0V9nn/juSiNhyUWDlZTaYXlr6KyjNXb3JU=;
 b=wSpt/ZFQ5PhmEghV0czOcVcTZNlWdBKf0CYgFJg+bxSPLFmtz0j2zSmlGGHK+BVt5zaXEUKFRaf7cZUAlELk/ETdSK1wPONj/PGMpz7AXLUabm11R1VPFbyVNI0RYvDc+SYLzhjZZAvpPpPuCfYlklKibhfRsz/Zdl+M1+zWXc4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB6708.namprd10.prod.outlook.com (2603:10b6:930:94::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 10:29:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 10:29:07 +0000
Date: Thu, 8 Jan 2026 10:29:09 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: dan.j.williams@intel.com
Cc: Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>,
        linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
        SeongJae Park <sj@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        NeilBrown <neilb@ownmail.net>, Theodore Ts'o <tytso@mit.edu>,
        Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org,
        ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <12d910d5-0937-4aba-976c-9872289d21a4@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <695ef146d651b_4b7a1002a@dwillia2-mobl4.notmuch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <695ef146d651b_4b7a1002a@dwillia2-mobl4.notmuch>
X-ClientProxiedBy: LO4P123CA0374.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa3f332-7944-4a94-598e-08de4ea0c10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iQs0EvIMrF8UNerTvyco4CkPc5EO2kMrKcPxA/QVdvv0w9iVDbWKGNGcFN3J?=
 =?us-ascii?Q?Ep7SoqT707MTLD7z9MR/ukixTmlIZlGFTJddeOT5V2zkRO7QRVo6Wft66LQm?=
 =?us-ascii?Q?NA82MOSDbytjh9rQXQHo5xsv0i/gm4nrmE57ExCPDeCnZVTfbIt5nrrdb/Sd?=
 =?us-ascii?Q?baJ61QsF9hqJbPmEMrKs17SiWYA86zM/nNEsSb1gPDfq/yb9v6AuWzukm9Ye?=
 =?us-ascii?Q?p4OWtoUFh68pzJKUV0dMfpRm46cFBaOTqVyah+AMTGK/3yAdx+eEl8rByIdd?=
 =?us-ascii?Q?EX+Aw94AadX41vhh244M1CW9NUuG+m7pwo9FTqpg34kpZbDNwBQ3lYByeZlJ?=
 =?us-ascii?Q?JdOnr4iBSEsbjXA06Ui39K/NQXHKmOXFa1eXWdhOMJ/ZSL67pI6sNRzAIdRe?=
 =?us-ascii?Q?a84Xq4iJTAWiyQKpHyUlrEIugFJVXQ9HphpGadHlj8pNi/6PW2+RVGbBYLPu?=
 =?us-ascii?Q?ditVdsFJFGuzmBlRamDHOIxXd+gakpCSw6rBBwClvn0i+XWZTI5bm/zny3ju?=
 =?us-ascii?Q?L3S3bTCNt1sE89rc6bUdo28WQWAu4+HAwvBAvyM9zJ+9tOSbQKgsHNnUqSCh?=
 =?us-ascii?Q?OtupXog30Jb0OTwHAsPeYSkrar0FdgtcyNwTEq2Uh8iSGswejLbQy75XftFI?=
 =?us-ascii?Q?qNi7IyaGBAh+mrgdJkzAxMDXwPL6WA+iJqEqgjTpBY32/rp1QzOoayh5dvZl?=
 =?us-ascii?Q?/e92KzeSFoKzlqBdQ0oMzSEifrJHcsb/00o3OuwdU5ih2Ld9jsk2EoTnfvuf?=
 =?us-ascii?Q?Th48xPb6/9UWAdJgv9LvVVLI996RhgLo3pzh4lQ3GYxIoaHAhHFDE9QpBis7?=
 =?us-ascii?Q?yxJnQWxIWwFrvixtEPdASh6KqjVwGeJewjP7CmQwkcU2+eTDOmNnT4jTvldm?=
 =?us-ascii?Q?A+NqDOEw/849nuNGzGAGtbO/0utCLpPLKFDv5Mo/sHP+LsrkdPS177752PrB?=
 =?us-ascii?Q?pEHvPC9wQt3b6oBqH13CP6cWhHwSjTPls9Jq8hzCdWgV0PSsXZDQRXUi6u2G?=
 =?us-ascii?Q?286PVO9pUSY9XP2M4u8x0hSAl7FLcSyVmoSZPG1s8ObecxHrGenhI0QHQY5o?=
 =?us-ascii?Q?HmdoFfTWbwAy0Ln1hVbw4/j4sgX5NHvw7HvQZZQoA8A9RAOlUvK0uqpHrhcd?=
 =?us-ascii?Q?/cIEHQG8ulMQSwJh4BBqngD110IeoSXuogkQA40mQlHzrujWxtQi4RmeNWPV?=
 =?us-ascii?Q?XpbKBpywHyJbS8RZ+Sa03VDpNxjEEyRyRlFf2bQMbEpOm6WSwN3uOzxE8NFB?=
 =?us-ascii?Q?6KqinCI3sb8VLH2DdfMuJuqSmWeJcjAaH7TqRctdugfKtcciaA6Fx38ftpjF?=
 =?us-ascii?Q?HWq5crPekvfmr8zf36D7h67obf2KNj+JJAb/AWabR9xL9dWFEXXeBZwihhTA?=
 =?us-ascii?Q?R0uWf5I0SoEeor/CR43skTo0MgIIuOMV4X8SS6XcMWd9muta/sRjQ8R/AQLO?=
 =?us-ascii?Q?+Rs//HsSXEBR0VllQLvszjnsGnv+W6Td?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6hWlYzSvuSaFC3qusaGRyNJ4HxPMEUvPjctkbEUZezIX1IV1Q9CKy6kpPlUe?=
 =?us-ascii?Q?lRLzojvKjRUqhD0taxOcE6XwJbCQd4TA67qvkUzm+nKH7SFvL2lQA65fqfYG?=
 =?us-ascii?Q?DsuGxxYE3DwzP6/P6wFCXn0sTrVP0Adg4neZpBJJEdg/Z/ak/bK5oVRDWeJ+?=
 =?us-ascii?Q?LfW4djdHNgGaPK7oBxm6jGTBX6xIwadpaZbOYtBMk3ZLHZeSz34F5hh9bvtN?=
 =?us-ascii?Q?PGzQCQJaSxZVEKs66G2xnJBSqDpQxGVLCN3V+SiV+wPhR5a+psorFOEquX5W?=
 =?us-ascii?Q?JTka/31siypUoJ32z+0a18aPTuDI7auYcRTwmL2JBCpVfBuw2aIDWz+x7gcr?=
 =?us-ascii?Q?RVlWrHZbiZgMxnGEPe47GElbFhNJLRQVGmPewF1fbvK218YTEQgCyi9ag/fO?=
 =?us-ascii?Q?xG1BRDEpOAOptCM3R2jJ+quqjwg9PPzXlDAzBTppCjvu+NY9IHz5G85PWN2z?=
 =?us-ascii?Q?JV7ZxtGX7gr9F1S8fOliXYNN2FgMvsvPiM2X3a6bIGqfEDxCSRhxsh8lqa3e?=
 =?us-ascii?Q?aulq6nUNO2DiY0Jhw57i9d+gkQulB6rNvgSCw5z3c3RbVGuIIyMfJ9s4Qi74?=
 =?us-ascii?Q?thZaOhXVm6iTwj3G9fwDe8CriQxn+9OhF/cFwWZLiy4yC6fqONnXgIyJ81wN?=
 =?us-ascii?Q?C/jYvKzGsQNv8B2AUQ4Bfyv57FzkD+Ra1vf9Tu/QzSUrTFcddymWO3z+caXI?=
 =?us-ascii?Q?F8aUlvkgDEFyrlvsivhOpGweh3mMOeLxXo/BmPwq7cPi9k2vPSLNzo6llvzd?=
 =?us-ascii?Q?SyS7juGkV4nEGRA/TCHex0igxbDTdX+HTEkw4LfC1ZbIkL6kkg7g8QYo7fQY?=
 =?us-ascii?Q?98YQzgqhEQ0ELbDi7RXP+ea/HuDYvlTVD0+JABDKZ3ddy3MQyXXJelxondfH?=
 =?us-ascii?Q?9v+zjrXLO+nWpzQtIx8X6C+pwMWL14+vVl05MpWyQa0WFRx6TsMLSKV0Hmyp?=
 =?us-ascii?Q?KonHfY/OoqaXUtaLE+md376JPDCc7jrpGwkvt6G5LyLC6g+yt4F3KIPDfU0S?=
 =?us-ascii?Q?LtJtEJj8B3Ny9KNZ2eYKbAdJb6A92H3WqvVjq6uVJHPrwBgBavwF+GH3OpV2?=
 =?us-ascii?Q?CuPE8tdPFaLFguBqz5+fVUxVgGU64Qph6Ic5pRRDb46dCOS8FcpwPSEIBBvq?=
 =?us-ascii?Q?SdEQIznnF2DRZLzmYd2PuTTbbvAWjYt0z9ssbkQUVawmIPmkUrGK330rcSZO?=
 =?us-ascii?Q?1woYMCUvOmHVtNOBXRc/4i3Pws1yRE/psDu6KVF/hVyeM7XUVnz0zmSZXecA?=
 =?us-ascii?Q?iaMQans9Ad4WmkLyppvNIAytOStrfvhYBi1EouVHhqEKUa7AyU9pc1OMft1p?=
 =?us-ascii?Q?wIrTEv0mYllpFZY13ykRZUnQAF7LXi/VXUd5mO/UIQGWTyWaGU2PgB2NXCnS?=
 =?us-ascii?Q?Cu+VrGrkdXGEvmaYS2pleRBtd+vZZ5P39K9lIm9ocAstAKiFFAkQluCzYVd+?=
 =?us-ascii?Q?cKKVN/ZPfm/i8uiT930wLWz6EHO2MFlKGFk1Eb8Q/MKhOnlGhtNl1H/C1adb?=
 =?us-ascii?Q?t2wyBi1ZLmcvseKQ6dlpLoOe2IoOVb7NowxgJM4tRYQUMkvzTrj7iOzWlFAz?=
 =?us-ascii?Q?a8VRyrAuh9E41tBeW1YulD75MF360NNWYS+yDcPnAzZsvOw5az8r5g88ZRBT?=
 =?us-ascii?Q?ICPRW8Xxu/yF2OrsMUk+kyFDoLHQJcUnIKhLBP74GMGAftKPozkTwmESZFfR?=
 =?us-ascii?Q?CXvbowXZhif0t1D845vET2DUl8bThB950F5J1s1dIVqzuiQukzPHvirSi5KN?=
 =?us-ascii?Q?RICHxKsh9KKPK9KUG/guTTsGMohfxX0=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RXRf1hsp8CTMdap+Xa03l6BqKjNIVSwjzoNLReqgHjMtd9FrdAPl0QskHsWFQDs7InSqTYYI14RvemEl70ky+P/tgatcg3E+YG+3CkrrcIwH2E+A5XPKnsZGaKK7RgVJY5JJWgi3Sjuhb0Y/bHeSICwm7ASifi7EoFZOsNcc+h+ERnEQQmYNFVk9JqyKi4n0bBE864Viurqy8BJT5DyHhwrWgt0RheNCsPc+SlG+IJMhRBiCcu9gCvAddGyRKwZxz/dlh8nXFVjh5njFZcWWkmJAaWco5ANnXIDuJxCI09zqKrBSLDQJrc61dK+5FdS8xKCqGkDcXUA7DXJixBE7G3q334/lIH8pwqVT8LOFPvh/fXYIz0Io7wrztBqaEeMQXDBDc8UlPc2eIgiVVWzZ1QDjdzulL3WI8f/q3gBW89iKfsxX5vyAW9mWHjEz4sm4Qc9+O0xtI9b8i1CWQC+FuoKkG9RX9vzum9JE65qgK3N8QYyYGQEl31T4ykw5M+NjU0fCqmvN+AS9JxEH9iI87OprCMyyH5XrXkWbX3qKME/0aBc5Zr4AkUrskrRl0pcvmQVob39aPRF0DSpzk0VZdnPZgTPpL/AA2rDFBoDZPfc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa3f332-7944-4a94-598e-08de4ea0c10b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 10:29:07.5714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKCD2onowSOECrKyLdtReQSUVp+bnr17lIguHyLjBmvMpgHj8MXlP133qFdlhXX701/Zi2kcNmhx+iBYgxcXZXroBpA+Lxs+DdaxsYz3fIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6708
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601080070
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA3MCBTYWx0ZWRfX1GBNukNQMrNA
 4Gjr509ZOcNX2Cce7C4rfuEmUwEEU0bHHC1Pn84QOWp1IdU7QBlYfqA/xxBz7ZSjV0gbdTaFebI
 Ol3hqwRhGWGyhSY8uSJ2CyZP0ZKlSVUgx3CaSgwB4qazmKxW+K/WSimmH/H5tShrUJQqq6Uzqbc
 lVmq1no8COXJaPLU8gpnplz4dfYEbTN6v+BAEGZWoVsaNFjwV5T1yBdMqDMs9sFdpxVc3F9wGjO
 vbh8oHekzbwx53R9sZrgxeGciAypgEBux7hdQ8GJiZl5xYee3VpU3fMnRPmGCjiI1iZWdi9rbWd
 bYqLSbsQRMdkiGfWeoduZOdpq6fm8lJvr5d+8r2BJsTm54bF5YwyvgpV+zxcRRkt1NGytpQp6Xj
 lq/TNJ2enWeoyUXNSyJH67B8x6y/Q01U0uWEsU9TXgTpLKuocMea2AQjE7uEw91lQBaHjmpIhF1
 VppPzkiM7vi90niBz+g==
X-Proofpoint-GUID: kKyo_IUo_42CTzX7CkxvePR1CDn8EGCP
X-Proofpoint-ORIG-GUID: kKyo_IUo_42CTzX7CkxvePR1CDn8EGCP
X-Authority-Analysis: v=2.4 cv=AKuhsf4r c=1 sm=1 tr=0 ts=695f86f8 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=Ul4VMm_Em5441T1bpI0A:9 a=CjuIK1q_8ugA:10

On Wed, Jan 07, 2026 at 03:50:30PM -0800, dan.j.williams@intel.com wrote:
> Lorenzo Stoakes wrote:
> [..]
> > And it's not like I'm asking for much, I'm not asking you to rewrite the
> > document, or take an entirely different approach, I'm just saying that we
> > should highlight that :
> >
> > 1. LLMs _allow you to send patches end-to-end without expertise_.
> >
> > 2. As a result, even though the community (rightly) strongly disapproves of
> >    blanket dismissals of series, if we suspect AI slop [I think it's useful
> >    to actually use that term], maintains can reject it out of hand.
> >
> > Point 2 is absolutely a new thing in my view.
>
> I worry what this sentiment does to the health of the project. Is
> "hunting for slop" really what we want to be doing? When the accusation
> is false, what then?

Yeah that's a very good point, and we don't want a witch hunt.

In fact in practice already I've had discussions with other maintainers about
series that seemed to have LLM elements in them (entirely in good faith I might
add).

Really I'm talking about series that are _very clearly_ slop.

And it's about the asymmetry between maintainer resource and the capacity for
people to send mountains of code.

The ability to send things completely end-to-end is the big difference here
vs. other tooling.

>
> If the goal of the wording change is to give cover and license for that
> kind of activity, I have a hard time seeing that as good for the
> project.

I agree entirely, and I absolutely do not want that.

>
> It has always been the case that problematic submitters put stress on
> maintainer bandwidth. Having a name for one class of potential
> maintainer stress in a process document does not advance the status quo.
>
> A maintainer is trusted to maintain the code and have always been able
> to give feedback of "I don't like it, leaves a bad taste", "I don't
> trust it does what it claims", or "I don't trust you, $submitter, to be
> able to maintain the implications of this proposal long term". That
> feedback is not strictly technical, but it is more actionable than "this
> is AI slop".

I really don't think it is the case that maintainers can simplly dismiss an
entire series like that.

The reason why is that, unlike e.g. a coccinelle script or something, this
won't be doing just cleanups, or fixing scope, or whatever.

LLMs can uniquely allow you to send a series that is entirely novel,
introducing new functionality or making significant changes.

For good reason, the community frowns upon just-rejecting that kind of
series without providing technical feedback.

There's a spectrum of opinions on these tools - on the extreme positive
side you have people who'd say we _should_ accept such series, or at least
review them in detail each time. On the extreme negative people would say
you should reject anything like this altogether even if you don't state
that an LLM helped you.

I think you'd probably agree both extremes are silly, but even many
moderate positions would leave the 'should we review these in detail'
rather blurry.

And thus it isn't therefore entirely clear that a maintainer dismissing
these kinds of series out of hand wouldn't be violating the norm of 'don't
reject series without technical reasoning'.

It would therefore be useful for the document to make it clear that they in
fact can.

Otherwise I fear we don't have an answer for the asymmetry issue. And as I
said to Linus, I think it'd be useful to be able to reference the document
in doing so.

Cheers, Lorenzo
