Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03ABC43331
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 00:10:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 932AC2085B
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 00:10:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfKHAKE (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 19:10:04 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21790 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725928AbfKHAKE (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 7 Nov 2019 19:10:04 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id xA808WxB059434
        for <workflows@vger.kernel.org>; Thu, 7 Nov 2019 19:10:03 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2w4u1vmm70-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <workflows@vger.kernel.org>; Thu, 07 Nov 2019 19:10:02 -0500
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <workflows@vger.kernel.org> from <ajd@linux.ibm.com>;
        Fri, 8 Nov 2019 00:10:00 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 8 Nov 2019 00:09:58 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xA809wAD38600860
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <workflows@vger.kernel.org>; Fri, 8 Nov 2019 00:09:58 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E4DB342047
        for <workflows@vger.kernel.org>; Fri,  8 Nov 2019 00:09:57 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 942084203F
        for <workflows@vger.kernel.org>; Fri,  8 Nov 2019 00:09:57 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP
        for <workflows@vger.kernel.org>; Fri,  8 Nov 2019 00:09:57 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 69F7BA020A
        for <workflows@vger.kernel.org>; Fri,  8 Nov 2019 11:09:55 +1100 (AEDT)
Subject: Re: RFC: using supersedes: trailer to indicate patch/series revision
 flow
To:     workflows@vger.kernel.org
References: <20191107204349.hqpefgp7cowj6hof@chatter.i7.local>
From:   Andrew Donnellan <ajd@linux.ibm.com>
Date:   Fri, 8 Nov 2019 11:09:56 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107204349.hqpefgp7cowj6hof@chatter.i7.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19110800-0028-0000-0000-000003B3B2DC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110800-0029-0000-0000-00002476148C
Message-Id: <9c5dc531-5edf-cb9a-9ddd-0bb1572c9b21@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-11-07_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911080000
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 8/11/19 7:43 am, Konstantin Ryabitsev wrote:
> Questions:
> 
> 1. Should this be exposed via git-format-patch flags, or just used by    
> specialized tooling?

I guess we might want to expose it through git format-patch for the sake 
of completeness? Though if people actually use it with git format-patch, 
then the answer to Q2 is irrelevant because people will use it to link 
to whatever the heck they feel like at the time...

Though what do you envision the user workflow actually looking like with 
a specialised tool?

> 2. Should supersedes: link to the previous version of the patch, or the 
>     first ever version of the patch? I am leaning towards the latter,    
> even though in this case the message-id largely becomes identical in    
> usage to Gerrit's Change-Id.

If we link to the first version of the patch, we can't tell that V3 
supersedes V2. Though if we link to only the previous version, we can't 
tell that V3 supersedes V1 without looking at V2.

 From a Patchwork perspective, if we were to use this to track patch 
versions I think we could work with either, except for some corner cases 
where mail is not received or received in the wrong order and there's 
not enough subject metadata to work things out.

You could also include multiple trailers e.g. the first version and last 
version, or all previous versions that are superseded, though that seems 
a bit verbose.

> 3. Should the supersedes trailer have:
>     a. message-id without brackets
>     b. message-id with brackets
>     c. https://lore.kernel.org/r/message-id
>     My preference is b, to match with The Message-Id header usage.

A or B makes the most sense.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

