Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E2FC54E76
	for <workflows@archiver.kernel.org>; Mon, 20 Nov 2023 12:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbjKTMUX (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 20 Nov 2023 07:20:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233609AbjKTMUR (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 20 Nov 2023 07:20:17 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516AA10B;
        Mon, 20 Nov 2023 04:20:13 -0800 (PST)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKCFW1w003211;
        Mon, 20 Nov 2023 12:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=4a2MCJUvGXKqK3CVRBtb5CNVxKsdsGATlj3Gyl8uWik=;
 b=Dkb3X1ZJF069FOc/gOAuUY+SyJcx/gsIh9kdvEi76KpqpkrFZavZdXz2QBdyPXheEali
 b7VN9ILuLyn5Ivt+ZmLg4qmiOVZuy3JOSLBS0ygKoX3ul85WAyM9FKSpHsBePCdHcZ48
 Jwu/8vVnMxHg+SrpQ0KmMnyDBMj7hDqKTqIa6QtwCxoigtjR9fQ49nmul9j5Q1zRlQEN
 zyaDcWZILi/YGKox151r+ySM4ypY9e5iTXlbgTzHLV6Stgc+yAroEXFHK2Sn6OamP+ZO
 84czFLYyhQGYf6SnZK8+rpgmVIucLMFrKZR0OV1PPvyylqs7k4Xli2SZC/myY6Yl6jwk MQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3uem6cajcp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Nov 2023 12:20:08 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKBriTT037450;
        Mon, 20 Nov 2023 12:20:06 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3uekq5a92t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 20 Nov 2023 12:20:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5iUVxSfsjGTAs9unFOP3k3cRGytcABcMaIfsXA9c2M1w1QqogWIam0voiJ/9I4EJOKLPZLyGBU+SFBlSgF14i0l4ht88/4fQ7dM4Tkks8KRBI/fMFYTQFOvxNeX5hCkUb8kPhwyLAlt91SjnS+xYaKz79Hat5m/nnrtCyxec+UOyePBaxkhTEHa1iTqlnCt+evZOiXmw2VBzH78D37Tks6RnRYBI06MeCzejWnzFVoSveXPqcO+ai3ALugEE/d7uyYRDRjMSdO25s3SPkYBtVGjmB0YJRb60Z1mYA6rv0XL5aFeHgNDjAzazG3Il4YmZLl8lMjYCHUJP8ukQLTz1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4a2MCJUvGXKqK3CVRBtb5CNVxKsdsGATlj3Gyl8uWik=;
 b=GoBU/QsyR1CF410jfYSsAfKgM3c1MqwzDDIJCBYp6xf003sbFAbX8LmtrNcaQxe5+6ybRNwyqjUx4bm02qZp4WVz4707kKJ2ghAnvKeVlFz7raA6ElZe+YwdrFhIsGjT3Y+CE9/ZYQguTgQN390WOlQPZMBJ4Xl0h/oGagCLOtgEuKC0JqUi9jjzAMRBJlPNnx4Lm/H3woLBV1lqQ/d444tZmEh0CFZjVOASP4UwR2kQTf7YnzQWkBxldfdlMtIodiU2pf3h2sPC++3/t/rLOTKX6R9j46pB1My/cHxDcAkvmEFN1bBEiJgiOIKNrTGaLx1AaawPfLfadMaXEm3B4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4a2MCJUvGXKqK3CVRBtb5CNVxKsdsGATlj3Gyl8uWik=;
 b=C4J8xHyEoGSSdJ6H5QkzlbuE+HcN8TDCiw9otfmo7p/gKClT4D5oyQjIb3/ZUmp59IAQHXbF/Fcb4sSbHt5ZB7/Go9i+phJ+uAkX1oMlq7lr2MuCBNp4sDF/GOD8ntIQmMdaM9Zn6rDvOItkdR3o8siLYABfiQ0HuazXZZ1cnVk=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by BL3PR10MB6212.namprd10.prod.outlook.com (2603:10b6:208:38c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 12:20:05 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::cef0:d8a0:3eb1:66b2]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::cef0:d8a0:3eb1:66b2%4]) with mapi id 15.20.7002.025; Mon, 20 Nov 2023
 12:20:04 +0000
Message-ID: <08dee822-c269-41c4-8699-cfab51241e9f@oracle.com>
Date:   Mon, 20 Nov 2023 13:20:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Kernel documentation
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Cc:     linux-doc@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
        workflows@vger.kernel.org
References: <87fs6rxppz.fsf@meer.lwn.net>
 <e79d53e2-4a1a-4f7e-850c-7f412ba43d35@oracle.com>
 <87cywg8gpg.fsf@meer.lwn.net>
From:   Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <87cywg8gpg.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0244.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::17) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|BL3PR10MB6212:EE_
X-MS-Office365-Filtering-Correlation-Id: f955b07f-1f13-4469-3a6d-08dbe9c306e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L482HNy18BIzWeeKpPpLm4bMAeZagu++vDUCnOb9a6bBYuJjpynvpwuughzl+dLGq7yDtYTdayA5AyTTTnt7YZGDxzVUuauEUYHEqT2NT0xQbi88i9DRbp8xtoM2r8un5A6e0ipFoRcrylm9uJrOeHbMILn78Qz2/yGEqPB8u3vVDoTTHwiomj8SqhVZ0ut93MD6lHJ10Simt7tYec98UC1M82xP1LCjBGuyguPi1EmL8ZZIhVqi1I3Nl2Ux0JTbZvZVYd2M5idAAmotEPvhvC9oqoVxWVKv8vlgWoN+TGDAfI+SmzN116CxgXTLfiXqu2caGnmrk81IJpEkthXjtZB6KDoCSZTUnlruDEOg7QpSAka+5FUJzIcFMRV1xWvW91GEtavl4v+cNLEs0AQ1nbP0+ESZRfmIdcK6AO/KmVt7Q9vW45jZRS/JMYBCKbR+P8xx7dWq33nGgqn4It2m863670tYwW74CsO+jlymUbJPrEFnaA2AMHmq6FmYlwyh5cpiD9jqayWtint9RlZ9w12ZDvdcLm/QnX0eKBkS+nHjvuusfN1Yt8MlLguNf+26h5MbRJCT8BltzUyImKj/63uAicluo9IW1HS9dWQeZXwGbwULQH4Q902plefdLcYOsk8to94SM+w8oETTwNIt0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(86362001)(31696002)(31686004)(66899024)(6486002)(966005)(6666004)(6506007)(66556008)(66476007)(66946007)(316002)(36756003)(53546011)(26005)(6512007)(83380400001)(2616005)(44832011)(2906002)(41300700001)(478600001)(5660300002)(38100700002)(8936002)(8676002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXg1ajVWUmFvZXRYMDBBVGJUYTcrZXNiN0VBeGZHSXZicmhJSldwWjluTWt3?=
 =?utf-8?B?a0pOR1ZlQVk4NEFtTmY4NStuUWp0bnpsdXhzZmQ4Qm80RTNBV1BmSHhrMUVY?=
 =?utf-8?B?NldVTEhvSmtwTzRhK2hYOU5uU1dZOFVKYWhpcklSd29YbklYSDE4emVneC9S?=
 =?utf-8?B?eTA2RnkxUFR0MVcvMHpuQmN2V2xoOW51WjZ6QWd6WE1Dam52VzZnTEtnT3pD?=
 =?utf-8?B?KzU3K3ZiQXJDenprS04rOG9IK1dXZTA5YlVuSGhMbjN0cC8vQ0IzQXpPbTZS?=
 =?utf-8?B?OVhhdXlhK2lORmR4ZDQ0QjcvMUFYS2R6aGpITmtLWERSd2tQbnFPM2dNQmh4?=
 =?utf-8?B?ZnFsZ2VLVEU1UWpyK3JGMzIvR3gxZ1pKbkZXVDZFREcyNmF6Q2puYVpiYXpv?=
 =?utf-8?B?b3lRK3FDdU9tekZtQUo2aGVlMFR6TElRZTBadHI2S1ZzQzEvN0VJbS9kS3Vp?=
 =?utf-8?B?Z01HcEVDYzBjQ1IwL1dmZFk0dHQ0ak5xTWZ1M0JBZjUrUEpFZXdpSjJUblEw?=
 =?utf-8?B?bTNIMDYrU2hYTE9XaER3OWRBNHZkUFczOWQrU25jcUI4RGNZbnFnSDBQSEdS?=
 =?utf-8?B?WnYydWxNL3IrVGRZNG16R0V0aHE0TndUUnBaQXpjM0x4ZWRqL1dVNHVpK24w?=
 =?utf-8?B?QUNoNjI1cFZieDRnSjdtRkVUNGZNTVZYak9qUXVWZlF2ZWRyQVJpR3puR0lY?=
 =?utf-8?B?VThFUVc1R3JjMjRHcGYxSmp6S0FMR3I1QnZIVzM1bWFWaFJtcUl0c0p3Q2k2?=
 =?utf-8?B?T3ZIb09uMGFQMjYzSlQyV1RyaHpiYVRKMVJpbUt1Vy9zUVdwbXJVM1R6MHVG?=
 =?utf-8?B?NXpCS3cvSU53QVpHTGQ3NmpoZmdTdW40S2h1WFRvMUI0U2puaDM2MU40YkxI?=
 =?utf-8?B?S1dPQ2hoaDhsYnlSWkQ5L2FlSGF2dzk0YUNOTnd0V1hPbURrTkEwTWkvRWwr?=
 =?utf-8?B?ZHN4MjdQZkp2TUNjYTdpT25iZ29IZkkraFlMdjQrQ3RnRmx4bEEwNU5peWtW?=
 =?utf-8?B?ejNrZ1Njb25FcmI3dGZ2YTZWS0xrb3dKZTJNRjRleS93RlZFc3g0K1VPaFhH?=
 =?utf-8?B?NTZySElOdUtWZTNxN1VKMGZOREoxSVBXb2JjZitjRjhBYjF1VlYzUyttSVdN?=
 =?utf-8?B?S3E4cE8rY1h6b05ZWk5rWDBpOEpQNmNZbEFSZm9YclVsKzdNYi9jVWcwWmx6?=
 =?utf-8?B?M2FnSzVLN2ZSQ1lHSmk2Tit0ME15Z2prQlVIamxsWWZWMTNHQUtuVXF0OVVv?=
 =?utf-8?B?QXI1QUtMWFh5aWlZcGlLa0Fka2RIZ0FPVXFhZVUyNUtYNEh1NVlLallSL1NP?=
 =?utf-8?B?ZXgyMVpzVE5lN3FBbElCaXNMKzRzVWxrRlJhVzVNTlpuWWxYYnRLT29MRmZz?=
 =?utf-8?B?VWlIQmRJSFNpSDJQRFdyYVFrcjhQWXA1c2tmYXYxN3RHNXJNeFpWYVJzQkhM?=
 =?utf-8?B?K3JuNWwycG1LbEJNOHViRFJ4T09ZMDQwQmsxaTFubFkzNVlBQzVINkJBaUhY?=
 =?utf-8?B?UjJQc21scS94YlJzZ09neHpSM1d3czk0NXlldUZFbFZxcVJTcHlBSnVRUnAr?=
 =?utf-8?B?b3hnbU94S0ZwTmNrZUNHaFFQc1BwQnhFRStUSGRQcDhkVDkrU0VHQ3NSbldS?=
 =?utf-8?B?TFI4TndOVFJUamE3K0U4SUVFZm5QR3lsMjRSZnExVVQyVmhtNUNoUkxYQWlx?=
 =?utf-8?B?UVV4TW1VR0wwTHp3WmVRT1p3OTBPWUJzNzdRb3V3RVgxaUFYMStYWkQrV3Qy?=
 =?utf-8?B?N203cGR2VHViYWJSaFRNZE16VVJnNFk2Y2ZtbTZTd1FDeHF3dDNzenk5eXVZ?=
 =?utf-8?B?dzRMRTZGNDBxWHhXL2FydmpWZUxBYXVDenlpdDJnOVVVSG9ueWwxMXYvNml2?=
 =?utf-8?B?Y2U0MFFwTEpzNDUyMEZ0dmFoSzNtWlgvajF3T2tqc2t1VGNBdlpNUThNYkpU?=
 =?utf-8?B?aHFJR0JZdlBaWjdra1U2MDVJWVBmc1drbU9KclgwR1dTUXU2czI0UzNoUUJa?=
 =?utf-8?B?WUtFa2dtdytXNDNsWGJ1OG9KeU13MHpuOTNXTDBESWVPd3RnZUJTMnZYb1JQ?=
 =?utf-8?B?bW56bTBRQUVocWF2WEtnL3ZGbzBRdy9NUXUrM09KUExySWdqcHJNYjNCUm5r?=
 =?utf-8?B?NVJJR3UrOTZXOHpMamZqTkpiajlaSGZEVERHUUU3SmNIZk9jYVlLSGc4SmRy?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: pxm61Wcs+hAF15gkkcLeagjwG6/3yjVbgy7zgb9re1pcMQWhrff3ooBp9JjXBKnPMpw8aAgOd5kDPU0LvYEK8ANDRCFkILnm3iaC7r6/W6kz/vLI0LvtVDqkD125XrYNDrmhEH4sHaRj6doP4eYLfJDCSD6efjbu/cKtslt3x4BlbmsJKqr6EtypA1IfzA1j82X32mgNFBqOwyBleW0MFzCVDHDOpzzZlJyF2Pd6Z6SztlSIKhLJnEVlt2NTHAlDoDWGDd4MTs+ZEmQ2bylyfHVjYbj0WA2nWqjeb4St/rmTO1nVgXzvJCYvraAepObOMk+U0l3TMNLu3/mN9LGkW/r2a9eRVAVW+WXr6HbAUtWS9W/t/2QOlxmgl63yMq8cnmsWyWtmZOFvg/LF9xwWbE/WV+2Nrzq4A976jmLjhx24tEwdZ6wBqwYja9q+qEZCQajCLJVz3BN3/fGem6Hau+YICyQvn0z+ZURb6FEK2CiVOo70bIFTBiK9RxB/ss+VDvtqcA6R828ZLazSx1pl5wHD2jVhYbJyrh6pPkKeKrYR7DpGpxssmD1X09csDIv4YLl2YMTfZVTdd9gE5CplbxUMzDEMtymAJ5ZPYKPSzmQsVbN3FciRuletO9FdY6mFklyeF5yyeWcAUOa0VTxu/CIaJ1ADpgy5pAkXWmKUiyOheSjDhV5OjjcYbxC6InK453KzQtfaQLT5iAV22GhYYifV2OATGGsBz1N7XxlUhpaAWNbWk3qHUq8SNEVqx3IrKELaKkv5hHhrwlhnZPfuBJ3w7WoGKkLiTgukEaRQy1Qe1Q3kB/1nrB3LWv6rbWGzKUeSL4dvrjq6Pek+V7DzmmfA0HKByqI2Y2EYk9UheLg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f955b07f-1f13-4469-3a6d-08dbe9c306e2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 12:20:04.8768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lLXibsOED9NGwvzZq4zyt6ojph6cd4CTmQUFH5hsaXpuwbtrUk/6gj1AEe+hIkSiAHYLSmui96ot29ioi7Db2eIEqVzr26nkazL5YHLhz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6212
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_10,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311200085
X-Proofpoint-ORIG-GUID: y-JqfMHpQIAKvPY7X9AlTUQ3RHQSjcLk
X-Proofpoint-GUID: y-JqfMHpQIAKvPY7X9AlTUQ3RHQSjcLk
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 11/11/2023 16:14, Jonathan Corbet wrote:
> Vegard Nossum <vegard.nossum@oracle.com> writes:
>> The Maintainer Entry Profile supplements the top-level process
>> documents
[...]
>> We currently only have 7 of these and I think it would be great to 
>> spread awareness of their existence so that we can have more.
>> Please mention this if there is a room full of subsystem
>> maintainers ;-)
> 
> I routinely mention it at the maintainers summit...progress is slow.

I saw that a maintainer entry profile is coming soon for ext4 (yay!):

   https://lore.kernel.org/workflows/20231119225437.GA292450@mit.edu/

I also recall the question/discussion from your talk about whether move
some of the documentation closer to their subsystems. Maybe the
maintainer entry profiles would be an ideal candidate to try this out as
an experiment? The advantages would be:

1) there's very few existing documents, so moving these into their
respective directories should cause relatively little churn,

2) probably no document is more tied to a specific subsystem than the
maintainer entry profiles,

3) it would hopefully yield far more visibility for these documents,
which would aid patch submitters as well as potentially inspire more
subsystems to add them.

I tried it out quickly, but Sphinx doesn't really like having documents
outside of the root -- how about just using symlinks? e.g.:

     ln -rs Documentation/filesystems/xfs-maintainer-entry-profile.rst 
fs/xfs/MAINTAINER-ENTRY-PROFILE.rst

I don't really see any downsides... thoughts?


Vegard
