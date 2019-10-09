Return-Path: <SRS0=9qbL=YC=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4F6C47404
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 21:54:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 074CC206B6
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 21:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570658060;
	bh=wNK4zlChJLSrkMAra8jjcyj5K3CGRkhklBlBhKe3TH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zIQzkI9DzWbZbwwtCfMX3pK7l7zJ2JwAzWdUWpG1ARMYcfAiR+j0s0GurcqN0Gf2d
	 cdQafUoLWxkz50AfkrHeEwVfz9+PnJeE7MR2dgmiL9TBJliJ4cXEv6Xg7yVeX47HyF
	 hL/oDtP1miW1ZnzAbZepEtsqcrcY199hC4fq9sfk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730815AbfJIVyT (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 9 Oct 2019 17:54:19 -0400
Received: from mail-qt1-f176.google.com ([209.85.160.176]:41516 "EHLO
        mail-qt1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbfJIVyT (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 9 Oct 2019 17:54:19 -0400
Received: by mail-qt1-f176.google.com with SMTP id v52so5663759qtb.8
        for <workflows@vger.kernel.org>; Wed, 09 Oct 2019 14:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=viM3RIZ6SGRfcC705UuRql9YZqmbKCjvbZupH9dZtfw=;
        b=W6Qrjs0CDeysL1iPKUdTKAcj4ubhZE+i+HX3e2Du7OuADYa/BgSnjSyH1zGK3F97q2
         Og4rm5vpc0yejX92cy8V1rYRsyhxOgy8dfEEgXQiIXcQ8aDQ79L4q14GBjKFnxuZD+Ng
         dO+WoXvMTmmmhm6Rbd5nbFOYS3pI0s9KcbE9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=viM3RIZ6SGRfcC705UuRql9YZqmbKCjvbZupH9dZtfw=;
        b=LQHrYplyrHTqVf+y2Qpbs8VDMWMXFPRjlfiLtg3KTJ4c79B4xHnPC+cKKmu3j+mcuD
         m8u8hTxKbqv57dTzrZiaQSxHCSQ3vUrtYshgoPq1kYeLQ7JiihO9bFwBs1+rPLLcmcGG
         CdG23sDhpmaRD/Kyp//+KrYU53EHVoa+M+9leuHs/IVdhka51aaOXxHpCv0uv/fPVmYx
         DQy2zX8CmaAOf81ubshqdbWMawjeUQx+YPGU/40H19XSGKjzh7mf59gAggvBWl6pdb+2
         SH88854FV/sQKRPHw1nqsb5q0vuqgcocutR/alDrpt7y3UjHP7wT3q5MmBUOvf77uuZX
         NnDQ==
X-Gm-Message-State: APjAAAWmOHl6VQQ5T+x362N7a32jrN76DjLpJRjWl/HnKMJFznovxueT
        snK2JUgSZvTeyXdScWZdjbGM4w==
X-Google-Smtp-Source: APXvYqwAAQG6g4PX39OyEE/AGEO/pzrINSHiOdHQsTGxDMiSwx3w1yhzc2/MRGQezdLN7eFk4x5/YQ==
X-Received: by 2002:aed:2a3b:: with SMTP id c56mr6580708qtd.343.1570658058555;
        Wed, 09 Oct 2019 14:54:18 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id u17sm1397763qkj.71.2019.10.09.14.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 14:54:17 -0700 (PDT)
Date:   Wed, 9 Oct 2019 17:54:16 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Laura Abbott <labbott@redhat.com>
Cc:     Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
 <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Oct 09, 2019 at 05:35:39PM -0400, Laura Abbott wrote:
>>This doesn't mean that forges are entirely out -- but they must remain 
>>mere tools that participate in a globally decentralized, 
>>developer-attestable, self-archiving messaging service. Maybe let's 
>>call that "kernel developer bus" or "kdbus" -- pretty sure that name 
>>hasn't been used before.
>>
>
>The big issue I see with anything decentralized is that as things
>grow people don't actually want to host their own infrastructure.
>Think about the decline in the number of people who host their own
>e-mail server. Anything decentralized would still presumably require
>a server somewhere, so you're going to either raising the bar to entry
>by requiring people to set up their own server or end up with people
>still relying on a service somewhere. This feels like it ends up with
>the situation we have today where most things are locally optimized
>but on average the situation is still lousy.
>
>You've articulated you've articulated the reasons against centralization
>very well from an admin point of view (which I won't dispute) but at
>least from a user point of view a centralized forge infrastructure is
>great because I don't have to worry about it. My university/company
>doesn't have to set anything up for me to contribute. I get we are
>probably going to end up optimizing more for the maintainer here but
>it's worth thinking about how we could get forge-like benefits where
>most users don't have to run infrastructure.

We're actually not in opposition to each-other -- I expect kernel.org
(via Linux Foundation) would provide convenient bridge tools to cover 
the precise concern you mention. Think kind of like 
patchwork.kernel.org, but instead of exclusively using some local 
database that only admins at kernel.org have access to, it would provide 
a set of feeds allowing anyone else to set up a fully functioning 
replica -- or participate in the process using their own compatible 
tools.

So, in other words, the forge is still there and is still providing a 
valuable service, but it is not the single point of truth that can 
vanish and take invaluable data with it. That's my vision, and I think 
we have all we need to achieve it short of resolve, buy-in, and proper 
tooling.

-K
