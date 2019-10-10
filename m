Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0916FC4360C
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 07:39:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B158A218AC
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 07:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gandi.net header.i=@gandi.net header.b="HZbcYa3M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733149AbfJJHiK (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 03:38:10 -0400
Received: from mail12.gandi.net ([217.70.182.73]:37461 "EHLO gandi.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733081AbfJJHfP (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 10 Oct 2019 03:35:15 -0400
Received: from diconico07.dev (unknown [IPv6:2001:4b98:beef:a:e921:9c91:35ed:759a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by gandi.net (Postfix) with ESMTPSA id 0FBED160202;
        Thu, 10 Oct 2019 07:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gandi.net; s=20190808;
        t=1570692913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RDDfQ0tBkqJ0tgvKdiY+nGqUmdRNNm0TN4aivZpgb88=;
        b=HZbcYa3MP+cQvGThf4RXuOVbwdchqDGhtKGS9LK5bX4yEQCavGrWRLbcjg4fmZbmF9ZMkE
        1MH0MhxPy0WQ4R4759YWPy3LN4n/6mBUwx8VIWn6aYUyeWhmC1WS/KRM9Yt1Wh8/YlvEAT
        DvoV3g1LT10sX89uNoDX4Ful8yD/xQMcLykwec6mz0SGyScCG9CKGlAYz3YXF6ZT4x32XW
        1lw9riNjtEK9IMlkunvxYQgP/rvR4aCyaEn/ua+h5YelZrcVW1z4zwHqC1fS5LjSox57j7
        95b1s50U1V6CM9xr/3f6rVAZ96ZsLxP9GFC9wGjAZKW6Qp0BV2y1udz40Ce12Q==
Subject: Re: thoughts on a Merge Request based development workflow
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Eric Wong <e@80x24.org>
Cc:     Laura Abbott <labbott@redhat.com>, Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
References: <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <20191009222156.nedvmajswb3w3r3c@dcvr>
 <20191009235631.hhkbxoiqgzyypcer@pure.paranoia.local>
From:   Nicolas Belouin <nicolas.belouin@gandi.net>
Message-ID: <cf24af7f-6094-5b96-8e65-58b74bbee247@gandi.net>
Date:   Thu, 10 Oct 2019 09:35:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191009235631.hhkbxoiqgzyypcer@pure.paranoia.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 10/10/19 1:56 AM, Konstantin Ryabitsev wrote:
> On Wed, Oct 09, 2019 at 10:21:56PM +0000, Eric Wong wrote:
>> One of my long-term visions is to have an agreed upon way to
>> have entirely forkable development communities.  Git already
>> gave us forkable code repositories.
> FYI, this does already exist in the form of Fossil:
> https://www.fossil-scm.org/home/doc/trunk/www/index.wiki
>
> The main reason why we can't really consider it is because it requires
> moving away from git, which is a non-starter for anyone.
>
> -K
Maybe the solution is to build such kind of features within git,
many proposed solutions with tools over git or using git.
A tool over git has the issue of conveying the data and making
it non-centralized, whereas a tool using git is non-scalable because
of the way git is *currently* storing things.
Improving git to make it able to store many more objects (be it in-review
commits or previous versions of patches) and then use it to get the kind
of features we can envy from fossil.

Nicolas
