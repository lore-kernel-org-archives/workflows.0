Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D62FC6194
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 09:19:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D9232178F
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 09:19:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UKNGj0Ws"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfKHJTe (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 04:19:34 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:55688 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728513AbfKHJTe (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 04:19:34 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA898ZuD144716
        for <workflows@vger.kernel.org>; Fri, 8 Nov 2019 09:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=Zy9mriWD+ynv2uW9/rHSBdMtwrOmch+xWlTaSHG1nxo=;
 b=UKNGj0WsjpOvHkIysCKZBE6DJ+Pchhd/baoow1bU1lNPwLxBxOSg8rTmB+YAr0gTYIIn
 g2NGlFmjJ8N642Eo+vqPzeC78DcFXfSThOkfEeKx2jHUEpKLJAy0aKRnfPeK5fqx8Fn4
 G6tBNLpqFkjLw5luLjydm88D0JdAq7/9CTsYMKo7/wU0z4Yw3cP2DctgeHyX/BuvyMrt
 /DK/bXO+VGypaCYHqTf1LDJ42u/Km2uQon8kbbcDFg0B9Mo2yCdTwMman+2zPQf13JXT
 ME//cnGaO+KpW9vm+xHPzGmSyffTT8BEdvxmaODBw5xcoo8sWCBWXzvlbgNEageSC9KC ng== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2w41w1420a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <workflows@vger.kernel.org>; Fri, 08 Nov 2019 09:19:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xA898dpv084673
        for <workflows@vger.kernel.org>; Fri, 8 Nov 2019 09:19:31 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2w41wh9fuv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <workflows@vger.kernel.org>; Fri, 08 Nov 2019 09:19:31 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xA89JUf4021636
        for <workflows@vger.kernel.org>; Fri, 8 Nov 2019 09:19:30 GMT
Received: from [10.175.19.128] (/10.175.19.128)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 08 Nov 2019 01:19:30 -0800
Subject: Re: RFC: using supersedes: trailer to indicate patch/series revision
 flow
To:     workflows@vger.kernel.org
References: <20191107204349.hqpefgp7cowj6hof@chatter.i7.local>
From:   Vegard Nossum <vegard.nossum@oracle.com>
Message-ID: <9655e0d2-d901-4f1f-934d-e7bff1504d6c@oracle.com>
Date:   Fri, 8 Nov 2019 10:19:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107204349.hqpefgp7cowj6hof@chatter.i7.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9434 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911080091
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9434 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911080091
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


On 11/7/19 9:43 PM, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> The only mechanism we currently have for patch/series versioning is 
> subject suffixes. I think it would be useful to have a way to more 
> explicitly mark that a series obsoletes a previous version, and I 
> propose this is done with a `supersedes:` trailer at the end of the 
> cover letter or in the first patch of the series:

[...]

I think it's better to put it in the changelog itself (similar to S-O-B,
R-B, A-B, etc. lines) because it allows you to look the information up
straight from a commit once it has been merged.

This is what I suggested under "Step 3", second point here:

https://lore.kernel.org/workflows/b9fb52b8-8168-6bf0-9a72-1e6c44a281a5@oracle.com/

In the scheme I proposed, you would additionally refer to the previous
version by SHA1, which means diffing the patchsets would be as easy as
typing 'git diff' and then pasting the two SHA1s (which would both be
right there in front of you -- no need to follow lore links and applying
patches by hand to compare them).

This is just one data point, but in the team I work in this would be
incredibly useful to have -- we frequently look at upstream/merged
commits and sometimes want to compare them to mailing list submissions
and running git diff/log/range-diff is FAR easier than searching
mailing lists and applying series by hand or trying to figure out by
eyeballing email patches.

> Questions:
> 
[...]
> 2. Should supersedes: link to the previous version of the patch, or the 
>     first ever version of the patch? I am leaning towards the latter,    
> even though in this case the message-id largely becomes identical in    
> usage to Gerrit's Change-Id.

If you add the info to each patch, then it makes sense to link to the
previous version of that patch, since you can always find the first/last
patch from that.

If we also used the merge trick I described to refer to a whole patchset
with a single SHA1 then you can additionally link to the previous
version of that patchset from the merge commit, meaning you effectively
get both (one link in each patch to the previous version of _that_
patch, plus one link in the final merge commit to the previous version
of the full patchset).


Vegard
